# Quillback Washington Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)

wd = "C:/Users/Brian.Langseth/Desktop/wa"

model = "0_0_init_model"
base = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base)

###############
#RecDevs
###############
model = "0_0_init_model_recFirst"
base.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1)

wd = "C:/Users/Brian.Langseth/Desktop/wa"
model = "0_1_0_recdevs"
base.1.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.1)

##Extending recdevs further into past
#Makes no difference - ignore
model = "0_1_1_recdevs_longearly"
base.1.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.2)

##Starting recdevs when data become available 1980 to reduce # of parameters
##Do so since longer recdevs aren't that variable. 
#Very similar to starting recdevs in 1960.
#Probably best to go with this one. 
model = "0_1_2_recdevs_1980"
base.1.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.3)


###############
##Doing data weighting
###############
##Starting with francis weighting with the 1980s recdev version
SS_tune_comps(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\models\\wa\\0_1_recdevs_1980", write = FALSE)
#adjusting only for 1 iteration
model = "0_2_dw_francis"
base.2.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.1)

#adjusting only for 1 iteration
model = "0_2_dw_MI"
base.2.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.2)


#################################################################################
################################################################
#### The below models were trying to get the model not to display a warnings of 
#"The covariance matrix may not be positive definite" which I thought meant the hessian wasnt either
#Im keeping these though these are not relevant. 
##################################################################

##Even with recdevs and data weighting the Hessian may not be positive definite
##Starting with the 1980s recdev version
#Adding catch to 2020, set equal to 2019 catch
#Nope - still might not be positive definite
model = "0_3_0_fixHessian_2020catch"
base.3.0 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.0)

#Copying the 2020catch version, now removing fits to commercial comps 
#Nope - still might not be positive definite
model = "0_3_1_fixHessian_noComComps"
base.3.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.1)

#Copying the removing fits to commercial comps, removing fits to commercial catch 
#Nope - still might not be positive definite
model = "0_3_2_fixHessian_noCom"
base.3.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.2)

#Copying the removing fits to commercial catch, adding eq catch 
#Nope - still might not be positive definite
model = "0_3_3_fixHessian_eqCatch"
base.3.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.3)

#Copying the removing fits to commercial catch, extending selex top length (parm 1) 
#Nope - still might not be positive definite
model = "0_3_4_fixHession_upSelex"
base.3.4 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.4)

#Copying the removing fits to commercial catch, removing sparse length comps (up to 1995 - the first 4 years)
#Nope - still might not be positive definite
model = "0_3_5_fixHession_cleanComps"
base.3.5 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.5)

#################################################################################


##Calculating Dirichlet multinomial options
##Starting with the 1980s recdev version 
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\0_2_dw_DM_samples\\just model files")
#Using number of fish as sample size for commercial comps
model = "0_2_dw_DM_samples"
base.2.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.3)

#Using inputN as sample size for commercial comps
model = "0_2_dw_DM_input"
base.2.3.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.3.2)


####################
#R0 profiling - use profiling code.R
#Set selectivity estimation to be phase 1, add 2020 rec catch
####################
model = "0_4_R0profiling"


#####################
#Cleaning up models
#Starting with the 1980s recdev version (0_1_2)
#1. Set 2020 catch to be average of last three years for rec and comm
#2. Reset forecast catches to average of last three years of rec
#3. Set R0 init and prior lower
#####################
model = "1_0_0_recdevs"
base.100 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.100)

#Add separate commerical selectivity
model = "1_0_1_recdevs_comSelex"
base.101 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.101)

#Remove early comps for rec
#Starting with 101 model
#Remove fits to four years: 1981-1983, 1987
model = "1_0_1b_reduceComps"
base.101b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.101b)

#Block rec selectivity starting in 2002
#2002 used as this was where the pattern of comp shifted (not entirely due to sample size)
#set block upper limit (parm1) to 55cm since early estimates bumping up against this
#Starting with 101 model
model = "1_0_2_blockSelex_2002"
base.102 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.102)

#Remove fits to four years: 1981-1983, 1987
#Starting with 102 model
model = "1_0_2b_reduceComps_2002"
base.102b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.102b)

#Adjust selectivity blocking to be 1999
#Reason is that comps for 1995-1998 were most consistent with earlier peak in selectivity
#Starting with 102 model
model = "1_0_2_blockSelex_1999"
base.102_1999 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.102_1999)

#Remove fits to four years: 1981-1983, 1987
#Starting with 102_1999 model
model = "1_0_2b_reduceComps_1999"
base.102b_1999 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.102b_1999)

