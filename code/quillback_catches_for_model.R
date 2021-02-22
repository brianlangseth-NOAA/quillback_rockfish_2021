##############################################################################################################
#
# 	Purpose: Output Quillback Rockfish Landings 
#           into form for use in SS
#
#			  by Brian Langseth 
#
##############################################################################################################

library(dplyr)
library(tidyr)
options(stringsAsFactors = FALSE)
devtools::load_all("U:/Stock assessments/dataModerate_2021")

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"

#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Load the recreational data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
# Washington - 1958-2020 Total removals in numbers
wa_rec = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish//data//RecFIN Catch//Quillback Sport Catch WA_with2020.csv")
wa_rec$Total_Removal_N = round(wa_rec$Total_Removal_N,0)
wa_rec = wa_rec[-1,] #remove first year, which is 0

#Oregon - 1979-2020 Landings 1979-2000, Total removals 2001-2020
or_rec = read.csv(file.path(dir, "RecFIN Catch","Quillback_FINAL RECREATIONAL LANDINGS_1979 - 2020_byMode_UPDATED.csv"), header = TRUE)

#California - 2005-2020 Total removals
ca_rec = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_rec_catch_all_2005-2019_crfs.csv")
ca_rec = ca_rec[ca_rec$Species.Name == "QUILLBACK ROCKFISH", ]
#Update with 2020 data
ca_rec_2020 = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/RecFIN Catch/RecFIN_Quillback_CTE001-California-2020.csv")

#California MRFSS years - 1980-2004  Total removals
# 1980 should be replaced with value from historical reconstruction
# Missing 1990-1992 catches - need to linear interpolate
ca_rec_early = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/mrfss_catch_estimates_1980_2004_final.csv")
ca_rec_early = ca_rec_early[ca_rec_early$AGENCY_CODE == 6 & ca_rec_early$SPECIES_NAME == "Quillback Rockfish", ]

#California historical - 1928-1980 Landings 
# Use this value for 1980
ca_rec_hist = read.csv(file.path(dir, "RecFIN Catch", "ca_hist_recreational_1928_1980_ej.csv"))
ca_rec_hist$QLBKmt = ca_rec_hist$QLBKmt_North + ca_rec_hist$QLBKmt_South

#################################################################################################################
# Evaluate the recreational data 
#################################################################################################################
#Washington-----------------------------------------------
#Not needed

#Oregon---------------------------------------------------
#Not needed

#California-----------------------------------------------
#RecFIN years
# RecFIN years
ca_rec_table = aggregate(Total.Mortality.MT ~ RecFIN.Year, data = ca_rec, FUN = sum)
names(ca_rec_table) = c("Year","tot_mort_mt")
ca_rec_table_2020 = aggregate(SUM_TOTAL_MORTALITY_MT ~ RECFIN_YEAR, data = ca_rec_2020, FUN = sum)
names(ca_rec_table_2020) = c("Year","tot_mort_mt")

# MRFSS Years
ca_mrfss_table = aggregate(WGT_AB1 ~ YEAR_, data = ca_rec_early, FUN = sum, drop = FALSE, na.rm = TRUE)
ca_mrfss_table$WGT_AB1 = ca_mrfss_table$WGT_AB1/1000
names(ca_mrfss_table) = c("Year","tot_mort_mt")

#Calculate percentage of AB1 (TSPCLAIM + TSP_HARV) that were B1 (TSP_HARV) by NUMBER.
#Use as historical discard rate
percB1 = ca_rec_early$TSP_HARV/(ca_rec_early$TSP_HARV + ca_rec_early$TSPCLAIM)
yearly_percB1 = aggregate(cbind(ca_rec_early$YEAR_,percB1),by = list(ca_rec_early$YEAR_), FUN = mean, na.rm = TRUE)
ca_rec_hist_discard_rate = 1+mean(yearly_percB1$percB1, na.rm = TRUE)

