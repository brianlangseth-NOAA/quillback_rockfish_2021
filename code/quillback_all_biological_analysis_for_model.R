########################################
#Script to assess biological data patterns 
#for length, age, and weight. Also to output
#tables for number of data entries
#
#Uses updated data for 2020 (and other years) in Feb 2021
#
#Author: Brian Langseth, Chantel Wetzel
#
#Updated: 2/26/2020
#########################################

#library(dataModerate2021)
devtools::load_all("U:/Stock assessments/dataModerate_2021")
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\clean_quillback_biodata.R")
#devtools::install_github("nwfsc-assess/PacFIN.Utilities")
library(nwfscSurvey)
library(PacFIN.Utilities)
library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish"
pacfin_abbr = "QLBK"
hkl_name = "Quillback Rockfish"
recfin_name = "QUILLBACK ROCKFISH"
or_rec_name = "Quillback"
ca_mrfss_code = 8826010120

############################################################################################
#	Load Data
############################################################################################

##PacFIN
# load(file.path(dir, "data", "PacFIN BDS", paste0("PacFIN.",pacfin_abbr,".bds.13.Aug.2020.RData")))
# pacfin 	 = eval(as.name(paste0("PacFIN.",pacfin_abbr,".bds.13.Aug.2020")))
# south_ca = c("DNA","HNM","LGB","NWB","OBV","OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
# or = c("AST","BDN","BRK","DPO","FLR","GLD","NEW","ORF","PCC","SRV","TLL","WIN","COS")
# north_ca = c("ALB","ALM","ARE","AVL","BDG","BKL","BOL","BRG","CRS","CRZ","ERK",
#              "FLN","MNT","MOS","MRO","OAK","OCA","OCM","OCN","ODN","OHB","OMD","OSF","OSL","OSM","OWC","PRN","RCH","RYS","SF","SLT","TML","TRN")
# wa = unique(pacfin$PCID)[!(unique(pacfin$PCID)) %in% c(south_ca, north_ca, or)]
# pacfin_data = rename_pacfin(data = pacfin,
#                        area_grouping = list(south_ca, north_ca, or, wa),
#                        area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA"),
#                        fleet_grouping = list("A", c("R", "U")), 
#                        fleet_names = c("com_alive", "com_dead_unknown"), 
#                        fleet_column_name = "COND")
# table(pacfin_data$COND,pacfin_data$Fleet) #checks
# table(pacfin_data$State_Areas,pacfin_data$state) #checks
# table(pacfin_data$SPID,useNA="always")

