# Quillback Washington Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\compare_catch_rec.R")

#Function to return model summary statistics
#total NLL, # estimate parameters, R0, depletion
sum_model <- function(model){
  return(c("NLL" = round(model$likelihoods_used[1,"values"],2),
              "n_parm" = round(model$N_estimated_parameters,0),
              "R0" = round(model$estimated_non_dev_parameters[1,"Value"],2),
              "depl" = round(model$current_depletion,2)))
  }

wd = "C:/Users/Brian.Langseth/Desktop/wa"



##########################################################################################
#                         Initial explorations
##########################################################################################

model = "0_0_init_model"
base = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base)

###############
#RecDevs
###############
model = "0_0_init_model_recFirst"
base.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1)

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


modelnames <- c("recdevs", "1960", "1980")
mysummary  <- SSsummarize(list(base.1.1, base.1.2, base.1.3))
SSplotComparisons(mysummary, 
                  filenameprefix = "0_recdevs_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         Data weighting
##########################################################################################

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
model = "0_2_dw_DM_fish"
base.2.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.3)

#Using inputN as sample size for commercial comps
model = "0_2_dw_DM_input"
base.2.3.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.3.2)


modelnames <- c("francis", "MI", "DM_fish", "DM_input")
mysummary  <- SSsummarize(list(base.2.1, base.2.2, base.2.3, base.2.3.2))
SSplotComparisons(mysummary, 
                  filenameprefix = "1_dataweighting_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

####################
#R0 profiling - use profiling code.R
#Set selectivity estimation to be phase 1, add 2020 rec catch
####################
model = "0_4_R0profiling"


##########################################################################################
#                         Cleaning up models
#                         Selex and some recruitment
##########################################################################################
#Starting with the 1980s recdev version (0_1_2)
#1. Set 2020 catch to be average of last three years for rec and comm
#2. Reset forecast catches to average of last three years of rec
#3. Set R0 init and prior lower
#####################
model = "1_0_0_recdevs"
base.100 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.100)

#Add separate commerical selectivity
model = "1_0_1_comSelex"
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

#Comparing catch and recruitment
compare_catch_rec(base.102b_1999, plots = "all", offset = 5) #Recruitment seems to align with large catches

#Estimate for dome shaped selectivity for rec fleet
#Starting with 101 model
model = "1_0_3_recdome"
base.103 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.103)


#Comparing runs
modelnames <- c("recdevs", "comSelex", "noearlyrec", "block2002", "block02_noearlyrec", "block1999", "block99_noearlyrec", "recdome")
mysummary  <- SSsummarize(list(base.100, base.101, base.101b, base.102, base.102b, base.102_1999, base.102b_1999, base.103))
SSplotComparisons(mysummary, 
                  filenameprefix = "2_selex_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

#There are tradeoffs between R0 and the first recruitment devs around 1995
#Dome shaped rec selectivity seems to aplify rec devs




##########################################################################################
#                         More cleaning up models
#                         Recdevs and recruitment bias
##########################################################################################

#Starting with the commercial selectivity model (101)
#1. Follow handbook guidance on setting selectivity for parm1 = mode; and parms 3, 4; set priors to inits)
#for both commercial and recreational
model = "1_1_1_updateSelex"
base.111 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.111)
base.111$sigma_R_info #Could increase to 0.9
bias111 = SS_fitbiasramp(base.111)
bias111
sum_model(base.111)
#NLL n_parm     R0   depl 
#674.77  80.00   1.57   0.19
compare_catch_rec(base.111, plots=2, offset = 4, type = "devs")

#Set main recdevs at start of time series
#Starting with 111 model
model = "1_1_2_set_recdevs_early"
base.112 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.112)
sum_model(base.112)
#NLL n_parm     R0   depl 
#674.34  80.00   1.59   0.22

#Reset bias adj parms to recommended values from 111
#Starting with 111 model
model = "1_1_3_biasadj"
base.113 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.113)
base.113$sigma_R_info #Could increase to 0.9 (same as 111 model)
bias113 = SS_fitbiasramp(base.113)
bias113 #no changes from recommended
sum_model(base.113)
#NLL n_parm     R0   depl 
#676.70  80.00   1.56   0.20

