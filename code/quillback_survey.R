###################################################################################
#
# Quillback rockfish 
# Trawl survey exploration and processing
#
#############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
#source("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode/R/pdf_fxn.R")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
source("C:/Assessments/2020/survey_summary/survey_summary_package/R/plot_cpue.R")
# Also available on github:
#https://github.com/chantelwetzel-noaa/survey_summary_package/blob/master/R/plot_cpue.R

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"


############################################################################################
#	Load the Survey Data
############################################################################################

load(file.path(dir, "Trawl Survey Catch", "Catch__NWFSC.Combo_2020-07-30.rda"))
load(file.path(dir, "Trawl Survey Bio", "Bio_All_NWFSC.Combo_2020-07-30.rda"))
catch = Out
bio = Data

plot_cpue_fn(dir = file.path(dir, "Trawl Survey Catch", "plots"), 
			 name = "Quillbck rockfish", 
			 catch = catch, bio = bio, 
			 plot = 1:3, n = 20000)