#Updating with the newest data pull (includes 2020 data) - PacFIN.Utilities_0.0.1.9999
#For 2020 data
load(file.path(dir, "data", "PacFIN BDS", paste0("PacFIN.",pacfin_abbr,".bds.23.Feb.2021.RData")))
pacfin = bds.pacfin
#Set fish in WA area 4a but in state area 29 (which are included in assessments) to a PSMFC area that isn't removed
#Fish numbers provided by Kristen Hinton on 2/24/21
pacfin[pacfin$SAMPLE_NUMBER %in% c(20174101180002, 20184101180001, 20184101180002, 20184101180003), "PSMFC_CATCH_AREA_CODE"] = "wa29"
south_ca = c("DNA","HNM","LGB","NWB","OBV","OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
or = c("AST","BDN","BRK","DPO","FLR","GLD","NEW","ORF","PCC","SRV","TLL","WIN","COS")
north_ca = c("ALB","ALM","ARE","AVL","BDG","BKL","BOL","BRG","CRS","CRZ","ERK",
             "FLN","MNT","MOS","MRO","OAK","OCA","OCM","OCN","ODN","OHB","OMD","OSF","OSL","OSM","OWC","PRN","RCH","RYS","SF","SLT","TML","TRN")
wa = unique(pacfin$PACFIN_PORT_CODE)[!(unique(pacfin$PACFIN_PORT_CODE)) %in% c(south_ca, north_ca, or)]
pacfin_data = rename_pacfin_newVersion(data = pacfin,
                                  area_grouping = list(south_ca, north_ca, or, wa),
                                  area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA"),
                                  fleet_grouping = list("A", c("R", "U")), 
                                  fleet_names = c("com_alive", "com_dead_unknown"), 
                                  fleet_column_name = "COND")
#On May 15, when rerunning to finalize plots for report found that PACFIN weight is in grams
pacfin_data$Weight=pacfin_data$Weight/1000



##RecFIN
#California
#ca_recfin = rename_budrick_recfin(read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_rec_lengths_2004_2020_updated.csv", header=T, na.strings = "-"))
#ca_recfin = ca_recfin[ca_recfin$SPECIES_NAME == recfin_name, ]
ca_recfin = rename_budrick_recfin(read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/RecFIN Sample Data/Quillback_revised_CRFS_NoRegion_2004-2020_Feb2021.csv", header=T, na.strings = "-"))
table(ca_recfin$AGENCY_WATER_AREA_NAME) #There are no Mexcio fish here
ca_recfin_data = rename_recfin(data = ca_recfin,
                               area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
                               area_names = c("south_pt_concep", "north_pt_concep"),
                               area_column_name = "RECFIN_PORT_NAME",
                               mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
                               mode_names = c("shore", "boat", "unknown"),
                               #mode_column_name = "RecFIN.Mode.Name" )
                               mode_column_name = "RECFIN_MODE_NAME" )
#table(ca_recfin_data$RecFIN.Mode.Name,ca_recfin_data$Fleet)
table(ca_recfin_data$RECFIN_MODE_NAME,ca_recfin_data$Fleet)
table(ca_recfin_data$State,ca_recfin_data$State_Areas)
table(ca_recfin_data$SPECIES_NAME,useNA="always")


#Washington
# According to Theresa WA lengths are all FL
wa_recfin = rename_wa_recfin(read.csv(file.path(dir,"data","RecFIN Sample Data",paste0("wa_rec_bds_quillback_with2020.csv")), header = T, na.strings = "-"))
wa_recfin_data =rename_recfin(data = wa_recfin,
                              area_grouping = list(c("WASHINGTON")),
                              area_names = c("WA"),
                              area_column_name = "STATE_NAME",
                              mode_grouping = list( c("C", "B"), c("\\?", "^$")), #\\? matches to "?" and "^$" matches to ""
                              mode_names = c("boat", "unknown"),
                              mode_column_name = "boat_mode_code"  )
table(wa_recfin_data$boat_mode_code,wa_recfin_data$Fleet)
table(wa_recfin_data$STATE_NAME,wa_recfin_data$State_Areas)
table(wa_recfin_data$SPECIES_NAME,useNA="always")


#Oregon
or_recfin_age = read.csv(file.path(dir,"data","RecFIN Sample Data",paste0(or_rec_name,"_RecFIN_BIO-AGE_2005- 2006,2008.csv")), header = T, na.strings = "-")
or_recfin_len = read.csv(file.path(dir,"data","RecFIN Sample Data",paste0(or_rec_name,"_RecFIN_BIO-LW_2001-2020.csv")), header = T, na.strings = "-")
table(or_recfin_len$Source.Code) #Fish with Source.Code in the length file are in age file in coded as "ORA", but a lot not in the age file are coded as ORA in the length file because they have unaged otoliths
#Set instances with weight == 0 to NA
or_recfin_len[which(or_recfin_len$Agency.Weight==0),"Agency.Weight"]=NA
or_recfin_len_data = rename_recfin(data = or_recfin_len, 
                                   area_column_name = "State.Name",
                                   area_grouping = list("Oregon"), 
                                   area_names = "OR",
                                   mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
                                   mode_names = c("shore", "boat", "unknown"),
                                   mode_column_name = "RecFIN.Mode.Name" )
table(or_recfin_len_data$RecFIN.Mode.Name,or_recfin_len_data$Fleet)
table(or_recfin_len_data$State.Name,or_recfin_len_data$State_Areas)
table(or_recfin_len_data$Species.Name,useNA="always")

or_recfin_age_data = rename_recfin(data = or_recfin_age, 
                                   area_grouping = list("ODFW"), 
                                   area_names = c("OR"), 
                                   area_column_name = "SAMPLING_AGENCY_NAME",
                                   mode_grouping = list( c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS")),
                                   mode_names = c("boat"),
                                   mode_column_name = "RECFIN_MODE_NAME",
                                   or_ages = TRUE)
table(or_recfin_age_data$RECFIN_MODE_NAME,or_recfin_age_data$Fleet)
table(or_recfin_age_data$SAMPLING_AGENCY_NAME,or_recfin_age_data$State_Areas)
table(or_recfin_age_data$RECFIN_SPECIES_NAME,useNA="always")


#Combine recfin files into one file (include only length file for oregon)
rec_fields = c("Year","Lat","Lon","State","State_Areas","Areas","Depth","Sex","Length","Weight","Age","Fleet","Data_Type","Source")
recfin_len_data = rbind(wa_recfin_data[,which(names(wa_recfin_data) %in% rec_fields)], or_recfin_len_data[,which(names(or_recfin_len_data) %in% rec_fields)], ca_recfin_data[,which(names(ca_recfin_data) %in% rec_fields)])


# ##Research - CONTINUE
# 
# wa_research = read.csv(paste0("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/RecFIN Sample Data/wa_research_bds_quillback.csv"),header=T)



##MRFSS
#California
#ca_mrfss_full = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_mrfss_bio_1980_2003.csv")
ca_mrfss_full = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_mrfss_bio_1980_2003_Final_UPDATED.csv")
ca_mrfss = ca_mrfss_full[ca_mrfss_full$ST == 6 & ca_mrfss_full$SP_CODE == ca_mrfss_code & ca_mrfss_full$YEAR < 2004, ] #Remove the 2004 data from the new MFRSS data
#ca_mrfss = ca_mrfss[!is.na(ca_mrfss$CNTY), ]
#spc = c(59, 73, 37, 111, 83)
#npc = unique(ca_mrfss[!ca_mrfss$CNTY %in% spc, "CNTY"]) 
ca_mrfss$STATE_NAME = "CA"
#Add alternative flages into ca_mrfss data for measured (decimals < 2), calculated (decimals > 2), or missing (NA) values
#for WGT and LNGTH. Need to divide LNGTH by 100 or else sub() includes numbers to the left of the decimal
ca_mrfss$Length_Flag = ca_mrfss$WGT_FLAG_ALT = "missing"
ca_mrfss[which(sapply(ca_mrfss$LNGTH, function(x) nchar(sub('.*\\.', '', x/100))) > 2), "Length_Flag"] = "computed"
ca_mrfss[which(sapply(ca_mrfss$LNGTH, function(x) nchar(sub('.*\\.', '', x/100))) <= 2), "Length_Flag"] = "measured"
ca_mrfss[which(sapply(ca_mrfss$WGT, function(x) nchar(sub('.*\\.', '', x))) > 2), "WGT_FLAG_ALT"] = "computed"
ca_mrfss[which(sapply(ca_mrfss$WGT, function(x) nchar(sub('.*\\.', '', x))) <= 2), "WGT_FLAG_ALT"] = "measured"

ca_mrfss_data = rename_mrfss(data = ca_mrfss,
                             len_col = "LNGTH",
                             #area_grouping = list(spc, npc), 
                             #area_names = c("south_pt_concep", "north_pt_concep"), 
                             #area_column_name = "CNTY", 
                             mode_grouping = list(c(1,2), c(6, 7)),
                             mode_names = c("shore", "boat"),
                             mode_column_name = "MODE_FX" )
table(ca_mrfss_data$DIST,ca_mrfss_data$State_Areas)
table(ca_mrfss_data$MODE_FX,ca_mrfss_data$Fleet)

#Oregon
or_mrfss = read.csv(file.path(dir, "data", "RecFIN Sample Data", paste0(or_rec_name,"_MRFSS BIO_1980-2003.csv")),header=T)
plot(or_mrfss$Total.Length-or_mrfss$Length,col=as.factor(or_mrfss$Total.Length_Flag)) #No biased difference betweeen fork length (length) and total
table(or_mrfss$Length_Flag) #A lot more fork lengths

or_mrfss$STATE_NAME = "OR"
or_mrfss_data = rename_mrfss(data = or_mrfss,
                             len_col = "Length",
                             len_divide = 10,
                             area_grouping = list(441), 
                             area_names = c("OR"),
                             area_column_name = "ORBS_SPP_Code", # This is essentially a cheat
                             mode_grouping = list(c(1,2), c(6, 7)),
                             mode_names = c("shore", "boat"),
                             mode_column_name = "MRFSS_MODE_FX" )
table(or_mrfss_data$MRFSS_MODE_FX,or_mrfss_data$Fleet)

#Combine mrfss files into one file
mrfss_fields = c(rec_fields,"Length_Flag","WGT_FLAG_ALT")
recfin_mrfss_data = rbind(or_mrfss_data[,which(names(or_mrfss_data) %in% mrfss_fields)], ca_mrfss_data[,which(names(ca_mrfss_data) %in% mrfss_fields)])


  
##Hook and Line survey
#hkl = read.csv(file.path(dir, "data", "Hook Line Data", "qryGrandUnifiedThru2019_06182020.csv"))
#sub_hkl = hkl[hkl$COMNAME == hkl_name, ]
hkl = read.csv(file.path(dir, "data", "Hook Line Data", "qryGrandUnifiedThru2019_For2021Assessments_DWarehouse version_12102020.csv"))
sub_hkl = hkl[hkl$common_name == hkl_name, ]



##Combo Survey
#load(file.path(dir, "data", "Trawl Survey Bio", "Bio_All_NWFSC.Combo_2020-07-30.rda"))
load(file.path(dir, "data", "Trawl Survey Bio", "Bio_All_NWFSC.Combo_2021-02-16.rda"))
combo = Data
rm(Data)
combo_data <- rename_survey_data(data = combo,
                   area_split = c(32.5, 42, 46), 
                   area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA") )
table(combo_data$State,combo_data$State_Areas)



##Triennial Survey
load(file.path(dir, "data", "Trawl Survey Bio", "Bio_All_Triennial_2020-07-30.rda"))
trien = Data
rm(Data)
trien_data <- rename_survey_data(data = trien[[1]],
                                 area_split = c(32.5, 42, 46), 
                                 area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA") )
table(trien_data$State,trien_data$State_Areas)


input = list()
input[[1]] = combo_data
input[[2]] = rename_hook_and_line(sub_hkl, survey_name = "nwfsc_hkl")
input[[3]] = trien_data
input[[4]] = pacfin_data
input[[5]] = recfin_len_data
input[[6]] = or_recfin_age_data
input[[7]] = recfin_mrfss_data[(recfin_mrfss_data$Length_Flag=="measured" & recfin_mrfss_data$WGT_FLAG_ALT=="measured"),]


############################################################################################
#	Create data frame with all the input data
############################################################################################
out_unclean = create_data_frame(data_list = input)

############################################################################################
#	Clean biological data
############################################################################################
out = clean_quillback_biodata(dir = file.path(dir,"data","output biology","plots"), data = out_unclean)
#write.csv(out, file = file.path(dir, "data", "output biology", "all_biological_analysis_for_model_data.csv"), row.names = FALSE)


###############################################################
# Create length-age sample table
###############################################################
tmp = out[which(!is.na(out$Age)), ]
#Rename for report
tmp$Report <- gsub("NWFSC_", "", tmp$Source)
tmp$Report <- gsub("PacFIN", "Com", tmp$Source)
tmp[grepl("RecFIN",tmp$Source),"Report"] = "Rec"
tmp[tmp$State=="ORage","State"] = "OR"
tmp$source_state = paste0(tmp$State, "_", tmp$Report)
###
n = table(tmp$Year, tmp$source_state)
write.csv(n, file = file.path(dir, "data", "forSS", "len_at_age_data.csv"))

###############################################################
# Create length-weight sample table
###############################################################
tmp = out[which(!is.na(out$Weight)), ]
#Rename for report
tmp$Report <- gsub("NWFSC_", "", tmp$Source)
tmp$Report <- gsub("PacFIN", "Com", tmp$Source)
tmp[grepl("RecFIN",tmp$Source),"Report"] = "Rec"
tmp$source_state = paste0(tmp$State, "_", tmp$Report)
###
n = table(tmp$Year, tmp$source_state)
write.csv(n, file = file.path(dir, "data", "forSS", "len_at_weight_data.csv"))


############################################################################################
#	Summarize all of the input data
############################################################################################
out_sum = summarize_data(dir = file.path(dir,"data","output biology","plots"), data = out)
write.csv(out_sum$area_fleet_source_year, file = file.path(dir, "data", "output biology", "sample_by_source_area_year_Feb2021.csv"))

table(out$Source,out$State_Areas)
table(out[!is.na(out$Age),"Source"],out[!is.na(out$Age),"State_Areas"])
table(out[!is.na(out$Weight),"Source"],out[!is.na(out$Weight),"State_Areas"])


############################################################################################
#	Plot length-at-weight data by source and year
############################################################################################
#ORage is not included here because have no weights
lw_ests <- estimate_length_weight(data = out, grouping = "all")
length_weight_plot(dir = file.path(dir, "data", "output biology"), splits = NA, data = out, nm_append = NULL, ests = lw_ests, plots = 1:4)

#On May 15 when rerunning to finalize report figures, notices a for all is 1.967e-5. In model have 1.963e-5. 
#Going to keep as is. 

# #Plot lw relationship with literature values
# #Remove recfin and mrfss due to use of imputted weights/lengths - This was original approach, but Ive since removed calculated values above. 
# out_lw = out[out$Source %in% c("PacFIN","NWFSC_WCGBTS","Triennial"),]
# lw_ests_lw <- estimate_length_weight(data = out_lw, grouping = "all")
# pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_Weight_by_Sex_SurveyPacFIN.png", w = 7, h = 7, pt = 12)
# plot(out_lw[out_lw$Sex == "F", "Length"], out_lw[out_lw$Sex == "F", "Weight"], 
#   xlab = "Length (cm)", ylab = "Weight (kg)", main = "", 
#   ylim = c(0, max(out_lw$Weight, na.rm = TRUE)), xlim = c(0, max(out_lw$Length, na.rm = TRUE)), 
#   pch = 16, col = alpha("red", 0.20)) 
# points(out_lw[out_lw$Sex == "M", "Length"], out_lw[out_lw$Sex == "M", "Weight"], pch = 16, col = alpha("blue", 0.20))
# lens = 1:max(out_lw$Length,na.rm = TRUE)
# lines(lens, lw_ests_lw$all_F[1] * lens ^ lw_ests_lw$all_F[2], col = "red", lwd = 2, lty = 1)
# lines(lens, lw_ests_lw$all_M[1] * lens ^ lw_ests_lw$all_M[2], col = "blue", lwd = 2, lty = 2)
# #Canadian estimates (COSEWIC et al. 2009) in TL
# lines(lens, 1.15e-5 * lens ^ 3.144, col = "red", lwd = 2, lty = 3)
# lines(lens, 1.3e-5 * lens ^ 3.107, col = "blue", lwd = 2, lty = 3)
# #PSMFC 1999 in TL
# lines(lens, (0.02555 * lens ^ 2.93)/1000, col = "cyan", lwd = 2, lty = 1)
# #Washington et al. 1978 (this must be off) in TL
# lines(lens, (3.05e-6 * (lens*10) ^ 2.92)/1000, col = "red", lwd = 2, lty = 3)
# lines(lens, (4.97e-6 * (lens*10) ^ 2.83)/1000, col = "blue", lwd = 2, lty = 3)
# #Moultan 1977 in TL (Washington)
# lines(lens, (1.26e-5 * (lens*10) ^ 3.064)/1000, col = "magenta", lwd = 2, lty = 1)
# #Love  in TL (unknown)
# lines(lens, (0.1 * lens ^ 2.5)/1000, col = "grey", lwd = 2, lty = 1)
# #Barker 1979 in TL (Washington)
# lines(lens, (1.2e-5 * (lens*10) ^ 3.07)/1000, col = "green", lwd = 2, lty = 1)
# leg = c(paste0("F: a = ", signif(lw_ests_lw$all_F[1], digits = 3)," b = ", round(lw_ests_lw$all_F[2], 2)),
#         paste0("M: a = ", signif(lw_ests_lw$all_M[1], digits = 3)," b = ", round(lw_ests_lw$all_M[2], 2)),
#         "F: a = 1.15e-5, b = 3.144", "M: a = 1.3e-5, b = 3.107",
#         "PSMFC: 2.56e-5, b = 2.93",
#         "Moultan 1977","Love: a = 1e-4, b = 2.5","Barker 1979")
# legend("topleft", bty = 'n', legend = leg, lty = c(1,2,3,3,1,1,1,1), col = c("red","blue","red","blue","cyan","magenta","grey","green"), lwd = 2)
# dev.off() 

#Now with all data (mrfss data has imputted weight and length removed above already) - this is the values from lw_ests above
out_lw = out[out$Source %in% c("PacFIN","NWFSC_WCGBTS","Triennial","RecFIN","RecFIN_MRFSS"),]
lw_ests_lw <- estimate_length_weight(data = out_lw, grouping = "all")
pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_Weight_by_Sex_AllSources.png", w = 7, h = 7, pt = 12)
plot(out_lw[out_lw$Sex == "F", "Length"], out_lw[out_lw$Sex == "F", "Weight"], 
     xlab = "Length (cm)", ylab = "Weight (kg)", main = "", 
     ylim = c(0, max(out_lw$Weight, na.rm = TRUE)), xlim = c(0, max(out_lw$Length, na.rm = TRUE)), 
     pch = 16, col = alpha("red", 0.20)) 
points(out_lw[out_lw$Sex == "M", "Length"], out_lw[out_lw$Sex == "M", "Weight"], pch = 16, col = alpha("blue", 0.20))
lens = 1:max(out_lw$Length,na.rm = TRUE)
lines(lens, lw_ests_lw$all_F[1] * lens ^ lw_ests_lw$all_F[2], col = "red", lwd = 2, lty = 1)
lines(lens, lw_ests_lw$all_M[1] * lens ^ lw_ests_lw$all_M[2], col = "blue", lwd = 2, lty = 2)
#Canadian estimates (COSEWIC et al. 2009) in TL
lines(lens, 1.15e-5 * lens ^ 3.144, col = "red", lwd = 2, lty = 3)
lines(lens, 1.3e-5 * lens ^ 3.107, col = "blue", lwd = 2, lty = 3)
#PSMFC 1999 in TL
lines(lens, (0.02555 * lens ^ 2.93)/1000, col = "cyan", lwd = 2, lty = 1)
#Washington et al. 1978 (this must be off) in TL
lines(lens, (3.05e-6 * (lens*10) ^ 2.92)/1000, col = "red", lwd = 2, lty = 3)
lines(lens, (4.97e-6 * (lens*10) ^ 2.83)/1000, col = "blue", lwd = 2, lty = 3)
#Moultan 1977 in TL (Washington)
lines(lens, (1.26e-5 * (lens*10) ^ 3.064)/1000, col = "magenta", lwd = 2, lty = 1)
#Love  in TL (unknown)
lines(lens, (0.1 * lens ^ 2.5)/1000, col = "grey", lwd = 2, lty = 1)
#Barker 1979 in TL (Washington)
lines(lens, (1.2e-5 * (lens*10) ^ 3.07)/1000, col = "green", lwd = 2, lty = 1)
leg = c(paste0("F: a = ", signif(lw_ests_lw$all_F[1], digits = 3)," b = ", round(lw_ests_lw$all_F[2], 2)),
        paste0("M: a = ", signif(lw_ests_lw$all_M[1], digits = 3)," b = ", round(lw_ests_lw$all_M[2], 2)),
        "F: a = 1.15e-5, b = 3.144", "M: a = 1.3e-5, b = 3.107",
        "PSMFC: 2.56e-5, b = 2.93",
        "Moultan 1977","Love: a = 1e-4, b = 2.5","Barker 1979")
legend("topleft", bty = 'n', legend = leg, lty = c(1,2,3,3,1,1,1,1), col = c("red","blue","red","blue","cyan","magenta","grey","green"), lwd = 2)
dev.off() 

#Update figure from report with sexes separate and combined. Dont show for "U"
#Plot relationship only for all
lw_plot_report <- function(data, ests){
  
  #Set all recfin_mrfss data to recfin to simplify plot
  data[data$Source=="RecFIN_MRFSS","Source"] = "RecFIN"
  
  remove = NULL
  # Determine if all data sources have lengths & weights
  for (s in unique(data$Source)){
    check_len  <- check <- sum( !is.na( data[data$Source == s, "Length"])) == 0
    check_wght <- sum( !is.na( data[data$Source == s, "Weight"])) == 0
    if (check_len | check_wght) {remove <- c(remove, s)}
  }
  data <- data[!data$Source %in% remove, ]
  
  sources = unique(data$Source)
  lens = 1:max(data$Length, na.rm = TRUE)
  
  ymax = max(data$Weight, na.rm = TRUE)
  xmax = max(data$Length, na.rm = TRUE)
  
  line_col = c("red", 'blue', "grey")
  sex_col = alpha(line_col, 0.25)
  
  file = "Length_Weight_by_Sex_ForReport.png"
  
  pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = file, w = 7, h = 7, pt = 12)
  par(mfrow = c(2,2), mai = c(0.7,0.8,0.5,0.1) )
  
  ind = 0; leg = NULL
  for(s in c("F","M","U")) {
    ind = ind + 1	
    if (ind == 1) {
      plot(data[data$Sex == s, "Length"], data[data$Sex == s, "Weight"], 
           xlab = "Length (cm)", ylab = "Weight (kg)", main = "All Sources", 
           ylim = c(0, ymax), xlim = c(0, xmax), pch = 16, col = sex_col[ind]) 
    }
    if (ind > 1){
      points(data[data$Sex == s, "Length"], data[data$Sex == s, "Weight"], pch = 16, col = sex_col[ind])
    }	
    
    if(s != "U"){ #Only plot lines for M, F
      if (!is.null(ests) & paste0("all_", s)  %in% names(ests)) {
        lines(lens, ests[paste0("all_", s)][[1]][1] * lens ^ ests[paste0("all_", s)][[1]][2], col = line_col[ind], lwd = 2, lty = ind)
        leg = c(leg, paste0(s, ": a = ", signif(ests[paste0("all_", s)][[1]][1], digits = 3),  
                            " b = ", round(ests[paste0("all_", s)][[1]][2], 2) ) )
        if (length(leg) == 3) {
          legend("topleft", bty = 'n', legend = leg, lty = 1:3, col = line_col, lwd = 2)
        }
      }
    }
  } # close sex loop	
  lines(lens, ests["all"][[1]][1] * lens ^ ests["all"][[1]][2], col = 1, lwd = 2, lty = 1)
  leg = c(leg, paste0("All", ": a = ", signif(ests["all"][[1]][1], digits = 3),  
                      " b = ", round(ests["all"][[1]][2], 2) ) )
  legend("topleft", bty = 'n', legend = leg, lty = c(1,2,1), col = c("red","blue",1), lwd = 2)
  
  for (a in sources){
    get = 0
    leg = NULL
    for(s in c("F","M","U")){
      get = get + 1
      ind = data$Source == a & data$Sex == s
      if (get == 1) {
        plot(data$Length[ind], data$Weight[ind], xlab = "Length (cm)", ylab = "Weight (kg)", main = a,
             ylim = c(0, ymax), xlim = c(0, xmax), pch = 16, col = sex_col[get]) }
      if (get > 1){
        points(data$Length[ind], data$Weight[ind], pch = 16, col = sex_col[get]) }	
      
      # if(s!="U"){  #Only plot lines for M, F
      #   if (!is.null(ests) & paste0(a, "_", s)  %in% names(ests)) {
      #     lines(lens, ests[paste0(a,"_", s)][[1]][1] * lens ^ ests[paste0(a, "_", s)][[1]][2], col = line_col[get], lwd = 2, lty = get)
      #     leg = c(leg, paste0(s, ": a = ", signif(ests[paste0(a,"_", s)][[1]][1], digits = 3),  
      #                         " b = ", round(ests[paste0(a,"_", s)][[1]][2], 2) ) )
      #   }
      # }
    } # sex loop
    # lines(lens, ests[a][[1]][1] * lens ^ ests[a][[1]][2], col = 1, lwd = 2, lty = 1)
    # leg = c(leg, paste0("All", ": a = ", signif(ests[a][[1]][1], digits = 3),  
    #                     " b = ", round(ests[a][[1]][2], 2) ) )
    # legend("topleft", bty = 'n', legend = leg, lty = c(1,2,1), col = c(1,2,1), lwd = 2)
  } # source loop	

  dev.off()
  
}
lw_plot_report(out,lw_ests)


############################################################################################
#	Plot length-at-age data by source and year
############################################################################################
out_age = out
out_age[out_age$State == "ORage", "State"] = "OR"
out_age[out_age$Source == "RecFIN_ORage", "Source"] = "RecFIN"
#igor_out = out_age[!is.na(out_age$Age),c("State","Source","Sex","Age","Length")] #For Jason's IGOR estimator
#write.csv(cbind("Sample" = 1:nrow(igor_out),igor_out), "C:/Users/Brian.Langseth/Desktop/igor_quillback.csv", row.names = FALSE)
la_ests <- estimate_length_age(data = out_age[-c(142,143),], grouping = "all")
length_age_plot(dir = file.path(dir, "data", "output biology"), splits = NA, data = out_age, nm_append = NULL, ests = la_ests, plots = 1:4)

#Update figure from report with sexes separate and combined. Dont show for "U"
la_plot_report = function(data,ests){
  
  keep = which(!is.na(data$Age))
  data = data[keep, ]
  
  sources = unique(data$Source)
  lens = 1:max(data$Length, na.rm = TRUE)
  
  xmax = max(data$Age,    na.rm = TRUE)
  ymax = max(data$Length, na.rm = TRUE)

  line_col = c("red", 'blue')
  sex_col = alpha(line_col, 0.25)
  
  file = "Length_Age_by_Sex_ForReport.png"
  
  pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = file, w = 7, h = 7, pt = 12)
  par(mfrow = c(2, 2), mai = c(0.7,0.8,0.5,0.1))
  
  ind = 0; leg = NULL
  for(s in c("F","M")) {
    ind = ind + 1	
    if (ind == 1) {
      plot(data[data$Sex == s, "Age"], data[data$Sex == s, "Length"], 
           xlab = "Age", ylab = "Length (cm)", main = "All Sources", xaxs = "i", yaxs = "i",
           ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[ind]) 
    }
    if (ind > 1){
      points(data[data$Sex == s, "Age"], data[data$Sex == s, "Length"], pch = 1, col = sex_col[ind])
    }	
    
    if (!is.null(ests) & paste0("all_", s)  %in% names(ests)) {
      lines(0:ymax, vb_fn(age = 0:ymax, Linf = ests[paste0("all_", s)][[1]][1], L0 = ests[paste0("all_", s)][[1]][2], k = ests[paste0("all_", s)][[1]][3]), 
            col = line_col[ind], lty = ind, lwd = 2)
      leg = c(leg, paste0(s, ": Linf = ", round(ests[paste0("all_", s)][[1]][1], 2),  
                          " L0 = "  , round(ests[paste0("all_", s)][[1]][2], 2),
                          " k = "   , round(ests[paste0("all_", s)][[1]][3], 3) ) )

    }
  } # close sex loop	
  lines(0:ymax, vb_fn(age = 0:ymax, Linf = ests["all"][[1]][1], L0 = ests["all"][[1]][2], k = ests["all"][[1]][3]), 
        col = 1, lty = 1, lwd = 2)
  leg = c(leg, paste0("All", ": Linf = ", round(ests["all"][[1]][1], 2),  
                      " L0 = "  , round(ests["all"][[1]][2], 2),
                      " k = "   , round(ests["all"][[1]][3], 3) ) )
  legend("bottomright", bty = 'n', legend = leg, lty = c(1,2,1), col = c(line_col,1), lwd = 2, cex = 0.9)
  
  for (a in sources){
    get = 0
    leg = NULL
    for(s in c("F","M")){
      ind = data$Source == a & data$Sex == s
      # Only plot  a sex if it is a certain amount
      if ( length(data[ind, "Sex"]) / dim(data[data$Source == a, ])[1] > 0.10 ) {	
        get = get + 1
        
        if (get == 1) {
          plot(data$Age[ind], data$Length[ind], xlab = "Age", ylab = "Length (cm)", main = a,
               xaxs = "i", yaxs = "i", ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[get]) 
        }
        if (get > 1){
          points(data$Age[ind], data$Length[ind], pch = 1, col = sex_col[get]) 
        }	
        
        # if (!is.null(ests) & paste0(a, "_", s)  %in% names(ests)) {
        #   lines(0:ymax, vb_fn(age = 0:ymax, Linf = ests[paste0(a,"_", s)][[1]][1], L0 = ests[paste0(a,"_", s)][[1]][2], k = ests[paste0(a,"_", s)][[1]][3]), 
        #         col = line_col[get], lty = get, lwd = 2)
        #   leg = c(leg, paste0(s, ": Linf = ", round(ests[paste0(a,"_", s)][[1]][1], 2),  
        #                       " L0 = " , round(ests[paste0(a,"_", s)][[1]][2], 2),
        #                       " k = "  , round(ests[paste0(a,"_", s)][[1]][3], 2) ) )
        # } # line loop
      } # proportion sex loop
    } # sex loop

    # lines(0:ymax, vb_fn(age = 0:ymax, Linf = ests[a][[1]][1], L0 = ests[a][[1]][2], k = ests[a][[1]][3]), 
    #       col = 1, lty = 1, lwd = 2)
    # leg = c(leg, paste0("All", ": Linf = ", round(ests[a][[1]][1], 2),  
    #                     " L0 = "  , round(ests[a][[1]][2], 2),
    #                     " k = "   , round(ests[a][[1]][3], 3) ) )
    # legend("bottomright", bty = 'n', legend = leg, lty = c(1,2,1), col = c(line_col,1), lwd = 2, cex = 0.9)

  } # source loop	
  
  dev.off()
}
la_plot_report(out_age[-c(142,143),],la_ests)

###
#Look at see what estimated LA relationships from models look like
###
#Oregon
pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "OR_EstK_EstLinf.png", w = 7, h = 7, pt = 12)
plot(out_age$Age,out_age$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("black", 0.25))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = 43.048, L0 = la_ests["all"][[1]][2], k = 0.139), 
      col = 2, lty = 2, lwd = 3)