#Change sigmaR to recommended value (0.9). Fix. 
#Starting with 111 model
model = "1_1_4_sigmaRfix"
base.114 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.114)
base.114$sigma_R_info
bias114 = SS_fitbiasramp(base.114)
bias114 
sum_model(base.114)
#NLL n_parm     R0   depl 
#658.38  80.00   1.47   0.11 
compare_catch_rec(base.114, plots="all", offset = 5, type = "devs")

#Estimate sigmaR. Set phase to 2, where recdevs are estimated
#Increase max value to 1.2
#Starting with 111 model
model = "1_1_5_sigmaRest"
base.115 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.115)
#Estimation pushes it to the bound. 1.2 is HIGH. 

#Make recommeded bias adj from sigmaR = 0.9 (model 114)
#Start with model 114 and change bias ramps as recommended
model = "1_1_6_sigmaRfix_biasadj"
base.116 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.116)
base.116$sigma_R_info
bias116 = SS_fitbiasramp(base.116)
bias116 

#Reset bias adjustment 
#Start with model 116
model = "1_1_6_sigmaRfix_biasadj2"
base.116b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.116b)
base.116b$sigma_R_info
bias116b = SS_fitbiasramp(base.116b)
bias116b 
#Bias ramp goes back and forth as to when it starts

#Reset bias adjustment again 
#Start with model 116_adj2
model = "1_1_6_sigmaRfix_biasadj3"
base.116c = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.116c)
sum_model(base.116c)
#NLL n_parm     R0   depl 
#658.07  80.00   1.46   0.11
base.116c$sigma_R_info
bias116c = SS_fitbiasramp(base.116c)
bias116c 
##Model wants to increase sigmaR and decrease R0. Bias adjust varies but affect little. Main
#effect on model scale is adjusting sigmaR

#Remove early rec devs 
#Start with model 116_adj3 (116c)
model = "1_1_7_no_early_recdevs"
base.117 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.117)
sum_model(base.117) 
#NLL n_parm     R0   depl 
#658.34  58.00   1.49   0.12 

#Comparing runs - does iterating bias ramp affect things? --- NO
modelnames <- c("sigmaR09", "sigma09_bias", "sigma09_bias_iter1", "sigma09_bias_iter2")
mysummary  <- SSsummarize(list(base.114, base.116, base.116b, base.116c))
SSplotComparisons(mysummary, 
                  filenameprefix = "3_rec_biasramp",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

#Comparing runs
modelnames <- c("base", "early_mainrecdev", "reset_bias", "sigmaR09", "sigmaRest", "sigma09_bias", "sigma09_bias_iter", "no early recdevs")
mysummary  <- SSsummarize(list(base.111, base.112 , base.113, base.114, base.115, base.116, base.116c, base.117 ))
SSplotComparisons(mysummary, 
                  filenameprefix = "3_rec_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#There are tradeoffs between R0 and sigmaR (more variability, smaller R0)
#Seems like the early recdevs contribute to uncertainty around R0



##########################################################################################
#                         Adding ages
##########################################################################################

#Add ages
#Start with model 114
model = "2_0_0_ages"
base.200 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.200)
sum_model(base.200)
#NLL n_parm     R0   depl
#930.67  80.00   2.00   0.59 

#Set sigmaR back to 0.6
#Start with model 2000
model = "2_0_1_ages_sigmaR06"
base.201 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.201)
sum_model(base.201)
#NLL n_parm     R0   depl 
#946.10  80.00   1.96   0.55 

#Add data weighting - just Francis at the moment
SS_tune_comps(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\models\\wa\\2_0_0_ages", write = FALSE)
#Starting with model 200
model = "2_1_0_ages_francis"
base.210 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.210)
sum_model(base.210)
#NLL n_parm     R0   depl 
#138.41  80.00   3.59   0.77


modelnames <- c("no ages", "age0.9", "age0.6", "age_0.9Francis")
mysummary  <- SSsummarize(list(base.114, base.200, base.201, base.210))
SSplotComparisons(mysummary, 
                  filenameprefix = "4_ages_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         Continuing to explore selex and recdevs
##########################################################################################
#Adjust main dev start to 1989 and early dev start to 1980
#Starting with model 111
model = "3_0_0_devs1989"
base.300 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.300)
#Seems reasonable as this is when main devs start to be informative (due to rec comps being informative starting in '95)