#Combine all-----------------------------------------------
rec_all_table = data.frame(Year = min(wa_rec$Year, or_rec$Year, ca_mrfss_table$Year, ca_rec_table$Year, ca_rec_hist$Year):2020)
#Washington
rec_all_table$WA_mort_num1000s = merge(rec_all_table, wa_rec, by = "Year", all = TRUE)$Total_Removal_N/1000
#Oregon
rec_all_table$OR_mort_mt = merge(rec_all_table, or_rec[,c("Year","Total")], by = "Year", all = TRUE)$Total
#California recent and early
rec_all_table$CA_mort_mt = round(merge(rec_all_table, rbind(ca_mrfss_table[,c("Year","tot_mort_mt")], ca_rec_table[,c("Year","tot_mort_mt")]), by = "Year", all = TRUE)$tot_mort_mt,3)
rec_all_table[rec_all_table$Year == 2020, "CA_mort_mt"] = ca_rec_table_2020$tot_mort_mt
#California hist with discards added
ca_rec_hist_tmp = merge(rec_all_table, ca_rec_hist[,c("Year","QLBKmt")], by = "Year", all = TRUE)[,c("Year","QLBKmt")]
rec_all_table[!is.na(ca_rec_hist_tmp$QLBKmt),]$CA_mort_mt = round(ca_rec_hist_tmp[!is.na(ca_rec_hist_tmp$QLBKmt),]$QLBKmt * ca_rec_hist_discard_rate, 3)
#Add linear interpolation of missing years (1990-1992) of data for California
imput_slopeN = (rec_all_table[rec_all_table$Year==1993,"CA_mort_mt"] - rec_all_table[rec_all_table$Year==1989,"CA_mort_mt"]) / 4
rec_all_table[rec_all_table$Year %in% c(1990:1992),"CA_mort_mt"] = round(rec_all_table[rec_all_table$Year==1989,"CA_mort_mt"] + imput_slopeN*1:3, 3)

rec_all_table[is.na(rec_all_table)] = 0


#Output final recreational catch time series
#write.csv(rec_all_table, file = file.path("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data", 
#"output catch", "recreational_catch_by_area_model.csv"), row.names = FALSE)



#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Load the commercial data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
# PacFIN Commercial - 1984-2020 Landings lbs
load(file.path(dir, "PacFIN Catch", "QLBK.CompFT.20.Aug.2020.RData"))
com = QLBK.CompFT.20.Aug.2020
rm(QLBK.CompFT.20.Aug.2020)
load(file.path(dir, "PacFIN Catch", "QLBK.CompFT.21.Feb.2021.RData"))
com_2020 = data
rm(data)

# Washington historical - These add URCK onto Pacfin estimates, only valid up through 2016
wa_com_hist = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/wa/Coastal Commercial Rockfish_WithRelaxedBorrowingRules.csv")
wa_com_hist = wa_com_hist[wa_com_hist$SPID == "QLBK",]
wa_com_hist_agg = aggregate(SpeciesPounds ~ Year, data = wa_com_hist, FUN=sum)
wa_com_hist_agg$SpeciesMT =  wa_com_hist_agg$SpeciesPounds / 2204.62262

# Oregon - 1892-2020 Landings metric tons
or_com_data = read.csv(file.path(dir, "PacFin Catch", "Quillback_FINAL COMMERCIAL LANDINGS_1892 - 2020_byGear_UPDATED.csv"))

# California - 1916-1968 Landings (from EJ based on Ralston reconstruction) metric tons
ca_com_hist1 = read.csv(file.path(dir, "PacFin Catch", "ca_hist_commercial_1916_1968_ej_UPDATED_CAlandingsCaughtORWA.csv"))
# California - 1968-1980 Landings lbs
ca_com_hist2 = read.csv(file.path(dir, "PacFin Catch", "ca_hist_commercial_1969_1980_ej.csv"))



#################################################################################################################
# Evaluate the commercial data 
#################################################################################################################

#PacFin-----------------------------------
com$round_mt = com$CATCH.LBS / 2204.62262

#Calculate catch by area
tmp = aggregate(com$round_mt, list(year = com$YEAR, area = com$AGID), FUN = sum, drop = FALSE)
com_table = data.frame(year = sort(unique(tmp$year)),
                           ca = tmp[tmp$area %in% "C", "x"],
                           or   = tmp[tmp$area == "O", "x"], 
                           wa   = tmp[tmp$area == "W", "x"])
