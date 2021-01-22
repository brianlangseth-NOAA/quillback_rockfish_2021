# Quillback California Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\compare_catch_rec.R")

wd = "C:/Users/Brian.Langseth/Desktop/ca"


##########################################################################################
#                         Initial explorations
##########################################################################################

model.0 = "0_0_init_model"
base.0 = SS_output(file.path(wd, model.0),covar=TRUE)
SS_plots(base.0)

###############
#RecDevs
###############
##Take init model and add rec devs. Extend early back to start of catch. Main at start of comps. 
model.0.1.0 = "0_1_0_recdevs"
base.0.1.0 = SS_output(file.path(wd, model.0.1.0),covar=TRUE)
SS_plots(base.0.1.0)

##Copy recdev version and shorten early phase devs to half of max age from comps (so 45 years before 1980 - 1935)
##Also the period at which early devs start to move away from 0
model.0.1.1 = "0_1_1_recdevs_adjearly"
base.0.1.1 = SS_output(file.path(wd, model.0.1.1),covar=TRUE)
SS_plots(base.0.1.1)


###############
##Doing data weighting
###############
##Starting with francis weighting with the 1980s recdev version
SS_tune_comps(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\models\\ca\\0_1_1_recdevs_adjearly", write = FALSE)
#adjusting only for 1 iteration
model.0.2.1 = "0_2_dw_francis"
base.0.2.1 = SS_output(file.path(wd, model.0.2.1),covar=TRUE)
SS_plots(base.0.2.1)

model.0.2.2 = "0_2_dw_MI"
base.0.2.2 = SS_output(file.path(wd, model.0.2.2),covar=TRUE)
SS_plots(base.0.2.2)

##Calculating Dirichlet multinomial options
##Starting with the adjearly recdev version 
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\0_2_dw_DM_input\\just model files")
#Using inputN as sample size for commercial comps
model.0.2.3 = "0_2_dw_DM_input"
base.0.2.3 = SS_output(file.path(wd, model.0.2.3),covar=TRUE)
SS_plots(base.0.2.3)


##########################################################################################
#                         Cleaning up models
#                         Selex and some recruitment
##########################################################################################

#####################
#Starting with the adjearly recdev version (0_1_1)
#1. Set 2020 rec catch to be average of last three years
#2. Reset forecast catches to average of last three years of rec (2017-2019) and of com (2018-2020)
#3. Set R0 init and prior lower
#####################
model.1.0.0 = "1_0_0_recdevs"
base.1.0.0 = SS_output(file.path(wd, model.1.0.0),covar=TRUE)
SS_plots(base.1.0.0)

#Comparing catch and recruitment
compare_catch_rec(base.1.0.0, plots = "all", offset = 6) #Catch and recruitment dont quite align

##Smooth catch time series with 7year moving average
#Starting with the recdevs version (1_0_0)
#Calcs for adjusting catches in "Calcs_smoothCatch.xls"
model.1.1.0 = "1_1_0_smoothCatch"
base.1.1.0 = SS_output(file.path(wd, model.1.1.0),covar=TRUE)
SS_plots(base.1.1.0)

#Comparing catch and recruitment
compare_catch_rec(base.1.1.0, plots = "all", offset = 8) #Catch and recruitment dont quite align

#Comparing runs
modelnames <- c("raw catch", "smooth catch")
mysummary  <- SSsummarize(list(base.1.0.0, base.1.1.0))
SSplotComparisons(mysummary, 
                  filenameprefix = "1_catch_smoother_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd),
                  pdf = TRUE)

####################
#R0 profiling - use profiling code.R
#Set selectivity estimation to be phase 1
####################
model.1.0.1 = "1_0_0_R0profiling"


####################
#Use fork length for rec comps
####################
##Start with updated recdevs (1_0_0)
model.2.0.0 = "2_0_0_LNGTH"
base.2.0.0 = SS_output(file.path(wd, model.2.0.0),covar=TRUE)
SS_plots(base.2.0.0)


##########################################################################################
#                         More cleaning up models
#                         Recdevs and recruitment bias
##########################################################################################

#####################
#Starting with model 200
#1. Follow handbook guidance on setting selectivity for parm1 = mode; and parms 3, 4; set priors to inits)
#for both commercial and recreational
#2. Set length at Amax to reflect Linf (set to 999)
#3. Set prior type for steepness to be beta (2)
#####################


#####################
#Recruitments
#####################
model = "3_0_0_improvements"
base.300 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.300)
#Gradient warning for R0???

#Adjust early recdevs to start 1940 
#Start from model 300
model = "3_0_1_earlydevs1940"
base.301 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.301)

#Adjust early recdevs to start 1960 
#Start from model 300
model = "3_0_2_earlydevs1960"
base.302 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.302)

#Remove early recdevs 
#Start from model 300
model = "3_0_3_noearlydevs"
base.303 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.303)

#Start early devs in 1940. Reducing their length starts the decline later and slightly affects biomass.

#Add bias adj
SS_fitbiasramp(base.301, verbose = TRUE)
#Start from model 301 (and change comm selex parm 4 to not estimated)
model = "3_0_4_biasadj"
base.304 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.304)

#Updata sigmaR to 0.9
base.300$sigma_R_info
#Start from model 300
model = "3_0_5_sigmaR09"
base.305 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.305)

