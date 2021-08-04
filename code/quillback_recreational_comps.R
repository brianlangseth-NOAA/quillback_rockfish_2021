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

#Add historical debWV data (onboard party boat) provided by John Budrick July 12, 2021
deb.data = readxl::read_excel("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/postSSC_request_data/Quillback Rockfish Length Data from Central California Onboard Sampling_Jul12_2021.xlsx")
deb.data$Data_Type = "RETAINED" #all are "K" which is retained
deb.data$data = "CPFV-Onboard Data"
deb.data$Length = deb.data$TL/10 #because in mm
deb.data$Sex = "U"
deb.out = data.frame(deb.data[,c("Year", "Length", "Sex", "Data_Type", "data")])
deb.out$Year = as.numeric(deb.out$Year)

#Add variables to cahist needed to create common dataset in create_data_frame()
deb.out$Lat = deb.out$Lon = deb.out$Areas = deb.out$Depth = deb.out$Age = deb.out$Weight = NA
deb.out$State = "CA"
deb.out$State_Areas = "south"
deb.out$Fleet = deb.out$data
deb.out$Source = "CA_Hist"

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
#input[[6]] = deb.out #debWV_comb run uses this and the post SSC script at the very bottom (with files
#renamed with _comb)


############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)

out_cahist = create_data_frame(data_list = list(deb.out))

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


#No data to remove from historical california data
print(paste("Removed",sum(is.na(out_cahist$Length)), "records without any length"))
remove = which(out_cahist$Length > 65 | out_cahist$Length < 8) #Palsson et al. 2009 lists Lmax as 61cm for quillback, thus 65 is reasonable extreme
out_cahist[remove,]
print(paste("Removed",length(which(out_cahist$Data_Type=="RELEASED")), "released records"))



############################################################################################
#	Washington recreational length data file
############################################################################################

wa = out[which(out$State == "WA"), ]
wa$Length_cm = wa$Length

# create a table of the samples available by year
wa$Trawl_id = 1:nrow(wa)
GetN.fn(dir = file.path(dir, "data"), dat = wa, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "forSS", "wa_rec_samples.csv"), row.names = FALSE)

GetN.fn(dir = file.path(dir, "data"), dat = wa, type = "age", species = 'others')
n = read.csv(file.path(dir, "data", "forSS", "age_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "forSS", "wa_rec_age_samples.csv"), row.names = FALSE)

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

# create a table of the samples available by year
or$Trawl_id = 1:nrow(or)
GetN.fn(dir = file.path(dir, "data"), dat = or, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "forSS", "or_rec_samples.csv"), row.names = FALSE)

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

# create a table of the samples available by year
out_orage$Trawl_id = 1:nrow(out_orage)
GetN.fn(dir = file.path(dir, "data"), dat = out_orage, type = "age", species = 'others')
n = read.csv(file.path(dir, "data", "forSS", "age_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "forSS", "or_rec_age_samples.csv"), row.names = FALSE)
if(file.exists(file.path(dir, "data", "forSS", "age_SampleSize.csv"))){ #Remove age sample size file
    file.remove(file.path(dir, "data", "forSS", "age_SampleSize.csv"))
}

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

# create a table of the samples available by year
ca$Trawl_id = 1:nrow(ca)
GetN.fn(dir = file.path(dir, "data"), dat = ca, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "forSS", "ca_rec_samples.csv"), row.names = FALSE)

#Remove length sample size file which was overwritten for each state
if(file.exists(file.path(dir, "data", "forSS", "length_SampleSize.csv"))){
    file.remove(file.path(dir, "data", "forSS", "length_SampleSize.csv"))
}

ca$Sex = "U" #UnexpandedLFs.fn will only do comps for Unsexed fish if sex = 0 and ignore male and female. So assign all as U

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data"), #puts into "forSS" folder in this location
                       datL = ca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-50.csv"), 
    			to= file.path(dir, "data", "forSS", "ca_rec_notExpanded_Length_comp_Sex_0_bin=10-50_Feb2021.csv")) 
    
PlotFreqData.fn(dir = file.path(dir, "data", "forSS"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "CA Recreational - Unsexed_Feb2021", yaxs="i", ylab="Length (cm)", dopng = TRUE)



##
#California recreational lengths added for post SSC analyses
##

ca = out_cahist[which(out_cahist$State == "CA"), ]
#ca = out[which(out$State == "CA"), ] #if running the combined version use this
ca$Length_cm = ca$Length

# create a table of the samples available by year
ca$Trawl_id = 1:nrow(ca)
GetN.fn(dir = file.path(dir, "data"), dat = ca, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "forSS", "ca_rec_samples_debWV.csv"), row.names = FALSE)

#Remove length sample size file which was overwritten for each state
if(file.exists(file.path(dir, "data", "forSS", "length_SampleSize.csv"))){
    file.remove(file.path(dir, "data", "forSS", "length_SampleSize.csv"))
}

ca$Sex = "U" #UnexpandedLFs.fn will only do comps for Unsexed fish if sex = 0 and ignore male and female. So assign all as U

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data"), #puts into "forSS" folder in this location
                       datL = ca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-50.csv"), 
            to= file.path(dir, "data", "forSS", "ca_rec_notExpanded_Length_comp_Sex_0_bin=10-50_debWV.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "forSS"), 
                dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
                main = "CA Recreational - Unsexed_Feb2021 - debWV", yaxs="i", ylab="Length (cm)", dopng = TRUE)





