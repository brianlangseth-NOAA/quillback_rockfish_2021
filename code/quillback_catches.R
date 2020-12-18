##############################################################################################################
#
# 	Purpose: Summarize Quillback Rockfish Landings
#
#			  by Brian Langseth 
#
##############################################################################################################

library(dplyr)
library(tidyr)
options(stringsAsFactors = FALSE)
devtools::load_all("U:/Stock assessments/dataModerate_2021")

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"
dir.create(file.path(dir, "output catch","plots"))

#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Load the recreational data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
# Washington - these files are in numbers of fish and include estimated discards
wa_rec = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish//data//RecFIN Catch//Quillback Sport Catch WA.csv")
wa_rec$Total_Removal_N = round(wa_rec$Total_Removal_N,0)

#Oregon - metric tons and include estimated discards (2001-2020)
or_rec = read.csv(file.path(dir, "RecFIN Catch","Quillback_FINAL RECREATIONAL LANDINGS_1979 - 2020_byMode.csv"), header = TRUE)

#California - has both mt and fish numbers (but the fish numbers have decimals)
ca_rec = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_rec_catch_all_2005-2019_crfs.csv")
ca_rec = ca_rec[ca_rec$Species.Name == "QUILLBACK ROCKFISH", ]
ca_rec_early = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/mrfss_catch_estimates_1980_2004_final.csv")
ca_rec_early = ca_rec_early[ca_rec_early$AGENCY_CODE == 6 & ca_rec_early$SPECIES_NAME == "Quillback Rockfish", ]

#California hitorical - all of these are from the NORTH category (from EJ based on Ralston reconstruction)
ca_rec_hist = read.csv(file.path(dir, "RecFIN Catch", "ca_hist_recreational_1928_1980_ej.csv"))

#################################################################################################################
# Evaluate the recreational data 
#################################################################################################################
#Washington-----------------------------------------------
#Not needed

#Oregon-----------------------------------------------
#Mode is either charter or private
#Percentages over time are pretty similar - no wild swings though private is more common now than in past
or_rec_mode_per = round(or_rec[,c("Total_C","Total_P")]/or_rec$Total,2)
plot(x = or_rec$Year, y = or_rec_mode_per$Total_C,type="l", ylim = c(0,1), ylab = "Percentage")
lines(x = or_rec$Year, y = or_rec_mode_per$Total_P, col=2)
legend("topleft", c("Charter","Private"), lty = 1, col = c(1,2), bty = "n")


#California-----------------------------------------------
# RecFIN years
#Add areas 
ca_rec$areas = recfin_areas(data = ca_rec, 
                            area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD")), 
                            area_names  = c("south", "north"), 
                            column_name = "RecFIN.Port.Name")
table(ca_rec$RecFIN.Port.Name,ca_rec$areas,useNA="always")

#Add modes (fleets)
mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"))
mode_names = c("rec_shore", "rec_boat")
mode_column_name = "RecFIN.Mode.Name"
ca_rec$mode <- NA
if(!is.null(mode_grouping)){
  for (a in 1:length(mode_grouping)){
    get <- paste(mode_grouping[[a]], collapse = "|")
    find = grep(get, ca_rec[, mode_column_name], ignore.case = TRUE)
    ca_rec$mode[find] = mode_names[a]
  }
}
table(ca_rec$RecFIN.Mode.Name,ca_rec$mode,useNA="always")
table(ca_rec$mode, ca_rec$areas,useNA="always")   

check = ca_rec[,"Total.Mortality.MT"] - (ca_rec[, "Retained.MT"] + ca_rec[, "Released.Dead.MT"])
plot(check)
ca_rec$diff_ratio = ca_rec[,"Total.Mortality.MT"] / (ca_rec[, "Retained.MT"] + ca_rec[, "Released.Dead.MT"])
# It looks like these columns may not match due to rounding in the preliminary calcs.

#Compare mortality values to ensure total is accurate
# Look at the mortality in MT
tot = aggregate(Total.Mortality.MT ~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE, na.rm = TRUE)
ret = aggregate(Retained.MT~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE, na.rm = TRUE)
rel_dead  = aggregate(Released.Dead.MT~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE, na.rm = TRUE)
rec_mt = cbind(tot, ret$Retained.MT, rel_dead$Released.Dead.MT)
colnames(rec_mt) = c("year", "areas", "tot_mort", "retsained_mt", "rel_dead_mt")
rec_mt[is.na(rec_mt)] = 0

