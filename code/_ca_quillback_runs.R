# Quillback California Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)

wd = "C:/Users/Brian.Langseth/Desktop/ca"

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


#####################
#Cleaning up models
#Starting with the adjearly recdev version (0_1_1)
#1. Set 2020 rec catch to be average of last three years
#2. Reset forecast catches to average of last three years of rec (2017-2019) and of com (2018-2020)
#3. Set R0 init and prior lower
#####################
model.1.0.0 = "1_0_0_recdevs"
base.1.0.0 = SS_output(file.path(wd, model.1.0.0),covar=TRUE)
SS_plots(base.1.0.0)

##Smooth catch time series with 7year moving average
#Starting with the recdevs version (1_0_0)
#Calcs for adjusting catches in "Calcs_smoothCatch.xls"
model.1.1.0 = "1_1_0_smoothCatch"
base.1.1.0 = SS_output(file.path(wd, model.1.1.0),covar=TRUE)
SS_plots(base.1.1.0)


####################
#R0 profiling - use profiling code.R
#Set selectivity estimation to be phase 1
####################
model.1.0.1 = "1_0_0_R0profiling"


