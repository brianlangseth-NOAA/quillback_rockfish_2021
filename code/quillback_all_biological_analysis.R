########################################
#Script to assess biological data patterns 
#for length, age, and weight. Also to output
#tables for number of data entries
#
#Author: Brian Langseth, Chantel Wetzel
#
#Updated: 12/14/2020
#########################################

#library(dataModerate2021)
devtools::load_all("U:/Stock assessments/dataModerate_2021")
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\clean_quillback_biodata.R")
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
load(file.path(dir, "data", "PacFIN BDS", paste0("PacFIN.",pacfin_abbr,".bds.13.Aug.2020.RData")))
pacfin 	 = eval(as.name(paste0("PacFIN.",pacfin_abbr,".bds.13.Aug.2020")))
south_ca = c("DNA","HNM","LGB","NWB","OBV","OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
or = c("AST","BDN","BRK","DPO","FLR","GLD","NEW","ORF","PCC","SRV","TLL","WIN","COS")
north_ca = c("ALB","ALM","ARE","AVL","BDG","BKL","BOL","BRG","CRS","CRZ","ERK",
             "FLN","MNT","MOS","MRO","OAK","OCA","OCM","OCN","ODN","OHB","OMD","OSF","OSL","OSM","OWC","PRN","RCH","RYS","SF","SLT","TML","TRN")
wa = unique(pacfin$PCID)[!(unique(pacfin$PCID)) %in% c(south_ca, north_ca, or)]
pacfin_data = rename_pacfin(data = pacfin,
                       area_grouping = list(south_ca, north_ca, or, wa),
                       area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA"),
                       fleet_grouping = list("A", c("R", "U")), 
                       fleet_names = c("com_alive", "com_dead_unknown"), 
                       fleet_column_name = "COND")
table(pacfin_data$COND,pacfin_data$Fleet) #checks
table(pacfin_data$State_Areas,pacfin_data$state) #checks
table(pacfin_data$SPID,useNA="always")


##RecFIN
#California
ca_recfin = rename_budrick_recfin(read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_rec_lengths_2004_2020_updated.csv", header=T, na.strings = "-"))
ca_recfin = ca_recfin[ca_recfin$SPECIES_NAME == recfin_name, ]
ca_recfin_data = rename_recfin(data = ca_recfin,
                               area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
                               area_names = c("south_pt_concep", "north_pt_concep"),
                               area_column_name = "RECFIN_PORT_NAME",
                               mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
                               mode_names = c("shore", "boat", "unknown"),
                               mode_column_name = "RecFIN.Mode.Name" )
table(ca_recfin_data$RecFIN.Mode.Name,ca_recfin_data$Fleet)
table(ca_recfin_data$State,ca_recfin_data$State_Areas)
table(ca_recfin_data$SPECIES_NAME,useNA="always")



#Washignton
# According to Theresa WA lengths are all FL
wa_recfin = rename_wa_recfin(read.csv(file.path(dir,"data","RecFIN Sample Data",paste0("wa_rec_bds_quillback.csv")), header = T, na.strings = "-"))
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
ca_mrfss_full = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_mrfss_bio_1980_2003.csv")
ca_mrfss = ca_mrfss_full[ca_mrfss_full$ST == 6 & ca_mrfss_full$SP_CODE == ca_mrfss_code, ]
ca_mrfss = ca_mrfss[!is.na(ca_mrfss$CNTY), ] # remove records without a county
spc = c(59, 73, 37, 111, 83)
npc = unique(ca_mrfss[!ca_mrfss$CNTY %in% spc, "CNTY"]) 
ca_mrfss$STATE_NAME = "CA"
ca_mrfss_data = rename_mrfss(data = ca_mrfss,
                             len_col = "T_LEN",
                             area_grouping = list(spc, npc), 
                             area_names = c("south_pt_concep", "north_pt_concep"), 
                             area_column_name = "CNTY", 
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
recfin_mrfss_data = rbind(or_mrfss_data[,which(names(or_mrfss_data) %in% rec_fields)], ca_mrfss_data[,which(names(ca_mrfss_data) %in% rec_fields)])


  
##Hook and Line survey
#hkl = read.csv(file.path(dir, "data", "Hook Line Data", "qryGrandUnifiedThru2019_06182020.csv"))
#sub_hkl = hkl[hkl$COMNAME == hkl_name, ]
hkl = read.csv(file.path(dir, "data", "Hook Line Data", "qryGrandUnifiedThru2019_For2021Assessments_DWarehouse version_12102020.csv"))
sub_hkl = hkl[hkl$common_name == hkl_name, ]



##Combo Survey
load(file.path(dir, "data", "Trawl Survey Bio", "Bio_All_NWFSC.Combo_2020-07-30.rda"))
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
input[[7]] = recfin_mrfss_data



############################################################################################
#	Create data frame with all the input data
############################################################################################
out_unclean = create_data_frame(data_list = input)

############################################################################################
#	Clean biological data
############################################################################################
out = clean_quillback_biodata(dir = file.path(dir,"data","output biology","plots"), data = out_unclean)

############################################################################################
#	Summarize all of the input data
############################################################################################
out_sum = summarize_data(dir = file.path(dir,"data","output biology","plots"), data = out)
write.csv(out_sum$area_fleet_source_year, file = file.path(dir, "data", "output biology", "sample_by_source_area_year.csv"))

table(out$Source,out$State_Areas)
table(out[!is.na(out$Age),"Source"],out[!is.na(out$Age),"State_Areas"])
table(out[!is.na(out$Weight),"Source"],out[!is.na(out$Weight),"State_Areas"])


############################################################################################
#	Plot length-at-weight data by source and year
############################################################################################
#ORage is not included here because have no weights
lw_ests <- estimate_length_weight(data = out, grouping = "all")
length_weight_plot(dir = file.path(dir, "data", "output biology"), splits = NA, data = out, nm_append = NULL, ests = lw_ests, plots = 1:4)

#Plot lw relationship with literature values
#Remove recfin and mrfss due to use of imputted weights/lengths
out_lw = out[out$Source %in% c("PacFIN","NWFSC_WCGBTS","Triennial"),]
lw_ests_lw <- estimate_length_weight(data = out_lw, grouping = "all")
pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_Weight_by_Sex_SurveyPacFIN.png", w = 7, h = 7, pt = 12)
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


############################################################################################
#	Plot length-at-age data by source and year
############################################################################################
out_age = out
out_age[out_age$State == "ORage", "State"] = "OR"
out_age[out_age$Source == "RecFIN_ORage", "Source"] = "RecFIN"
la_ests <- estimate_length_age(data = out_age, grouping = "all")
length_age_plot(dir = file.path(dir, "data", "output biology"), splits = NA, data = out_age, nm_append = NULL, ests = la_ests, plots = 1:4)


############################################################################################
#	Plot length by depth plot by source and year
############################################################################################
length_by_depth_plot(dir = file.path(dir, "data", "output biology"), data = out, xlim = NULL, ylim = NULL)


############################################################################################
#	Plot length frequency plots by source and year
############################################################################################
#Source
length_freq_plot(dir = file.path(dir, "data", "output biology"), data = out[out$Source!="RecFIN_ORage",], xlim = NULL, ylim = NULL)
#Year
tmp = out[out$Source %in% unique(out$Source),]
par(mar = c(4,4,2,7))
plot(aggregate(tmp$Length, by = list(tmp$Year), FUN = mean), xlab = "Year", ylab = "mean Length (cm)", type = "b", lwd = 2)
par(new=T)
plot(aggregate(tmp$Length, by = list(tmp$Year), FUN = length), 
     xlab = "", ylab = "", xaxt = "n", yaxt = "n", type = "l", lty = 2, lwd = 1)
axis(4)
mtext("Sample size", side = 4, line = 3)

############################################################################################
#	Plot length frequency plots in and out of Cowcod Conservation Areas from Hook and Line survey data only
############################################################################################
#compare_length_cca(dir = file.path(dir, "data", "output biology"), data = out, file = "hkl_cca_comparison", xlim = NULL, ylim = NULL)


############################################################################################
#	Length or Age frequency plots By Sex, Area, and Fleet. Minimum sampling size for plotting by sex is 10
############################################################################################
data_hist(dir = file.path(dir, "data", "output biology", "plots"), 
          data = out, 
          data_type = "Age", 
          group_column = "State_Areas", 
          fleet_column = "Fleet", 
          ymax = NULL, 
          do_abline = TRUE)
data_hist(dir = file.path(dir, "data", "output biology", "plots"), 
          data = out, 
          data_type = "Length", 
          group_column = "State_Areas", 
          fleet_column = "Fleet", 
          ymax = NULL, 
          do_abline = TRUE)


############################################################################################
#Additional plotting for data workshop
############################################################################################
source(file.path(dir, "code", "data_workshop_plotting_quillback.R"))



###########################################
#Special Projects Plots
###########################################
##Oregon Special Projects Data
comSP = read.csv("L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Data_From_States\\or\\special_projects\\Quillback_commerical SP data.csv", header=TRUE)
recSP = read.csv("L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Data_From_States\\or\\special_projects\\Quillback_recreational SP data.csv", header=TRUE)
#Rename fields for recreational
recSP$Year = recSP$YYYY
recSP$Lat = recSP$Lon = recSP$Areas = recSP$Depth = recSP$Age = recSP$Data_Type = NA
recSP$State = recSP$State_Areas = "OR"
recSP$Length = recSP$SampleLength/10 #convert to cm
recSP$Weight = recSP$SampleWeight #already in kg
recSP$Fleet = "rec"
recSP$Source = "Special"
#Rename fields for commercial
comSP$Year = comSP$SAMPLE_YEAR
comSP$Lat = comSP$Lon = comSP$Areas = comSP$Depth = comSP$Data_Type = NA
comSP$State = comSP$State_Areas = "OR"
comSP$Sex = comSP$SEX_CODE
comSP$Length = comSP$FISH_LENGTH/10 #convert to cm
comSP$Weight = comSP$FISH_WEIGHT/1000 #convert to kg
comSP$Age = comSP$FINAL_FISH_AGE_IN_YEARS
comSP$Fleet = "com"
comSP$Source = "Special"
#Combine rec and comm special projects
sp_data = rbind(comSP[,c("Year","Lat","Lon","Areas","Depth","Age","Data_Type","State_Areas","State","Sex","Length","Weight","Fleet","Source")],
                recSP[,c("Year","Lat","Lon","Areas","Depth","Age","Data_Type","State_Areas","State","Sex","Length","Weight","Fleet","Source")])
#unid'd fish are without weight so remove
sp_data = sp_data[sp_data$Sex%in%c("F","M"),]

##Length-weight
lw_ests_sp <- estimate_length_weight(data = sp_data, grouping = "all")
length_weight_plot(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Data_From_States\\or\\special_projects\\quillback plots", 
                   splits = NA, data = sp_data, nm_append = NULL, ests = lw_ests_sp, plots = 1:2)
##Length-age
la_ests_sp <- estimate_length_age(data = sp_data, grouping = "all")
length_age_plot(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Data_From_States\\or\\special_projects\\quillback plots", 
                splits = NA, data = sp_data, nm_append = NULL, ests = la_ests_sp, plots = 1:2)

sp_data2=sp_data[-c(134,146),]