#Ignore omitted years from pacfin (1981-1983) for washington
#Calculate missing years from pacfin (1981-1983) for california below
#Output catch table for use in calculating comps
tmp_2020 = aggregate(com_2020$ROUND_WEIGHT_MTONS, list(year = com_2020$LANDING_YEAR, area = com_2020$AGENCY_CODE), FUN = sum, drop = FALSE, na.rm = TRUE)
com_table[com_table$year == 2020, c("ca","or","wa")] = c(tmp_2020[tmp_2020$area %in% "C" & tmp_2020$year %in% 2020, "x"],
                                       tmp_2020[tmp_2020$area %in% "O" & tmp_2020$year %in% 2020, "x"],
                                       tmp_2020[tmp_2020$area %in% "W" & tmp_2020$year %in% 2020, "x"])
#write.csv(com_table,file = file.path(dir,"output catch","pacfin_catch_by_area.csv"), row.names = FALSE)


#Washington---------------------------------
#Not needed

#Oregon------------------------------------
or_com = aggregate(Landings_mt ~ Year, data = or_com_data, FUN = sum, na.rm = TRUE)

tmp = aggregate(Landings_mt ~ Year + Gear_Code, data = or_com_data, FUN = sum, na.rm = TRUE)
or_com_yg = data.frame(pivot_wider(tmp, id_cols = c("Year"), names_from = "Gear_Code", values_from = "Landings_mt"))
or_com_yg[is.na(or_com_yg)] = 0
or_com_yg = or_com_yg[order(or_com_yg$Year),]
or_com_bygear = data.frame(Year = or_com_yg$Year,
                           hookline = or_com_yg[,"X340"],
                           longline = or_com_yg[,"X350"],
                           troll = or_com_yg[,"X120"],
                           other = rowSums(or_com_yg[,c("X300","X400","X360","X390","X391","X392","X393","X430","X999")]))

#California
#Not needed


#Combine all----------------------------------
all_com = data.frame(Year = min(com_table$Year, wa_com_hist$Year, or_com_data$Year, ca_com_hist1$Year):2020)
all_com[all_com$Year %in% com_table$year,"ca"] = com_table[,"ca"]
all_com[all_com$Year %in% ca_com_hist2$Year,"ca"] = ca_com_hist2[,"Grand.Total"]/2204.62
all_com[all_com$Year %in% ca_com_hist1$Year,"ca"] = ca_com_hist1[,"QLBKmt"]
all_com[all_com$Year %in% or_com$Year,"or"] = or_com$Landings_mt
all_com[all_com$Year %in% wa_com_hist_agg$Year,"wa"] = wa_com_hist_agg$SpeciesMT
all_com[all_com$Year %in% c(2015:2020),"wa"] = com_table[com_table$year %in% c(2015:2020),"wa"] #add recent years of wa data from pacfin
##Add linear interpolation of missing years (1981-1983) of data for California
#imput_slopeN_com = (all_com[all_com$Year==1984,"ca"] - 0) / 4
#all_com[all_com$Year %in% c(1981:1983),"ca"] = 0 + imput_slopeN_com*1:3
#Set missing PacFIN years (1981-1983) to be average of preceeding and proceeding 3 years of data for California
#where 1980 and 1985 are 0
all_com[all_com$Year %in% c(1981:1983),"ca"] = mean(c(all_com[all_com$Year %in% c(1978:1979,1984,1986),"ca"],0,0))


#Calculate state specific discard rates 
#Take mean of 2002 to 2018 (since 2019 showed increases due to changes in regulation).
#For washington only take average for years where both discard and catch data were available
#For Oregon, use the gear specific ratio for fixed gears (since high trawl catches and discard
#in 2000s but very little in 1990s), and apply only back to 1990 per Ali. 
source("U:/Stock assessments/quillback_rockfish_2021/code/quillback_discard_exploration.R")
ca_com_discard_rate = 1 + mean(dead[dead$Year %in% c(2002:2018), "ca"] / 
  (dead[dead$Year %in% c(2002:2018), "ca"] + all_com[all_com$Year %in% c(2002:2018),"ca"]))