#Estimate without recdevs
#Start from model 300
model = "3_0_6_norecdevs"
base.306 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.306)


#Compare recruitment based changes
modelnames <- c("base", "early1940", "early1960", "noearly", "1940biasadj", "sigmaR09", "no recdevs")
mysummary  <- SSsummarize(list(base.300, base.301, base.302, base.303, base.304, base.305, base.306))
SSplotComparisons(mysummary, 
                  filenameprefix = "1_rec_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


#####################
#Selectivity
#####################

#Add selex block for commercial in 2009
#Start from model 300
model = "3_1_0_comblock2009"
base.310 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.310)
#Slight improvement in fitting the increased size in later years. 
#No evidence for blocking so dont include

#Add selex block for recreational in 2005
#Start from model 300
model = "3_1_1_recblock2005"
base.311 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.311)
#The block isn't very different and the recent years actually are shifted leftward compared to earlier years.
#Improvement to fitting mean length isn't really noticeable. 
#No evidence for blocking so dont include

#Add flexibility in selex patterns by estimate parms 1-4
#Start from model 300
model = "3_1_2_selex14"
base.312 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.312)
#No real difference in selectivity. Thus parms 1, 3 drive asymptotic curve. 

#Try to estimate selex freely for all
#Start from model 300
model = "3_1_3_selex146"
base.313 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.313)
#Not much difference from dome for each individually. 

#Add flexibility for dome shaped for recreational fleet, estimate parameters 1-4 and 6
#Start from model 300
model = "3_2_0_domeselex_rec"
base.320 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.320)
#Estimates dome. Biomass pattern doesnt change much nor recdevs, just more recruits due to more spawners

#Just try out flex for dome shaped for commercial fleet. Expect this to have small effect. Estimate parms 1-4 and 6
#Start from model 300
model = "3_2_1_domeselex_com"
base.321 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.321)
#Estimates dome. Limited effect as expected. 

#Remove comps <1990
#Start from model 300
model = "3_2_2_noearlycomps"
base.322 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.322)
#Early recruitments are lower earlier, and thus population declines more steadily. 
#No recent effect. Excluding does remove the bias adj pattern and max adjust becomes zero


#Compare selectivity based changes
modelnames <- c("base", "comBlock09", "recBlock05", "selex14", "selex146", "rec_dome", "com_dome", "noearlycomps")
mysummary  <- SSsummarize(list(base.300, base.310, base.311, base.312, base.313, base.320, base.321, base.322))
SSplotComparisons(mysummary, 
                  filenameprefix = "2_selex_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


#Smooth the commercial catch spike in 1991 to see how much that year affects depletion
#Set com catch in 1991 to average of 1990 and 1992 (from ~51mt to ~3mt)
#Start from model 300
model = "3_3_0_smoothcatchspike"
base.330 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.330)
#Does have an effect but effect is not large, just pivots biomass timeseries. No real effect on recdevs

#Compare selectivity based changes
modelnames <- c("base", "noCatchSpike")
mysummary  <- SSsummarize(list(base.300, base.330))
SSplotComparisons(mysummary, 
                  filenameprefix = "3_catchspike_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


#Overall, rec devs seem to be high early to support higher catches and wider comps. That rec supports the catches, which 
#once catches decline and comps move right then recdevs decline. I was suprised the high recdevs didn't raise the population
#more than it did. Later spikes in recdevs raise population which then declines due to low recdevs and increasing catch

#Go with recdevs, which although patterns show period of high followed by low, have increases and also max bias adj is
#non zero. Not estimating recdevs moves R0 up, and selectivity leftward for commercial. Thus there appears to be more 
#of a recruitment pattern in the commercial data, which may be due to higher catch values in the period where recdevs
#are estimated. Fits to com are poorer without recdevs whereas rec fleet does ok. 


##########################################################################################
#                         Base model explorations
##########################################################################################

#Start from model 301
#est selex 1-4
model = "3_3_1_earlydevs1940_selex14"
base.331 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.331)

#Start from model 331
#Fix parms 2 and 4 to estimates and reestimate parms 1 and 3.
#Include bias adj
SS_fitbiasramp(base.331, verbose = TRUE)
model = "4_0_base"
base.400 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.400)

#R0 profile - use profiling code.R
#Start with model 600 but set rec parm 1's phase to phase 1

#Data weighting
#Start with model 400
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\4_0_base", write = FALSE, option = "none")
model = "4_1_1_dw_francis"
base.411 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.411)

model = "4_1_2_dw_MI"
base.412 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.412)

#InputN as sample size - Copy model 411, comment out weights, copy over compreport and report from model 400,
#set inputN for comm, and run this line
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\4_1_3_dw_DM_inputN\\just model files")
model = "4_1_3_dw_DM_inputN"
base.413 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.413)

#Original sample size
#Start from model 413
model = "4_1_4_dw_DM_fish"
base.414 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.414)

#Compare runs
modelnames <- c("base", "francis", "MI", "DM - input", "DM - fish")
mysummary  <- SSsummarize(list(base.400, base.411, base.412, base.413, base.414))
SSplotComparisons(mysummary, 
                  filenameprefix = "4_dataweighting_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