# Now lets compare this information by the Num category
tot_num = aggregate(Total.Mortality.Num ~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
ret_num = aggregate(Retained.Num~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
rel_dead_num  = aggregate(Released.Dead.Num~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
rec_num = cbind(tot_num, ret_num$Retained.Num, rel_dead_num$Released.Dead.Num)
colnames(rec_num) = c("year", "areas", "tot_mort", "retained_num", "rel_dead_num")
rec_num[is.na(rec_num)] = 0

#These are very similar patterns and Budrick recommended just looking at metric ton values
ca_rec_table = data.frame(Year = rec_mt[rec_mt$areas == "north", "year"],
                    North = rec_mt[rec_mt$areas == "north", "tot_mort"],
                    South = rec_mt[rec_mt$areas == "south", "tot_mort"])
# write.csv(ca_rec_table, file = file.path(dir, "output catch", "quillback_ca_recreational_total_mortalityMT.csv"))


# MRFSS Years
#Add modes
ca_rec_early$mode = -1
ca_rec_early$mode[ca_rec_early$RECFIN_MODE_NAME %in% c("Party/Charter Boats", "Private/Rental Boats" )] = "mrfss_boat"
ca_rec_early$mode[ca_rec_early$RECFIN_MODE_NAME %in% c("Beach/Bank", "Man-Made/Jetty", "Shore" )] = "mrfss_shore"
table(ca_rec_early$RECFIN_MODE_NAME, ca_rec_early$mode, useNA = "always")

#Check and add areas
table(ca_rec_early$RECFIN_SUB_REGION_NAME,ca_rec_early$SOURCE_AREA_CODE,useNA="always")
table(ca_rec_early$RECFIN_SUB_REGION_NAME,ca_rec_early$RECFIN_WATER_AREA_CODE,useNA="always")
ca_rec_early$areas = NA
ca_rec_early$areas[ca_rec_early$RECFIN_SUB_REGION_NAME == "Northern California"] = "north"
ca_rec_early$areas[ca_rec_early$RECFIN_SUB_REGION_NAME == "Southern California"] = "south"
table(ca_rec_early$RECFIN_SUB_REGION_NAME,ca_rec_early$areas,useNA="always")

#Compare catches with landings
cacatches = aggregate(TOT_CAT ~ YEAR_ + areas, data = ca_rec_early, FUN = sum, drop = FALSE, na.rm = TRUE)
calandings = aggregate(LANDING ~ YEAR_ + areas, data = ca_rec_early, FUN = sum, drop = FALSE, na.rm = TRUE)
plot(cacatches$YEAR_,cacatches$TOT_CAT,type="l")
lines(calandings$YEAR_,calandings$LANDING,type="l",col=2)
calandings[is.na(calandings)] = 0

#Asked Budrick what to use and WGT_AB1 includes landings and discards (so total mortality) and is in KGs
catotalmort = aggregate(WGT_AB1 ~ YEAR_ + areas, data = ca_rec_early, FUN = sum, drop = FALSE, na.rm = TRUE)
catotalmort$WGT_AB1 = catotalmort$WGT_AB1/1000
catotalmort[is.na(catotalmort)] = 0
ca_mrfss_table = data.frame(Year = catotalmort[catotalmort$areas == "north", "YEAR_"],
                          North = catotalmort[catotalmort$areas == "north", "WGT_AB1"],
                          South = catotalmort[catotalmort$areas == "south", "WGT_AB1"])
#write.csv(ca_mrfss_table, file = file.path(dir, "output catch", "quillback_ca_mrfss_total_motalityMT.csv"))

#Calculate percentage of AB1 (TSPCLAIM + TSP_HARV) that were B1 (TSP_HARV) by NUMBER.
percB1 = ca_rec_early$TSP_HARV/(ca_rec_early$TSP_HARV + ca_rec_early$TSPCLAIM)
yearly_percB1 = aggregate(cbind(ca_rec_early$YEAR_,percB1),by = list(ca_rec_early$YEAR_), FUN = mean, na.rm = TRUE)
ca_rec_discard_rate = 1+mean(yearly_percB1$percB1, na.rm = TRUE)


####
#Combine all
####
rec_all_table = data.frame(Year = min(wa_rec$Year, or_rec$Year,ca_mrfss_table$Year,ca_rec_hist$Year):2020)
rec_all_table$WA_land_num = merge(rec_all_table, wa_rec, by = "Year", all = TRUE)$Total_Removal_N
rec_all_table$OR_mort_mt = merge(rec_all_table, or_rec[,c("Year","Total")], by = "Year", all = TRUE)$Total
rec_all_table$CA_N_mort_mt = merge(rec_all_table, rbind(ca_mrfss_table[,c("Year","North")], ca_rec_table[,c("Year","North")]), by = "Year", all = TRUE)$North
rec_all_table$CA_N_land_mt = merge(rec_all_table, ca_rec_hist[,c("Year","QLBKmt_North")], by = "Year", all = TRUE)$QLBKmt_North
rec_all_table$CA_S_mort_mt = merge(rec_all_table, rbind(ca_mrfss_table[,c("Year","South")], ca_rec_table[,c("Year","South")]), by = "Year", all = TRUE)$South
rec_all_table$CA_S_land_mt = merge(rec_all_table, ca_rec_hist[,c("Year","QLBKmt_South")], by = "Year", all = TRUE)$QLBKmt_South
rec_all_table[is.na(rec_all_table)] = 0
#Add linear interpolation of missing years (1990-1992) of data for California
imput_slopeN = (rec_all_table[rec_all_table$Year==1993,"CA_N_mort_mt"] - rec_all_table[rec_all_table$Year==1989,"CA_N_mort_mt"]) / 4
rec_all_table[rec_all_table$Year %in% c(1990:1992),"CA_N_mort_mt"] = rec_all_table[rec_all_table$Year==1989,"CA_N_mort_mt"] + imput_slopeN*1:3



#################################################################################################################
# Plot the recreational data 
#################################################################################################################
#Washington-----------------------------------------------
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Rec_WA_Catch.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1,1))
barplot(wa_rec$Total_Removal_N, main = "Recreational - Washigton",
        col = "blue", ylim = c(0, ceiling(max(wa_rec[,"Total_Removal_N"]))), names.arg = wa_rec$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (numbers)", line = 2.5)
dev.off()

#Oregon-----------------------------------------------
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Rec_OR_Catch.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1,1))
barplot(or_rec$Total, main = "Recreational - Oregon",
        col = "purple", ylim = c(0, ceiling(max(or_rec$Total))), names.arg = or_rec$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
dev.off()

#California-----------------------------------------------
ylim_mt = max(rec_mt$tot_mort)*1.2
ylim_num = max(rec_num$tot_mort)*1.2
#Comparison plot between metric tons and number
pngfun(wd = file.path(dir, "output catch", "plots"), file = "CA_rec_mt_vs_num_2005_2019.png")
par(mfrow = c(2,2))
plot(rec_mt[rec_mt$areas == "south", "year"], rec_mt[rec_mt$areas == "south", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
     ylab = "Total Mortality (mt)", ylim = c(0, ylim_mt), main = "South of Pt. Conception")
plot(rec_mt[rec_mt$areas == "north", "year"], rec_mt[rec_mt$areas == "north", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
     ylab = "Total Mortality (mt)", ylim = c(0, ylim_mt), main = "North of Pt. Conception")

plot(rec_num[rec_num$areas == "south", "year"], rec_num[rec_num$areas == "south", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
     ylab = "Total Mortality (numbers)", ylim = c(0, ylim_num), main = "South of Pt. Conception")
plot(rec_num[rec_num$areas == "north", "year"], rec_num[rec_num$areas == "north", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
     ylab = "Total Mortality (numbers)", ylim = c(0, ylim_num), main = "North of Pt. Conception")
dev.off()

# Budrick suggested just looking at metric ton values - So plot of metric tons
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Rec_CA_Catch_Area_2005_2019.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,1))
barplot(rec_mt[rec_mt$areas == "north", "tot_mort"], main = "Recreational - North of Pt. Conception",
        col = "orange", ylim = c(0, ylim_mt), names.arg = rec_mt[rec_mt$areas == "north", "year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
barplot(rec_mt[rec_mt$areas == "south", "tot_mort"], main = "Recreational - South of Pt. Conception",
        col = "red", ylim = c(0, ylim_mt), names.arg = rec_mt[rec_mt$areas == "south", "year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
dev.off()

#Plot of MRFSS data in MT
ylim_mrfss_mt = max(catotalmort$WGT_AB1)*1.2
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Rec_CA_Catch_Area_1980_2004.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,1))
barplot(catotalmort[catotalmort$areas == "north", "WGT_AB1"], main = "Recreational - North of Pt. Conception",
        col = "orange", ylim = c(0, ylim_mrfss_mt), names.arg = catotalmort[catotalmort$areas == "north", "YEAR_"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
barplot(catotalmort[catotalmort$areas == "south", "WGT_AB1"], main = "Recreational - South of Pt. Conception",
        col = "red", ylim = c(0, ylim_mrfss_mt), names.arg = catotalmort[catotalmort$areas == "south", "YEAR_"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
dev.off()

#Plot of historical data in MT
ylim_hist_mt = max(ca_rec_hist$QLBKmt_North)*1.2
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Rec_CA_Catch_Area_1928_1980.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,1))
barplot(ca_rec_hist$QLBKmt_North, main = "Recreational - North of Pt. Conception",
        col = "orange", ylim = c(0, ylim_hist_mt), names.arg = ca_rec_hist$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landings (mt)", line = 2.5)
barplot(ca_rec_hist$QLBKmt_South, main = "Recreational - South of Pt. Conception",
        col = "red", ylim = c(0, ylim_hist_mt), names.arg = ca_rec_hist$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landings (mt)", line = 2.5)
dev.off()


#ALL
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Rec_Catch_All_Areas.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,2))
barplot(rec_all_table$CA_S_mort_mt, 
        main = "Recreational - South of Pt. Conception", col = "red", ylim = c(0, 1), 
        names.arg = rec_all_table$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mort. or Land. (mt)", line = 2.5)
#EJ states that Ralston et al. 2010 consider their own estimate of landings in 1980 to be better than
#the estimate of total mortality from MRFSS in 1980
barplot(c(rec_all_table[rec_all_table$Year <= 1980,"CA_N_land_mt"], rec_all_table[rec_all_table$Year > 1980,"CA_N_mort_mt"]),
        main = "Recreational - North of Pt. Conception", col = "orange", ylim = c(0, max(ylim_mt, ylim_mrfss_mt)), 
        names.arg = rec_all_table$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mort. or Land. (mt)", line = 2.5)
barplot(or_rec[,"Total"], main = "Recreational - Oregon",  #In plot for data workshop I had wrongly used or_rec[,2] which is just charter (not)
        col = "purple", ylim = c(0, 15), names.arg = or_rec$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
barplot(wa_rec[,"Total_Removal_N"], main = "Recreational - Washigton",
        col = "blue", ylim = c(0, ceiling(max(wa_rec[,"Total_Removal_N"])) + 200), names.arg = wa_rec$Year)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (numbers)", line = 2.5)
dev.off()




#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Load the commercial data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
# PacFIN Commercial
load(file.path(dir, "PacFIN Catch", "QLBK.CompFT.20.Aug.2020.RData"))
com = QLBK.CompFT.20.Aug.2020
rm(QLBK.CompFT.20.Aug.2020)

# Oregon Catches - metric tons
or_com_data = read.csv(file.path(dir, "PacFin Catch", "Quillback_FINAL COMMERCIAL LANDINGS_1892 - 2020_byGear.csv"))

# California Historical Catches (from EJ based on Ralston reconstruction)
#1916-1968 data have other and trawl gear, but in csv they are aggregated into a single time series. 
#These are in mt
ca_com_hist1 = read.csv(file.path(dir, "PacFin Catch", "ca_hist_commercial_1916_1968_ej.csv"))
#1968-1980 data have hook and line and trawl gear, but in csv they are aggregated into time series by area. 
#These are in lbs
ca_com_hist2 = read.csv(file.path(dir, "PacFin Catch", "ca_hist_commercial_1969_1980_ej.csv"))
ca_com_hist2[is.na(ca_com_hist2$Grand.Total),"Grand.Total"] = 0

# Washington historical - lots of unidentified species very few QLBK
wa_com_hist = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/wa/Coastal Commercial Rockfish_FinalFishTicketAllWithAllComps_1904-1980.csv")
wa_com_hist = wa_com_hist[wa_com_hist$SPID == "QLBK",]
wa_com_hist_agg = aggregate(SpeciesPounds ~ Year, data = wa_com_hist, FUN=sum )
wa_com_hist_agg$SpeciesMT =  wa_com_hist_agg$SpeciesPounds / 2204.62262
wa_com_hist_agg_gear = aggregate(SpeciesPounds ~ Year + GearGroup_SpeciesComp, data = wa_com_hist, FUN=sum )
wa_com_hist_agg_gear$SpeciesMT = wa_com_hist_agg_gear$SpeciesPounds / 2204.62262

# Grab the WGCOP GEMM data
gemm = read.csv(file.path(dir, "PacFin Catch", "quillback_gemm_mortality_and_discard.csv"))
# and now the state specific dead_discard values
gemm_dead_discards = read.csv(file.path(dir, "PacFin Catch", "quillback_commercial_discard.csv"))


#################################################################################################################
# Evaluate the commercial data 
#################################################################################################################
#Oregon-----------------------------------
#Gear code
#120   Ocean troll
#300   Fish pot
#340   Hook and line
#350   Longline
#360   Midwater trawl
#390   Groundfish trawl
#391   bottom trawl
#392   bottom trawl
#393   flatfish trawl
#400   crab pot
#430   dredge
#999   other
tmp = aggregate(Landings_mt ~ Year + Gear_Code, data = or_com_data, FUN = sum, na.rm = TRUE)
or_com_yg = data.frame(pivot_wider(tmp, id_cols = c("Year"), names_from = "Gear_Code", values_from = "Landings_mt"))
or_com_yg[is.na(or_com_yg)] = 0
or_com_yg = or_com_yg[order(or_com_yg$Year),]
or_com_bygear = data.frame(Year = or_com_yg$Year,
                           hookline = or_com_yg[,"X340"],
                           longline = or_com_yg[,"X350"],
                           troll = or_com_yg[,"X120"],
                           other = rowSums(or_com_yg[,c("X300","X400","X360","X390","X391","X392","X393","X430","X999")]))
                           

or_com = aggregate(Landings_mt ~ Year, data = or_com_data, FUN = sum, na.rm = TRUE)


#PacFin-----------------------------------
com$round_mt = com$CATCH.LBS / 2204.62262

#Determine live vs dead
table(com$DISP,com$AGID,useNA="always")
#DISPOSITION  A      animal food                                                                     
#             B      bait                                                                            
#             C      human food (canned)                                                             
#             D      discard (shoreside discard; spoiled)                                            
#             F      landed live (human food eventually)                                             
#             H      human food                                                                      
#             I      investigation (research)                                                        
#             L      live (aquarium use)                                                             
#             O      other known dispositions                                                        
#             P      personal use                                                                    
#             R      reduction                                                                       
#             S      seized (illegal)                                                                
#             T      tagged fish                                                                     
#             U      unspecified                                                                     
#             W      confiscated "overage" catch that was sold (revenues forwarded to the state)     
#             X      discard (at sea) 
#Unknown dispositions are asigned to dead for CA, and both for OR

#Determine fleet
# According to Ali - the live vs. dead fishery are catching the same fish and there will
# likely be no difference in selectivity.
com$fleet = NA
com$fleet[which(com[,"AGID"] == "O")] = 'both'
com$fleet[which(com[,"AGID"] == "W")] = 'dead'
com$fleet[which(com[, "DISP"] == "F" & com[,"AGID"] == "C")] = "alive"
com$fleet[which(com[, "DISP"] != "F" & com[,"AGID"] == "C")] = "dead"
table(com$fleet, com$AGID, useNA = "always")

#Determine gear
table(com$GRID,com$AGID)
twl = c('FFT', 'FTS', "GFL", 'GFS', 'GFT', 'MDT', 'RLT', 'SST')
longline = c('LGL')
pole = c('POL')
hkl = c('OHL', 'VHL')
net = c('DGN', 'DNT', 'DPN', 'GLN', 'SEN', 'STN')
com$gear = NA
com$gear[which(com$GRID %in% twl)] = 'twl'
com$gear[which(com$GRID %in% longline)] = 'longline'
com$gear[which(com$GRID %in% pole)] = 'pole'
com$gear[which(com$GRID %in% hkl)] = 'hkl'
com$gear[which(com$GRID %in% net)] = 'net'
com$gear[which(is.na(com$gear))] = 'other'
table(com$GRID, com$gear, useNA = "always")
table(com$GRID, com$gear,com$AGID, useNA = "always")
#This is different than the gear groupings in the data
table(com$gear,com$GRGROUP,useNA="always")

#Determine area
com$area = com$AGID
# All areas south of Point Conception
south_ca = c("DNA","HNM","LGB","NWB","OBV", "OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
find = which(com$PCID %in% south_ca)
com$area[find] = "south_ca"
table(com$PCID, com$area, useNA = "always")
table(com$gear, com$area, useNA = "always")



#Combine PacFIN data into gear area dataset
tmp = aggregate(round_mt ~ YEAR + gear + area, data = com, FUN = sum, drop = FALSE)
tmp[is.na(tmp$round_mt), "round_mt"] = 0
catch_gear_df = data.frame(year = sort(unique(tmp$YEAR)),
                              s_ca_hkl = tmp[tmp$gear == "hkl" & tmp$area == "south_ca", "round_mt"] + tmp[tmp$gear == "pole"& tmp$area == "south_ca", "round_mt"],
                              n_ca_hkl = tmp[tmp$gear == "hkl" & tmp$area == "C", "round_mt"] + tmp[tmp$gear == "pole"& tmp$area == "C", "round_mt"],
                              or_hkl = tmp[tmp$gear == "hkl" & tmp$area == "O", "round_mt"] + tmp[tmp$gear == "pole"& tmp$area == "O", "round_mt"],
                              wa_hkl = tmp[tmp$gear == "hkl" & tmp$area == "W", "round_mt"] + tmp[tmp$gear == "pole"& tmp$area == "W", "round_mt"],
                              s_ca_lgl = tmp[tmp$gear == "longline" & tmp$area == "south_ca", "round_mt"],
                              n_ca_lgl = tmp[tmp$gear == "longline" & tmp$area == "C", "round_mt"],
                              or_lgl = tmp[tmp$gear == "longline" & tmp$area == "O", "round_mt"],
                              wa_lgl = tmp[tmp$gear == "longline" & tmp$area == "W", "round_mt"],
                              s_ca_other = tmp[tmp$gear == "net"& tmp$area == "south_ca", "round_mt"] + tmp[tmp$gear == "other"& tmp$area == "south_ca", "round_mt"] + tmp[tmp$gear == "twl"& tmp$area == "south_ca", "round_mt"],
                              n_ca_other = tmp[tmp$gear == "net"& tmp$area == "C", "round_mt"] + tmp[tmp$gear == "other"& tmp$area == "C", "round_mt"] + tmp[tmp$gear == "twl"& tmp$area == "C", "round_mt"],
                              or_other = tmp[tmp$gear == "net" & tmp$area == "O", "round_mt"] + tmp[tmp$gear == "other"& tmp$area == "O", "round_mt"] + tmp[tmp$gear == "twl"& tmp$area == "O", "round_mt"],
                              wa_other = tmp[tmp$gear == "net" & tmp$area == "W", "round_mt"] + tmp[tmp$gear == "other"& tmp$area == "W", "round_mt"] + tmp[tmp$gear == "twl"& tmp$area == "W", "round_mt"])

#Determine proportion of gear
percent_by_gear = round(catch_gear_df[ , 2:dim(catch_gear_df)[2]] / 
                          apply(catch_gear_df[ , 2:dim(catch_gear_df)[2]], 1, sum), 2)
# Nearly all california commercial catches comes from pole or longline gear 
aggregate(com[com$AGID == "C",]$round_mt, by = list(com[com$AGID == "C",]$gear), FUN = sum, na.rm = TRUE)
# Nearly all oregon commercial catches comes from hook and line or longline gear 
aggregate(com[com$AGID == "O",]$round_mt, by = list(com[com$AGID == "O",]$gear), FUN = sum, na.rm = TRUE)
# Nearly all washington commercial catches comes from trawl 
aggregate(com[com$AGID == "W",]$round_mt, by = list(com[com$AGID == "W",]$gear), FUN = sum, na.rm = TRUE)

# By percent:
apply(percent_by_gear, 2, mean, na.rm = TRUE)

#Determine proportion of area across all areas
tmp = aggregate(com$round_mt, list(year = com$YEAR, area = com$area), FUN = sum, drop = FALSE)
catch_area_df = data.frame(year = sort(unique(tmp$year)),
                           n_ca = tmp[tmp$area == "C", "x"],
                           s_ca = tmp[tmp$area == "south_ca", "x"],
                           or   = tmp[tmp$area == "O", "x"], 
                           wa   = tmp[tmp$area == "W", "x"])
catch_area_df[is.na(catch_area_df)] = 0

percent_by_area = round(catch_area_df[ , 2:dim(catch_area_df)[2]] / 
                          apply(catch_area_df[ , 2:dim(catch_area_df)[2]], 1, sum), 2)
# 66% of the PacFIN commercial catch is occurring north of point conception
apply(percent_by_area, 2, mean)
#n_ca       s_ca         or         wa 
#0.66594595 0.00000000 0.27405405 0.05945946 


#Divide Pacfin into dead vs. alive dataset
tmp = aggregate(round_mt ~ YEAR + area + fleet, data = com, FUN = sum, drop = FALSE)
catch_state_dead_alive_df = data.frame(year = sort(unique(tmp$YEAR)),
                                       s_ca_dead = tmp[tmp$area == "south_ca" &tmp$fleet == "dead", "round_mt"],
                                       n_ca_dead = tmp[tmp$area == "C" &tmp$fleet == "dead", "round_mt"],
                                       s_ca_alive = tmp[tmp$area == "south_ca" &tmp$fleet == "alive", "round_mt"],
                                       n_ca_alive = tmp[tmp$area == "C" &tmp$fleet == "alive", "round_mt"],
                                       or = tmp[tmp$area == "O" & tmp$fleet == "both", "round_mt"],
                                       wa = tmp[tmp$area == "W" & tmp$fleet == "dead", "round_mt"])
catch_state_dead_alive_df[is.na(catch_state_dead_alive_df)] = 0


#Combine PacFIN with all other datasets for alive dead
all_dead_alive = matrix(0, length(1892:2020), 7)
colnames(all_dead_alive) = colnames(catch_state_dead_alive_df)
all_dead_alive[,"year"] = 1892:2020
#From PacFIN
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "s_ca_dead"] = catch_state_dead_alive_df[, "s_ca_dead"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "s_ca_alive"] = catch_state_dead_alive_df[, "s_ca_alive"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "n_ca_dead"] = catch_state_dead_alive_df[, "n_ca_dead"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "n_ca_alive"] = catch_state_dead_alive_df[, "n_ca_alive"]
#From historical ca (assume 1916-1968 is dead, 1969-1980 is dead)
all_dead_alive[which(all_dead_alive[,"year"] %in% ca_com_hist1$Year),"n_ca_dead"] = ca_com_hist1[,"QLBKmt"]
all_dead_alive[which(all_dead_alive[,"year"] %in% ca_com_hist2$Year),"n_ca_dead"] = ca_com_hist2[,"Grand.Total"]/2204.62
#Other states
all_dead_alive[, "or"] = or_com[which(all_dead_alive[,"year"] %in% or_com$Year), "Landings_mt"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "wa"] = catch_state_dead_alive_df[, "wa"]
all_dead_alive[which(all_dead_alive[,"year"] %in% wa_com_hist_agg$Year), "wa"] = wa_com_hist_agg[,"SpeciesMT"]


#Combine PacFIN with all other datasets in general
all_com = matrix(NA, length(1892:2020), 4)
colnames(all_com) = c("s_ca", "n_ca", "or", "wa")
rownames(all_com) = 1892:2020
all_com[rownames(all_com) %in% catch_area_df$year, "s_ca"] = catch_area_df[,"s_ca"]
all_com[rownames(all_com) %in% catch_area_df$year, "n_ca"] = catch_area_df[,"n_ca"]
all_com[rownames(all_com) %in% ca_com_hist2$Year, "n_ca"] = ca_com_hist2[,"Grand.Total"]/2204.62
all_com[rownames(all_com) %in% ca_com_hist1$Year, "n_ca"] = ca_com_hist1[,"QLBKmt"]
all_com[rownames(all_com) %in% or_com$Year, "or"] = or_com$Landings_mt
all_com[rownames(all_com) %in% catch_area_df$year, "wa"] = catch_area_df[,"wa"]
all_com[rownames(all_com) %in% wa_com_hist_agg$Year, "wa"] = wa_com_hist_agg$SpeciesMT
all_com[is.na(all_com)] = 0

#Determine commercial discard rates <2002. Take mean of 2002 to 2018 (since 2019 showed increases due to changes in regulation).
#For washington only take average for years where both discard and catch data were available
ca_com_discard_rate = 1 + mean(gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2018), "ca"] / 
  (gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2018), "ca"] + all_com[rownames(all_com) %in% c(2002:2018),"s_ca"] +
     all_com[rownames(all_com) %in% c(2002:2018),"n_ca"]))
or_com_discard_rate = 1 + mean(gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2018), "or"] / 
  (gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2018), "or"] + all_com[rownames(all_com) %in% c(2002:2018),"or"]))
#Both catch and discard data only available in 2002:2004, 2006, 2014
cbind(all_com[rownames(all_com) %in% c(2002:2018),"wa"],gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2018), "wa"])
wa_com_discard_rate = 1 + mean(gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2004,2006,2014), "wa"] / 
  (gemm_dead_discards[gemm_dead_discards$Year %in% c(2002:2004,2006,2014), "wa"] + all_com[rownames(all_com) %in% c(2002:2004,2006,2014),"wa"]))



