############################################################################################
#	Recreational data-processing for quillback rockfish
#
#	For data updates from Feb 2021
#
#				 Chantel Wetzel, Brian Langseth
############################################################################################

devtools::load_all("U:/Stock assessments/nwfscSurvey")
#devtools::install_github("nwfsc-assess/PacFIN.Utilities")
library(PacFIN.Utilities)
devtools::load_all("U:/Stock assessments/dataModerate_2021")
library(ggplot2)

species = "quillback"
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish"

#Match length bins from commercial comps
len_bin = seq(10, 50, 2)

############################################################################################
#	Load Data
############################################################################################
##RecFIN and MRFSS
#California
#ca_recfin = rename_budrick_recfin(read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_rec_lengths_2004_2020_updated.csv", header=T, na.strings = "-"))
#ca_recfin = ca_recfin[ca_recfin$SPECIES_NAME == "QUILLBACK ROCKFISH", ]
ca_recfin = rename_budrick_recfin(read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/RecFIN Sample Data/Quillback_revised_CRFS_NoRegion_2004-2020_Feb2021.csv", header=T, na.strings = "-"))
table(ca_recfin$AGENCY_WATER_AREA_NAME) #There are no Mexcio fish here
ca_recfin_data = rename_recfin(data = ca_recfin,
                                  #area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
                                  #area_names = c("south_pt_concep", "north_pt_concep"),
                                  #area_column_name = "RECFIN_PORT_NAME",
                                  mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS", "NOT KNOWN")),
                                  mode_names = c("rec_shore", "rec_boat"),
                                  mode_column_name = "RECFIN_MODE_NAME" )
ca_recfin_data$Source = "RecFIN_MRFSS"


#ca_mrfss_full = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_mrfss_bio_1980_2003.csv")
ca_mrfss_full = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_mrfss_bio_1980_2003_Final_UPDATED.csv")
ca_mrfss = ca_mrfss_full[ca_mrfss_full$ST == 6 & ca_mrfss_full$SP_CODE == 8826010120 & ca_mrfss_full$YEAR < 2004, ]
#ca_mrfss = ca_mrfss[!is.na(ca_mrfss$CNTY), ] # remove records without a county
#spc = c(59, 73, 37, 111, 83)
#npc = unique(ca_mrfss[!ca_mrfss$CNTY %in% spc, "CNTY"]) 
ca_mrfss$STATE_NAME = "CA"
ca_mrfss_data = rename_mrfss(data = ca_mrfss,
                             len_col = "LNGTH",
                             #area_grouping = list(spc, npc), 
                             #area_names = c("south_pt_concep", "north_pt_concep"), 
                             #area_column_name = "CNTY", 
                             mode_grouping = list(c(1,2), c(6, 7)),
                             mode_names = c("rec_shore", "rec_boat"),
                             mode_column_name = "MODE_FX" )

#Washignton
# According to Theresa WA lengths are all FL
#wa_recfin = rename_wa_recfin(read.csv(file.path(dir,"data","RecFIN Sample Data",paste0("wa_rec_bds_",species,".csv")), header = T, na.strings = "-"))
wa_recfin = rename_wa_recfin(read.csv(file.path(dir,"data","RecFIN Sample Data",paste0("wa_rec_bds_",species,"_with2020.csv")), header = T, na.strings = "-"))
wa_recfin_data =rename_recfin(data = wa_recfin,
                              area_grouping = list(c("WASHINGTON")),
                              area_names = c("WA"),
                              area_column_name = "STATE_NAME",
                              mode_grouping = list( c("C", "B","\\?", "^$")), #\\? matches to "?" and "^$" matches to ""
                              mode_names = c("rec_boat"),
                              mode_column_name = "boat_mode_code")
wa_recfin_data$Source = "RecFIN_MRFSS"

#Oregon
or_recfin_len = read.csv(file.path(dir,"data","RecFIN Sample Data","Quillback_RecFIN_BIO-LW_2001-2020.csv"), header = T, na.strings = "-")
or_recfin_len_data = rename_recfin(data = or_recfin_len, 
                                   area_column_name = "State.Name",
                                   area_grouping = list("Oregon"), 
                                   area_names = "OR",
                                   mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS", "NOT KNOWN")),
                                   mode_names = c("rec_shore", "rec_boat"),
                                   mode_column_name = "RecFIN.Mode.Name" )
or_recfin_len_data$Source = "RecFIN_MRFSS"

or_mrfss = read.csv(file.path(dir, "data", "RecFIN Sample Data", "Quillback_MRFSS BIO_1980-2003.csv"),header=T)
or_mrfss$STATE_NAME = "OR"
or_mrfss_data = rename_mrfss(data = or_mrfss,
                             len_col = "Length",
                             area_grouping = list(441), 
                             area_names = c("OR"),
                             area_column_name = "ORBS_SPP_Code", # This is essentially a cheat
                             mode_grouping = list(c(1,2), c(6, 7)),
                             mode_names = c("rec_shore", "rec_boat"),
                             mode_column_name = "MRFSS_MODE_FX" )

#Read the age data for age comps
or_recfin_age = read.csv(file.path(dir,"data","RecFIN Sample Data","Quillback_RecFIN_BIO-AGE_2005- 2006,2008.csv"), header = T, na.strings = "-")
or_recfin_age_data = rename_recfin(data = or_recfin_age, 
                                   area_grouping = list("ODFW"), 
                                   area_names = c("OR"), 
                                   area_column_name = "SAMPLING_AGENCY_NAME",
                                   mode_grouping = list( c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS")),
                                   mode_names = c("boat"),
                                   mode_column_name = "RECFIN_MODE_NAME",
                                   or_ages = TRUE)



############################################################################################
# Put all the data into one list
############################################################################################
#Dont read in the oregon age data just the length (otherwise aged lengths would be double counted)
input = list()
input[[1]] = ca_recfin_data
input[[2]] = ca_mrfss_data
input[[3]] = or_mrfss_data
input[[4]] = or_recfin_len_data
input[[5]] = wa_recfin_data

############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)

############################################################################################
# Clean up the data
############################################################################################
#Remove any data without valid lengths
print(paste("Removed",sum(is.na(out$Length)), "records without any length"))
out = out[!is.na(out$Length),]


# Now lets do a check length check to filter out any anomalous lengths
remove = which(out$Length > 65 | out$Length < 8) #Palsson et al. 2009 lists Lmax as 61cm for quillback, thus 65 is reasonable extreme
out[remove,]
#       Year Lat Lon State State_Areas Areas Depth Sex Length Weight Age    Fleet Data_Type       Source
#2     2006  NA  NA    CA        <NA>    NA    NA   U   99.9     NA  NA rec_boat  RETAINED RecFIN_MRFSS
#3     2012  NA  NA    CA        <NA>    NA    NA   U   80.3    4.9  NA rec_boat  RETAINED RecFIN_MRFSS
#18044 2012  NA  NA    OR          OR    NA    NA   U   88.9    7.2  NA rec_boat  RETAINED RecFIN_MRFSS
#18743 2012  NA  NA    OR          OR    NA    NA   U   88.8    9.5  NA rec_boat  RETAINED RecFIN_MRFSS
print(paste("Removed",length(remove), "records with lengths > 65 cm"))
out = out[-remove, ]

# Remove the released for the rest of the summaries for now:
print(paste("Removed",length(which(out$Data_Type=="RELEASED")), "released records"))
out = out[out$Data_Type %in% c("RETAINED", NA), ]



############################################################################################
#	Washington recreational length data file
############################################################################################

wa = out[which(out$State == "WA"), ]
wa$Length_cm = wa$Length

wa$Sex = "U" #UnexpandedLFs.fn and UnexpandedAFs.fn will only do comps for Unsexed fish in sex = 0 and ignore male and female. So assign all as U

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data"), #puts into "forSS" folder in this location
                       datL = wa, lgthBins = len_bin,
                       sex = 0,  partition = 0, fleet = 1, month = 1) #Fleet is 1 for WA
file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-50.csv"), 
			to= file.path(dir, "data", "forSS", "wa_rec_notExpanded_Length_comp_Sex_0_bin=10-50_Feb2021.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "forSS"), 
    dat = lfs$comps, ylim=c(0, max(len_bin)+4), 
    main = "WA Recreational - Unsexed_Feb2021", yaxs="i", ylab="Length (cm)", dopng = TRUE)

#Washington length comps 10-56
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data"), #puts into "forSS" folder in this location
                       datL = wa, lgthBins = seq(10,56,2),
                       sex = 0,  partition = 0, fleet = 1, month = 1) #Fleet is 1 for WA