#or_com_discard_rate = 1 + mean(dead[dead$Year %in% c(2002:2018), "or"] / #Rate from all gears
#  (dead[dead$Year %in% c(2002:2018), "or"] + all_com[all_com$Year %in% c(2002:2018),"or"]))
or_com_discard_rate_fixed = 1 + mean(dead_fixed[dead_fixed$Year %in% c(2002:2018), "or"] / #Rate from fixed gears only
  (dead_fixed[dead_fixed$Year %in% c(2002:2018), "or"] + rowSums(or_com_bygear[or_com_bygear$Year %in% c(2002:2018), c("hookline","longline","troll")])))
#Both catch and discard data only available in 2002:2004, 2006, 2014
cbind(all_com[all_com$Year %in% c(2002:2018),c("Year","wa")],dead[dead$Year %in% c(2002:2018), "wa"])
wa_com_discard_rate = 1 + mean(dead[dead$Year %in% c(2002:2004,2006,2014), "wa"] / 
  (dead[dead$Year %in% c(2002:2004,2006,2014), "wa"] + all_com[all_com$Year %in% c(2002:2004,2006,2014),"wa"]))

#Add discards to landings - Still need to calculate 2020. Right now applying historical discard rate
all_com_mort = all_com
all_com_mort[!all_com_mort$Year %in% dead$Year, "ca"] = all_com[!all_com_mort$Year %in% dead$Year,"ca"] * ca_com_discard_rate
all_com_mort[all_com_mort$Year %in% dead$Year, "ca"] = all_com[all_com_mort$Year %in% dead$Year, "ca"] + dead$ca
all_com_mort[all_com_mort$Year %in% c(1990:2001,2020), "or"] = all_com[all_com_mort$Year %in% c(1990:2001,2020), "or"] * or_com_discard_rate_fixed
all_com_mort[all_com_mort$Year %in% dead$Year, "or"] = all_com[all_com_mort$Year %in% dead$Year, "or"] + dead$or
all_com_mort[!all_com_mort$Year %in% dead$Year, "wa"] = all_com[!all_com_mort$Year %in% dead$Year,"wa"] * wa_com_discard_rate
all_com_mort[all_com_mort$Year %in% dead$Year, "wa"] = all_com[all_com_mort$Year %in% dead$Year, "wa"] + dead$wa
all_com_mort[is.na(all_com_mort)] = 0


#Output final commercial catch time series
#write.csv(all_com_mort, file = file.path("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data", 
#                                         "output catch", "commercial_catch_by_area_model.csv"), row.names = FALSE)


#################################################################################################################
# For the catches for SS by each model area:
# Year, Season, Fleet, Catch, Catch SE
#################################################################################################################
california_catch_ss = rbind(cbind(all_com_mort[all_com_mort$Year >= 1916, "Year"], 1, 1, all_com_mort[all_com_mort$Year >= 1916, "ca"], 0.05),
                        cbind(rec_all_table$Year, 1, 2, rec_all_table$CA_mort_mt, 0.05))
colnames(california_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

oregon_catch_ss = rbind(cbind(all_com_mort[all_com_mort$Year >= 1892, "Year"], 1, 1, all_com_mort[all_com_mort$Year >= 1892, "or"], 0.05),
                         cbind(rec_all_table[rec_all_table$Year >= 1979, "Year"], 1, 2, rec_all_table[rec_all_table$Year >= 1979, "OR_mort_mt"], 0.05))
colnames(oregon_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

#For washington rec is fleet 1, commercial is fleet 2
washington_catch_ss = rbind(cbind(rec_all_table[rec_all_table$Year >= 1958, "Year"], 1, 1, rec_all_table[rec_all_table$Year >= 1958, "WA_mort_num1000s"], 0.05),
                            cbind(all_com_mort[all_com_mort$Year >= 1973, "Year"], 1, 2, all_com_mort[all_com_mort$Year >= 1973, "wa"], 0.05))
colnames(washington_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

#Reset dir since sourcing the discard file changed it
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"
dir.create(file.path(dir, "forSS"))
write.csv(california_catch_ss, file = file.path(dir, "forSS", "ca_catches_for_ss.csv"), row.names = FALSE)
write.csv(oregon_catch_ss, file = file.path(dir, "forSS", "oregon_catches_for_ss.csv"), row.names = FALSE)
write.csv(washington_catch_ss, file = file.path(dir, "forSS", "washington_catches_for_ss.csv"), row.names = FALSE)