#Remove early devs
#Starting with model 300
model = "3_0_1_noearlydevs"
base.301 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.301)
#Slight early recruitment differences but no real large change.
#Bias adj patterns starts low. Prob best to allow flex in early comp - So add early recs

#Remove early rec comps (1981-83, 1987)
#Starting with model 300
model = "3_1_0_noearlyReccomps"
base.310 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.310)
#These have very little effect.  

#Remove early comm devs too (all but 2002, 2006, 2014)
#Starting with model 310
model = "3_1_1_noSparsecomps"
base.311 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.311)
#These have very little effect. Gradients better with all com comps. Keep them in. 

#Estimate more selex params (all)
#Starting with model 300
model = "3_2_0_estSelex_all"
base.320 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.320)
sum_model(base.320)
#NLL n_parm     R0   depl 
#615.14  66.00   1.75   0.62 

#Estimate more selex params (only 1-4)
#Starting with model 300
model = "3_2_1_estSelex_14"
base.321 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.321)
sum_model(base.321)
#NLL n_parm     R0   depl 
#676.41  62.00   1.52   0.13 

#Estimate more selex params (only 1-4 but all in same phase for rec
#Starting with model 300
model = "3_2_2_estSelex_14phase"
base.322 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.322)
sum_model(base.322)
#NLL n_parm     R0   depl 
#676.19  62.00   1.51   0.13
#Dome selectivity matters, otherwise flexible fitting does not affect much


#Block selectivity
#Starting with model 300
model = "3_3_0_blockSelex1999"
base.330 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.330)

#Block selectivity
#Starting with model 330
model = "3_3_1_domelater"
base.331 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.331)
#dome shaped seles from 1999 on doesnt change much. Thus domed selx prior to 1999 is what affects model

#No recdevs 
#Starting with model 300
model = "3_4_0_norecdevs"
base.340 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.340)
sum_model(base.340)
#NLL  n_parm      R0    depl 
#1294.20    5.00    1.95    0.29 

#Compare runs
modelnames <- c("maindevs89", "maindevs89_noearly", "noearlyrecComps", "noSparseComps", "flexSelex_all", "flexSelex_14", "blockSelex", "recentDome", "norecdevs")
mysummary  <- SSsummarize(list(base.300, base.301, base.310, base.311, base.320, base.321, base.330, base.331, base.340))
SSplotComparisons(mysummary, 
                  filenameprefix = "6_Rec_Selex_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         More changes to data
#                      Add ages, increase comp bins
##########################################################################################
#Apply 7 yr moving average to smooth catches with sigmaR 0.6
#Start with model 111
model = "4_0_0_smoothCatch06"
base.400 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.400)

#Apply 7 yr moving average to smooth catches with sigmaR 0.9
#Start with model 400
model = "4_0_1_smoothCatch09"
base.401 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.401)

#Compare runs for smoothing catch
#Are recdevs following catch? Is it more prominent with sigmaR = 0.6 or 0.9
modelnames <- c("sigma06", "sigma09", "smoothCatch06", "smoothCatch09")
mysummary  <- SSsummarize(list(base.111, base.114, base.400, base.401))
SSplotComparisons(mysummary, 
                  filenameprefix = "5_smoothCatch_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#Recruitment for 0.6 an 0.9 runs are versy similar, and similar to when catch
#is smoothed. Recruitment may be timed similarly to catch, but magnitude is
#unaffected. 

#Explore larger bins size for comps (10-56) and increase bounds for p1
#Start with model 111
model = "4_1_0_largerBins"
base.410 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.410)
#Very little difference, as expected


##########################################################################################
#                         Data weighting
##########################################################################################
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\3_0_0_devs1989", write = FALSE)
#Starting from 300
#Francis
model = "5_0_0_dw_francis"
base.500 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.500)

#McAllister-Ianelli
model = "5_0_1_dw_mi"
base.501 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.510)

#Dirichlet Multinomial - report and comp report copied from model 300
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\5_0_2_dw_dm\\just model files")
model = "5_0_2_dw_dm"
base.520 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.520)