file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-56.csv"), 
            to= file.path(dir, "data", "forSS", "wa_rec_notExpanded_Length_comp_Sex_0_bin=10-56.csv")) 


#Washington age comps
afs = UnexpandedAFs.fn(dir = file.path(dir, "data"), #puts into "forSS" folder in this location
                       datA = wa, ageBins = 5:70,
                       sex = 0,  partition = 0, fleet = 1, month = 1, ageErr = 1) #Fleet is 1 for WA
file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Age_comp_Sex_0_bin=5-70.csv"), 
            to= file.path(dir, "data", "forSS", "wa_rec_notExpanded_Age_comp_Sex_0_bin=5-70_Feb2021.csv")) 



############################################################################################
#	Oregon recreational length data file - No new data in Feb2021 update
############################################################################################

or = out[which(out$State == "OR"), ]
or$Length_cm = or$Length

or$Sex = "U" #UnexpandedLFs.fn will only do comps for Unsexed fish if sex = 0 and ignore male and female. So assign all as U

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data"),  #puts into "forSS" folder in this location
                       datL = or, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)
file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-50.csv"), 
			to= file.path(dir, "data", "forSS", "or_rec_notExpanded_Length_comp_Sex_0_bin=10-50.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "forSS"), 
    dat = lfs$comps, ylim=c(0, max(len_bin)+4), 
    main = "OR Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


#Oregon age comps 
out_orage = create_data_frame(data_list = list(or_recfin_age_data))
out_orage$Sex = "U" #UnexpandedAFs.fn will only do comps for Unsexed fish if sex = 0 and ignore male and female. So assign all as U

afs = UnexpandedAFs.fn(dir = file.path(dir, "data"),  #puts into "forSS" folder in this location
                       datA = out_orage, ageBins = 5:40,
                       sex = 0, partition = 0, fleet = 2, month = 1, ageErr = 1)
file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Age_comp_Sex_0_bin=5-40.csv"), 
            to= file.path(dir, "data", "forSS", "or_rec_notExpanded_Age_comp_Sex_0_bin=5-40.csv")) 



############################################################################################
#	California recreational length data file
############################################################################################

ca = out[which(out$State == "CA"), ]
ca$Length_cm = ca$Length

ca$Sex = "U" #UnexpandedLFs.fn will only do comps for Unsexed fish if sex = 0 and ignore male and female. So assign all as U

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data"), #puts into "forSS" folder in this location
                       datL = ca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-50.csv"), 
			to= file.path(dir, "data", "forSS", "ca_rec_notExpanded_Length_comp_Sex_0_bin=10-50_Feb2021.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "forSS"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "CA Recreational - Unsexed_Feb2021", yaxs="i", ylab="Length (cm)", dopng = TRUE)