legend("bottomright",c("External Estimate", "K and Linf estimated within model"), lty=c(1,2), col=c(1,2), bty = "n", lwd = 3)
dev.off()

#California
pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "CA_EstK_EstLinf.png", w = 7, h = 7, pt = 12)
plot(out_age$Age,out_age$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("black", 0.25))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
     col = 1, lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = 43.018, L0 = la_ests["all"][[1]][2], k = 0.141), 
      col = 2, lty = 2, lwd = 3)
legend("bottomright",c("External Estimate", "K and Linf estimated within model"), lty=c(1,2), col=c(1,2), bty = "n", lwd = 3)
dev.off()

#Combined
temp = out_age[-c(142,143),]
pngfun(wd = file.path(dir, "presentations"), file = "Length_at_Age_SSCpresentation.png", w = 7, h = 7, pt = 12)
plot(temp[temp$Sex == "F",]$Age,temp[temp$Sex == "F",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("red",0.25))
points(temp[temp$Sex == "M",]$Age,temp[temp$Sex == "M",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("blue",0.25))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all_F"][[1]][1], L0 = la_ests["all_F"][[1]][2], k = la_ests["all_F"][[1]][3]), 
      col = 2, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all_M"][[1]][1], L0 = la_ests["all_M"][[1]][2], k = la_ests["all_M"][[1]][3]), 
      col = "blue", lty = 1, lwd = 3)
dev.off()



