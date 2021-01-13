# Quillback Oregon Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)

wd = "C:/Users/Brian.Langseth/Desktop/or"

model.0 = "0_0_init_model"
base.0 = SS_output(file.path(wd, model.0),covar=TRUE)
SS_plots(base.0)


##########################################################################################
#                         Initial explorations
##########################################################################################

###############
#RecDevs
###############
##Take init model and add rec devs. Extend early back to start of catch. Main at start of comps. 
model.0.1.1 = "0_1_0_recdevs"
base.0.1.1 = SS_output(file.path(wd, model.0.1.1),covar=TRUE)
SS_plots(base.0.1.1)

##Copy recdev version and shorten early phase devs to half of max age from comps (so 45 years before 1980 - 1935)
##Also the period at which early devs start to move away from 0
model.0.1.2 = "0_1_1_recdevs_adjearly"
base.0.1.2 = SS_output(file.path(wd, model.0.1.2),covar=TRUE)
SS_plots(base.0.1.2)


###############
##Doing data weighting
###############
##Starting with francis weighting with the adjearly recdev version
SS_tune_comps(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\models\\or\\0_1_1_recdevs_adjearly", write = FALSE)
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
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\0_2_dw_DM_input\\just model files")
#Using inputN as sample size for commercial comps
model.0.2.3 = "0_2_dw_DM_input"
base.0.2.3 = SS_output(file.path(wd, model.0.2.3),covar=TRUE)
SS_plots(base.0.2.3)

#####################
#Cleaning up models
#Starting with the adjearly recdev version (0_1_1)
#1. Reset forecast catches to average of last three years of rec and of com
#2. Set R0 init and prior lower
#####################
model.1.0 = "1_0_recdevs"
base.1.0 = SS_output(file.path(wd, model.1.0),covar=TRUE)
SS_plots(base.1.0)

##Block selectivity
#Start with 1_0_recdevs but block starting at 2000 (based on email from Ali saying minimum
#size limits started in 2000). Do so for rec only (comm has very few years before 2000). 
#Also changed steepness prior to beta (option 6)
model.1.1 = "1_1_blockSelex_2000"
base.1.1 = SS_output(file.path(wd, model.1.1),covar=TRUE)
SS_plots(base.1.1)


#####################
#More cleaning up models
#Starting with model 110
#1. Follow handbook guidance on setting selectivity for parm1 = mode; and parms 3, 4; set priors to inits)
#for both commercial and recreational
#2. Set length at Amax to reflect Linf (set to 999)
#3. Include age comps but set lambda to 0
#4. Set prior type for steepness to be beta (2)
#####################

model.2.0 = "1_1_blockSelex_2000"
base.2.0 = SS_output(file.path(wd, model.1.1),covar=TRUE)
SS_plots(base.2.0)