#################################################################################################################
# Plot the commercial data
#################################################################################################################
# Plot all commercial catch by area and live versus dead catches
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Commercial_Catch_All_Alive_Dead.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,2))
barplot(all_dead_alive[, "s_ca_dead"] + all_dead_alive[, "s_ca_alive"], 
        main = "South of Pt. Conception", col = "red", ylim = c(0, 0.1), names.arg = all_dead_alive[ ,"year"])
barplot(all_dead_alive[, "s_ca_dead"], col = "purple", add = TRUE)
legend("topright", bty = 'n', legend = c("Alive", "Dead"),
       lwd = 2, lty = 1, col = c('red', 'purple'))
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
barplot(all_dead_alive[, "n_ca_dead"] + all_dead_alive[, "n_ca_alive"], 
        main = "North of Pt. Conception", col = "red", ylim = c(0, 60), names.arg = all_dead_alive[ ,"year"])
barplot(all_dead_alive[, "n_ca_dead"], col = "purple", add = TRUE)
legend("topleft", bty = 'n', legend = c("Alive", "Dead"),
       lwd = 2, lty = 1, col = c('red', 'purple'))
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
barplot(all_dead_alive[, "or"], main = "Oregon", col = "green", 
        ylim = c(0, ceiling(max(all_dead_alive[, "or"]))), names.arg = all_dead_alive[, "year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
barplot(all_dead_alive[, "wa"], main = "Washington", col = "blue", 
        ylim = c(0, ceiling(max(all_dead_alive[, "or"]))), names.arg = all_dead_alive[ ,"year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
dev.off()

# Plot all commercial catch by area
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Commercial_Catch_All.png", w = 12, h = 7, pt = 12)
plot(0, 0, type = 'l', xlim = c(1940, 2020), ylim = c(0, max(all_com)), ylab = "Catch (mt)", xlab = "Year", main = "Commercial Catch")
lines(rownames(all_com), all_com[,"s_ca"], lwd = 2, col = "red")
lines(rownames(all_com), all_com[,"n_ca"], lwd = 2, col = 'orange')
lines(rownames(all_com), all_com[,"or"],   lwd = 2, col = 'purple')
lines(rownames(all_com), all_com[,"wa"],   lwd = 2, col = 'blue')
legend("topright", bty = 'n', legend = c("S. Pt. Conception", "N. Pt. Conception", "Oregon", "Washington"),
       lwd = 2, lty = 1, col = c('red', 'orange', 'purple', 'blue'))
dev.off()

#Plot comercial by gear
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Commercial_Catch_All_Gear.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,2))
matplot(x = catch_gear_df[,"year"], y = catch_gear_df[,c("s_ca_hkl","s_ca_lgl","s_ca_other")], type = "l", col = c(1,2,3),
        lty=c(1,2,3), lwd = 2, ylab = "Landings (mt)", main = "S. Pt. Conception", xlab = "Year")
legend("topleft",c("hkl","lgl","other"),lty=c(1,2,3),col=c(1,2,3), bty="n", lwd = 2)
matplot(x = catch_gear_df[,"year"], y = catch_gear_df[,c("n_ca_hkl","n_ca_lgl","n_ca_other")], type = "l", col = c(1,2,3),
        lty=c(1,2,3), lwd = 2, ylab = "Landings (mt)", main = "N. Pt. Conception", xlab = "Year")
legend("topright",c("hkl","lgl","other"),lty=c(1,2,3),col=c(1,2,3), bty="n", lwd = 2)
matplot(x = or_com_bygear[,"Year"], y = or_com_bygear[,-1], type = "l", col=c(1,2,4,3), lty=c(1,2,4,3), lwd = 2,
        ylab = "Landings (mt)", main = "Oregon", xlab = "Year")
legend("topleft",c("hkl","lgl","troll","other"),lty=c(1,2,4,3),col=c(1,2,4,3),bty="n", lwd = 2)
wa_hist_catch_matrix = matrix(0,nrow=length(1904:1983), ncol = 3, dimnames = list(c(1904:1983), c("wa_hkl","wa_lgl","wa_other")))
wa_hist_catch_matrix[,3] = all_com[which(rownames(all_com) %in% rownames(wa_hist_catch_matrix)),"wa"]
matplot(x = c(rownames(wa_hist_catch_matrix),catch_gear_df[,"year"]), y = rbind(wa_hist_catch_matrix,catch_gear_df[,c("wa_hkl","wa_lgl","wa_other")]), type = "l", col = c(1,2,3),
        lty=c(1,2,3), lwd = 2, ylab = "Landings (mt)", main = "Washington", xlab = "Year")
legend("topleft",c("hkl","lgl","other"),lty=c(1,2,3),col=c(1,2,3), bty="n", lwd = 2)
dev.off()




#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Additional plots
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
# Plot all catches, both commercial and recreational by area
x = c(1892, 2020); y = c(0, max(all_com)); yy = c(0,max(rec_all_table[,3:5]))
pngfun(wd = file.path(dir, "output catch", "plots"), file = "All_Catch_by_Area.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2, 4))
plot(rownames(all_com), all_com[, "s_ca"], xlim = x, ylim = y, 
     type = 'l', ylab = "Catch (mt)", xlab = "Year", main = "Commercial - S. Pt. Conception", lwd = 2, col = "red")
plot(rownames(all_com), all_com[, "n_ca"], xlim = x, ylim = y, 
     type = 'l', ylab = "Catch (mt)", xlab = "Year", main = "Commercial - N. Pt. Conception", lwd = 2, col = "orange")
plot(rownames(all_com), all_com[, "or"],   xlim = x, ylim = y, 
     type = 'l', ylab = "Catch (mt)", xlab = "Year", main = "Commercial - Oregon", lwd = 2, col = "purple")
plot(rownames(all_com), all_com[, "wa"],   xlim = x, ylim = y, 
     type = 'l', ylab = "Catch (mt)", xlab = "Year", main = "Commercial - Washington", lwd = 2, col = 'blue')
plot(rec_all_table$Year, c(rec_all_table[rec_all_table$Year <= 1980,]$CA_S_land_mt, rec_all_table[rec_all_table$Year > 1980,]$CA_S_mort_mt), 
     type = 'l', lwd = 2, xlab = "Year", ylab = "Total Mort. or Land. (mt)", ylim = yy, xlim = x, col = "red",
     main = "Recreation - S. Pt. Conception")
plot(rec_all_table$Year, c(rec_all_table[rec_all_table$Year <= 1980,]$CA_N_land_mt, rec_all_table[rec_all_table$Year > 1980,]$CA_N_mort_mt), 
     type = 'l', lwd = 2, xlab = "Year", ylab = "Total Mort. or Land. (mt)", ylim = yy, xlim = x, col = "orange",
     main = "Recreation - N. Pt. Conception")
plot(rec_all_table$Year, rec_all_table$OR_mort_mt, 
     type = 'l', lwd = 2, xlab = "Year", ylab = "Total Mortality (mt)", ylim = yy, xlim = x, col = "purple",
     main = "Recreation - Oregon")
plot(rec_all_table$Year, rec_all_table$WA_land_num,
     type = 'l', lwd = 2, xlab = "Year", ylab = "Catch (numbers)", xlim = x, col = "blue",
     main = "Recreational - Washington")
dev.off()


#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Plot the GEMM data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
pngfun(wd = file.path(dir, "output catch", "plots"), file = "Discard_Data_from_GEMM.png", w = 14, h = 7, pt = 12)
par(mfrow = c(1,2), mar = c(4,5,4,1), oma = c(1,1,1,1))
barplot(gemm[gemm$Area == "commercial", "Dead_Discard"], las = 1, cex.axis = 1.5,
        col = "red", ylim = c(0, 5), 
        names.arg = gemm[gemm$Area == "commercial" ,"Year"])
mtext(side = 3, "Coastwide Commercial Discard: WCGOP", line = -2, outer = TRUE, cex = 1.5)
mtext(side = 1, "Year", line = 3, cex = 1.5)
mtext(side = 2, "Total Dead Discard (mt)", line = 3, cex = 1.5)
plot(gemm[gemm$Area == "commercial", "Year"], gemm[gemm$Area == "commercial", "Discard_Mort_Rate"], las = 1,
     type = 'p', col = 'darkgrey', cex = 2, cex.axis = 1.5, cex.lab = 1.5, ylab = "", xlab = "Year", ylim = c(0, 0.22))
points(gemm[gemm$Area == "commercial", "Year"], gemm[gemm$Area == "commercial", "Discard_Mort_Rate"], pch = 16, cex = 2, col = 'darkgrey')
mtext(side = 2, "Discard Rate", line = 3.5, cex = 1.5)
dev.off()



