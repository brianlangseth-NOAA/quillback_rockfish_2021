# Quillback Washington Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\compare_catch_rec.R")

#Function to return model summary statistics
#total NLL, # estimate parameters, R0, depletion
sum_model <- function(model){
  return(c("NLL" = round(model$likelihoods_used[1,"values"],2),
              "n_parm" = round(model$N_estimated_parameters,0),
              "R0" = round(model$estimated_non_dev_parameters["SR_LN(R0)","Value"],2),
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
model = "0_1_1_recdevs_longearly"
base.1.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.2)
#Makes no difference - ignore

##Starting recdevs when data become available 1980 to reduce # of parameters
model = "0_1_2_recdevs_1980"
base.1.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.3)
#Do so since longer recdevs aren't that variable. 
#Very similar to starting recdevs in 1960.
#Probably best to go with this one. 


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
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\0_2_dw_DM_fish\\just model files")
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
#Minimal effect because length of peak isn't also estimated. Below, when that is estimated 
#there is a larger effect

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
##Model wants to increase sigmaR and decrease R0. Bias adjust varies but effect little. Main
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

#This all blows up when downweigthing. Exclude due to not being in TORS. 
#Probaly would need to explore more if included.
#Limited inforamtion here other than affecting early recdevs


##########################################################################################
#                         Continuing to explore selex and recdevs
##########################################################################################
#Adjust main dev start to 1989 and early dev start to 1980
#Starting with model 111
model = "3_0_0_devs1989"
base.300 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.300)
#Seems reasonable as this is when main devs start to be informative (due to rec comps being informative starting in '95)
sum_model(base.300)
#NLL n_parm     R0   depl 
#676.41  58.00   1.52   0.13 

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
#dome shaped selex from 1999 on doesnt change model much. Issue is not due to just estimating p6 (if all parms
#estimated effect is similar). Reason this doesnt affect results but model 320 does is that including
#early period moves the later dome leftward and increasing early rec devs (compared to when estimating two 
#separate domes)

#Add a third block in 2010 and beyond (to capture peaks currently missing)
#Starting with model 330
model = "3_3_2_blockSelex1999_2010"
base.332 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.332)
#Slight rightward movement, but devs dont look much better and no known reason to 
#apply added block. Moving second block to start in 2014 didnt really improve devs 
#pattern either and many bounds on parameters were reached. 

#No recdevs 
#Starting with model 300
model = "3_4_0_norecdevs"
base.340 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.340)
sum_model(base.340)
#NLL  n_parm      R0    depl 
#1294.20    5.00    1.95    0.29 
#Scale doesn't change too much though depletion is less (higher value). 
#Pop declines over longer time (missing on gains from positive recdevs) and
#doesn't decline at end (missing on loses from negative recdevs). 
#R0 is higher (probably to compensate for lost peaks in recdevs) and selex moves left. 

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
#                      Add ages, increase comp bins, estimate linf
##########################################################################################
#Apply 7 yr moving average to smooth catches with sigmaR 0.6
#Start with model 111
model = "4_0_0_smoothCatch06"
base.400 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.400)
compare_catch_rec(base.400, plots=2, offset = 4, type = "devs")

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

#Explore effect of catch on recdevs
#Fix selectivity parms to estimated values from model 111, remove comps, est recdevs
#Start with model 111 - comment out all comps except one year
#Did this three times: 2006 com, 2020 rec, 1995 rec
model = "4_2_0_noLengthData_com2006"
base.420.c06 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.420.c06)
model = "4_2_0_noLengthData_rec2020"
base.420.r20 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.420.r20)
model = "4_2_0_noLengthData_rec1995"
base.420.r95 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.420.r95)
#Compare runs
modelnames <- c("withComps","com2006", "rec2020", "rec1995")
mysummary  <- SSsummarize(list(base.111, base.420.c06, base.420.r20, base.420.r95))
SSplotComparisons(mysummary, 
                  filenameprefix = "420_fixSelex_estRecdevs_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#Catch does not appear to be driving recdevs. Either they are flat or influenced by the year of comps
#I kept in (which was required for recedevs to be estimated). 

#Estimate length at Amax
#Start with model 300
model = "4_3_0_estLinf"
base.430 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.430)
#42.69 compared to fixed value of 44  but big difference in depletion
sum_model(base.430)
#NLL n_parm     R0   depl 
#664.20  59.00   1.61   0.45 

#Set length at Amax to reflect Linf
#Start with model 300
model = "4_3_1_LAmax999"
base.431 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.431)
sum_model(base.431)
#NLL n_parm     R0   depl 
#670.49  58.00   1.54   0.22
#Depletion is higher and R0 is too. 
#Compare runs for smoothing catch
#Are recdevs following catch? Is it more prominent with sigmaR = 0.6 or 0.9
modelnames <- c("base", "estLinf", "LAmax999")
mysummary  <- SSsummarize(list(base.300, base.430, base.431))
SSplotComparisons(mysummary, 
                  filenameprefix = "5b_Linf_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         Data weighting
##########################################################################################
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\3_0_0_devs1989", write = FALSE)
#Starting from model 300
#Francis
model = "5_0_0_dw_francis"
base.500 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.500)
#Francis adj
#1 0.1922
#2 0.3888

#McAllister-Ianelli
model = "5_0_1_dw_mi"
base.501 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.501)
#MI adj
#1 0.0736
#2 0.1574

#Dirichlet Multinomial - report and comp report copied from model 300
#Starting from model 300 but use InputN for sample size
#This sets up the DM option within the .ctl and .dat files
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\5_0_2_dw_dm\\just model files")
model = "5_0_2_dw_dm"
base.502 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.502)
base.502$Dirichlet_Multinomial_pars
#DM theta theta/(1+theta)
#1  1.07  0.518  
#2  59.4  0.985

#Starting from model 300 but keep Nsamples for sample size
#This sets up the DM option within the .ctl and .dat files
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\5_0_3_dw_dm_samples\\just model files")
model = "5_0_3_dw_dm_samples"
base.503 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.503)
base.503$Dirichlet_Multinomial_pars
#DM theta theta/(1+theta)
#1  1.07  0.517  
#2  59.4  0.983
#Functionally no different when weighting by samples versus inputN as commercial comps matter little

#Compare runs
modelnames <- c("maindevs89", "norecdevs", "Francis", "MI", "DM")
mysummary  <- SSsummarize(list(base.300, base.340, base.500, base.501, base.502))
SSplotComparisons(mysummary, 
                  filenameprefix = "7_dataWeighting_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                        Initial Final explorations
##########################################################################################

#Patterns very similar to copper. Increased mean length later in time period along with lack 
#of small fish in comps and small catches suggest recent recruitment failures. Mean length pattern and
#biomass pattern similar to copper. 
#Recdev patterns are high early to caputre presence of smaller fish in comps, but then runs
#negative to capture lack of small fish in comps.
#If block after 1999, comps better fit, but still missing band of larger fish. If block 2010, same. 
#No evidence for these blocks however. 
#When include recdevs, selectivity shifts rightward. Blocking selex results in leftward estimates early
#When estimate Linf, although estimate is 1.5 cm lower, depletion changes greatly due to different recdevs
#and higher R0 estimate. 

#Elect to not do recdevs. Reasons are limited data, very high selex curve (no recdevs brings it down), 
#prominent patterns in devs (positive rec devs early followed by low). A general lack of selection of 
#small fish in later comps (or more selection of smaller fish earlier), suggesting perhaps a sampling
#issue, and large peaks in bias adj pattern and 0 max bias adj. Also, is this stock that depleted.
#Note that recdevs do track mean length and it could be possibly stock is that depleted since they are 
#susceptible so need to include as sensitivity. 

#Base model
#Starting from model 300 but exclude recdevs and set LAmax to be Linf
model = "6_0_base"
base.600 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.600)

#R0 profile - use profiling code.R
#Start with model 600 but set rec parm 1's phase to phase 1

#Include recdevs
#Starting from model 600 but set bound for selex p1 to 55
#Run once and make suggested bias adjustments (1980, 1998, 2014, 2032, max_bias to 0)
model = "6_1_recdevs"
base.610 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.610)
SS_fitbiasramp(base.610, verbose=TRUE) 

#Data weighting 
#Starting with model 600
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\6_0_base", write = FALSE)
model = "6_2_1_dw_francis"
base.621 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.621)

model = "6_2_2_dw_MI"
base.622 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.622)

#Use InputN for sample size
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\6_2_3_dw_DM\\just model files")
model = "6_2_3_dw_DM"
base.623 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.623)

#Use number of samples for sample size
#Starting from moeel 623
model = "6_2_4_dw_DM_fish"
base.624 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.624)

#Compare runs
modelnames <- c("base", "recdevs", "Francis", "MI", "DM", "DM fish")
mysummary  <- SSsummarize(list(base.600, base.610, base.621, base.622, base.623, base.624))
SSplotComparisons(mysummary, 
                  filenameprefix = "8_baseComparisons_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)



#################################################
#Test for understanding why recdevs selex changes when recdevs turned on
###################################################

#Test for understanding why recdevs selex changes when recdevs turned on
#Starting with model 600 - fix selex to be the values of model 610
model = "6_0_test_fixselex at recdev"
base.601 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.601)

#Test for understanding why recdevs selex changes when recdevs turned on
#Starting with model 610 - fix selex to be the values of model 600
model = "6_1_test_fixselex at base"
base.611 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.611)


#Compare runs
modelnames <- c("base", "recdevs", "base-selex@rec", "recdevs-selex@base")
mysummary  <- SSsummarize(list(base.600, base.610, base.601, base.611))
SSplotComparisons(mysummary, 
                  filenameprefix = "8_baseTestComparisons_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

#Explore effect of using catch in numbers
#Start with model 600 but switch catch to be weight instead of numbers
model = "6_0_test_catchWeight"
base.602 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.602)

#Start with model 610 but switch catch to be weight instead of numbers
model = "6_1_test_catchWeight"
base.612 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.612)
#The change in selex occurs whether numbers or weight is entered for catch

##
#Exclude recent recdevs since likely aren't being informed anyway
#Age at 50% selectivity is around 9, so remove last 7 years 
#Start with model 610
model = "6_1_test_norecentDevs"
base.613 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.613)
#The change in selex occurs whether numbers or weight is entered for catch
#Removing more years (say last 17 years) effects things. Recdevs balance early
#and there are more positive than when all devs are read. The fact this matters
#is a bit concerning, though not surprising, making me more comfortable not
#including recdevs.


##########################################################################################
#     Test of what happens when comparing data weighting before remove recdevs versus after remove recdevs
##########################################################################################

#Data weighting from recdev model
#Starting with model 610
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\6_1_recdevs", write = FALSE)
model = "6_1_1_recdevs_dw_francis"
base.611 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.611)
#Now turn recdevs off
model = "6_1_1b_norecdevs"
base.611b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.611b)


model = "6_1_2_recdevs_dw_MI"
base.612 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.612)
#Now turn recdevs off
model = "6_1_2b_norecdevs"
base.612b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.612b)


#Use Nsamples for sample size
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\6_1_3_recdevs_dw_DM_fish\\just model files")
model = "6_1_3_recdevs_dw_DM_fish"
base.613 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.613)
#Now turn recdevs off
model = "6_1_3b_norecdevs"
base.613b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.613b)


#Compare runs
modelnames <- c("recdevs", "rFrancs", "rMI", "rDM fish")
mysummary  <- SSsummarize(list(base.610, base.611, base.612, base.613))
SSplotComparisons(mysummary, 
                  filenameprefix = "9_dwrecdevs_Comparisons_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


#Compare runs - compare data-weigthing model without devs to dataweighting recdevs model and removing recdevs
modelnames <- c("nodevs_nodw","nodevs_Francis", "nodevs_MI", "nodevs_DM fish", 
                "Francis_nodevs", "MI_nodevs", "DM fish_nodevs")
mysummary  <- SSsummarize(list(base.600,base.621, base.622, base.624,
                               base.611b, base.612b, base.613b))
SSplotComparisons(mysummary, 
                  filenameprefix = "10_dw_rec_Comparisons_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#Basically, the order in weight you data weight or add/remove recdevs doesn't really matter (it did though for Francis slightly)



##########################################################################################
#                         Small additions to base models
##########################################################################################

#Read ages
#Starting with model 600 - add ghost ages, set beta prior to 2
model = "7_0_base_ages"
base.700 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.700)

#Read ages
#Starting with model 610 - add ghost ages, set beta prior to 2
model = "7_1_recdev_ages"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.710)

#When recdevs are included the age distribution is poorly fit whereas when recdevs are not included
#the age comps are more reasonable. The 1990 and 1994 recruitment spikes wash out all other ages
#Suggests some evidence that recdevs are probably overly high


##########################################################################################
#                         Continue base model construction
##########################################################################################

#Start with francis dataweighted model with recdevs. Logic is that data weighting should be an
#early step, done before removing recdevs. 

#Base model
#Starting with model 611b
#Add ages. Set beta prior to 2. Reapply data weighting; estimate selex parms 1-4, reest selex 1,3 
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\6_1_1b_norecdevs", write = FALSE)
model = "8_0_base"
base.800 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.800)

#See if early years of rec data influence the data weighting greatly....They dont for francis, a little more for MI
model = "8_0_1_noearlyrecyears"
base.801 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.801)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\8_0_1_noearlyrecyears", write = FALSE)

#Add recdevs as a sensitivity
#Starting with model 800
#Set bias adj based on what is suggested
model = "8_1_recdevs"
base.810 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.810)

#Compare runs - compare data-weigthing model without devs to dataweighting recdevs model and removing recdevs
modelnames <- c("base-dw","base-nodw", "recdevs-dw", "recdevs-nodw")
mysummary  <- SSsummarize(list(base.800,base.600, base.810, base.610))
SSplotComparisons(mysummary, 
                  filenameprefix = "11_base_Comparisons_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         More base model construction with updated data
##########################################################################################

#Add updated data and new Life history data to model
#1. New L-A relationship based on WCGBTS data and new PacFIN age samples (with right A1 and L1)
#2. New L-W relationship based on including rec (excluding imputted weight and length) and new data
#3. Udpated 2020 data
  #a. Recreational catch
  #b. Recreational comps (just 2020)
  #c. Commercial catch  - Remove research removals - Add 2020 tribal
  #d. Commercial comps (2020 and all years) - Change to using InputN from Nsamples - No comps for 2020 (didn't sample)
  #e. Add new commercial age ghost ages

#Starting with model 800
model = "9_0_0_base"
base.900 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.900)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\9_0_0_base", write = FALSE, option = "none") #for first initial pass


##########################################################################################
#                         Pre assessment workshop base model
##########################################################################################

#Starting with model 900

#1. Exclude age data in dat, and reset lambda in ctl
#2. Adjust steepness prior SD to 0.158 (was 0.09)
#3. Change max age to 95 years, adjust natural mortality accordingly (0.057)
#4. Adjust forecast projection values to pstar values PEPtools::get_buffer (same as copper) 
#5. Change control rule format in forecast from f(SSB) on F to f(SSB) on catch
#6. Adjust forecast catch. Previously the value from 2020. Now, take the Washington percentage 
#of the North ACL (12.9% of 5.73 for 2021 and 5.74 for 2022) apportioned to commercial and recreational
#based on the average percentage of catch for each from 2018-2020. Because rec catch is in numbers,
#take the catch in biomass from model 900 for averaging. 
catchbio = base.900$catch[,c("Yr","Fleet","Obs","kill_num","kill_bio")]
rec_perc = catchbio[catchbio$Yr %in% c(2018:2020) & catchbio$Fleet == 1,"kill_bio"]/aggregate(kill_bio~Yr,catchbio[catchbio$Yr %in% c(2018:2020),],FUN=sum)$kill_bio
mean(rec_perc) #97.5%
#But, need to enter the forecast value in numbers. 
source("https://raw.githubusercontent.com/nwfsc-assess/PEPtools/master/R/solve_numbers.R")
solve_numbers(mod_dir = file.path(wd, "10_0_0_base", "just model files","forecasting"), fore_yrs = 2021:2022, 
              fleet_abc = c(0.7207, 0.7219), fleet = 1)

model = "10_0_0_base"
base.1000 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.1000)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_0_base", write = FALSE, option = "none") #for first initial pass

#Full base version of included recdevs
#Starting with model 1011 (below), update data weighting, and bias adj as needed
#Set end of bias adj to 2020
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\sensitivities\\10_1_1_recDevs", write = FALSE, option = "none") #for first initial pass
model = "10_0_1_recDevs_fullchanges"
base.1001 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.1001)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_1_recDevs_fullchanges", write = FALSE, option = "none") #for first initial pass
#Still some weighting issues after three iterations but I feel like the general outcome is not going to change much. 
#Little information gained from including recdevs. 

#Removing early rec length samples (those in the 1980s) but keeping recdevs
model = "10_0_2_recDevs_noearlyRec"
base.1002 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.1002)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_2_recDevs_noearlyRec", write = FALSE, option = "none") #for first initial pass

#Selex is large compared to copper. Check if selex parms 2 and 4 influence selectivity values.
model = "10_0_3_4parmSelex"
base.1003 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.1003)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_3_4parmSelex", write = FALSE, option = "none") #for first initial pass
#No effect

#Confine bounds on selex from 55 to 50.
#Starting from model 1002
model = "10_0_4_confineSelex50"
base.1004 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.1004)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_4_confineSelex50", write = FALSE, option = "none") #for first initial pass
#No effect

#Confine bounds on selex from 55 to 43. This is to test is status improves
#Starting from model 1002
model = "10_0_5_confineSelex43"
base.1005 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.1005)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_5_confineSelex43", write = FALSE, option = "none") #for first initial pass
#Status improves. Selex bound is reached, and R0 increases. Should understand why. 

#Alternative phasing
#just model files_all2 - Set all parameters (expect R0) to phase 2
#just model files_recselex4 - Set all rec selex parameters to phase 4 - same
#just model files_comselex4 - Set all com selex parameters to phase 4 - kicks it into the low rec selex version that has poorer negative log likelihood
model = "just model files_comselex4"
base.phase = SS_output(file.path(wd, "10_0_0_basePhasing", model),covar=TRUE)
SS_plots(base.phase)
#See if after data weighting this alternative phase model ends up in the original state
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\10_0_0_basePhasing\\just model files_comselex4", write = FALSE)
model = "just model files_comselex4_reweight"
base.phase.rw = SS_output(file.path(wd, "10_0_0_basePhasing", model),covar=TRUE)
SS_plots(base.phase.rw)
#It does not. Now lets if once putting the phases back to the original phase, the model esitmates the same 
model = "just model files_comselex4_reweight_origphase"
base.phase.rw.orig = SS_output(file.path(wd, "10_0_0_basePhasing", model),covar=TRUE)
SS_plots(base.phase.rw.orig)
#It does. Put as sensitivity


##############################################
#       Sensitivities - Starting with model 1000
##############################################
#Include recruitment deviations
model = "10_1_1_recDevs"
base.1011 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1011)

#Include recruitment deviations and reweight. Did multiple times
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\sensitivities\\10_1_1_recDevs", write = FALSE)
model = "10_1_1b_recDevs_reweight"
base.1011b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1011b)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\sensitivities\\10_1_1b_recDevs_reweight", write = FALSE)

#Data weighting using McAllister-Ianelli
model = "10_1_2_dw_MI"
base.1012 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
SS_plots(base.1012)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\sensitivities\\10_1_2_dw_MI", write = FALSE)

#Data weighting using Dirichlet Multinomial - Copy Report, ComReport, Covar, and Warning file from model 1000
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\wa\\sensitivities\\10_1_3_dw_DM\\just model files")
model = "10_1_3_dw_DM"
base.1013 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1013)
base.1013$Length_Comp_Fit_Summary
#Theta/(1+theta) commercial = 0.9836962 (theta = 60.335400)
#Theta/(1+theta) recreational = 0.1717789 (theta = 0.207407)

#Estimate L infinity
model = "10_1_4_estlinf"
base.1014 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1014)

#Estimate L infinity and K
model = "10_1_5_estlinfK"
base.1015 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1015)
#Results are not right. R0 explodes.

#Estimate just K
model = "10_1_5_estK"
base.1015b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1015b)
#Results are not right. R0 explodes.

#Estimate just K with recdevs
#Starting from model 1011
model = "10_1_5_recDevs_estK"
base.1015c = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1015c)
#Selex ests are off. They reach upper bounds. Reset bounds on max selex to be 50.
#With bounds at 50, max selex reaches bounds but estimate of M is lower. 
#There is a tradeoff between M and selex. 

#Estimate CV at L2
model = "10_1_6_estL2CV"
base.1016 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1016)

#Estimate natural mortality
model = "10_1_7_estM"
base.1017 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1017)
#Selex ests are off. They reach upper bounds. Reset bounds on max selex to be 50.
#With bounds at 50, max selex reaches bounds but estimate of M is lower. 
#There is a tradeoff between M and selex. 

#Remove early recreational comps (the 80s)
model = "10_1_8_noEarlyRec"
base.1018 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1018)

#Dont fit to commercial comps, but mirror rec comps. Include com comps as ghost fleet
model = "10_1_9_mirrorCom"
base.1019 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.1019)

#Use dome shaped selectivity selectivity for recreational fleet
#Blows up (high R0) so apply with recdevs
model = "10_1_10_recDome"
base.10110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.10110)

#Use dome shaped selectivity selectivity for recreational fleet with recdevs
#Starting from model 1011
model = "10_1_10b_recDevs_recDome"
base.10110b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.10110b)

#Use dome shaped selectivity for commercial fleet
model = "10_1_11_comDome"
base.10111 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.10111)

#Set block for early recreational comps data (block ending in 1999)
model = "10_1_12_recBlock99"
base.10112 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.10112)

#Set block for early recreational comps data (block ending in 2010)
model = "10_1_13_recBlock2010"
base.10113 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.10113)

#Copied the alternative phasing model with com selectivity at phase 4 (model base.phase)
model = "10_1_14_altphase"
base.10114 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)


#Compare sensitivities
#sens_names <- c("Base mode","Rec devs","DW MI", "DW DM", "Est Linf", "Est Linf, K", "Est K", "Est K, recdevs", "Est Old CV", "Est M", "No early rec comps", "No com comps", "Rec dome-shaped selex., recdevs", "Com dome-shaped selex.", "Rec block selex.", "Alt Phase")
#sens_models  <- SSsummarize(list(base.1000, base.1011, base.1012, base.1013, base.1014, base.1015, base.1015b, base.1015c, base.1016, base.1017, base.1018, base.1019, base.10110b, base.10111, base.10112, base.10114))
#Linf,K and K runs are unreasonable, ultimately didn't decide to go with est K with recdevs - exclude for now
#These are the model runs for the non-subset plots
sens_names <- c("Base mode","Rec devs","Rec devs reweight", "DW MI", "DW DM", "Est Linf", "Est Old CV", "Est M", "No early rec comps", "No com comps", "Rec dome-shaped selex., recdevs", "Com dome-shaped selex.", "Rec block selex.", "Alt Phase")
sens_models  <- SSsummarize(list(base.1000, base.1011, base.1011b, base.1012, base.1013, base.1014, base.1016, base.1017, base.1018, base.1019, base.10110b, base.10111, base.10112, base.10114))
# #L2 CV run is very high, but not unreasonable - exclude for now
# sens_names <- c("Base mode","Rec devs","DW MI", "DW DM", "Est Linf", "Est M", "No early rec comps", "No com comps", "Rec dome-shaped selex., recdevs", "Com dome-shaped selex.", "Rec block selex.", "Alt Phase")
# sens_models  <- SSsummarize(list(base.1000, base.1011, base.1012, base.1013, base.1014, base.1017, base.1018, base.1019, base.10110b, base.10111, base.10112, base.10114))
# #Linf run and alternative phasing are very uncertain - exclude for now
# #These are model runs for the "subset" plots
sens_names <- c("Base mode","Rec devs","Rec devs reweight","DW MI", "DW DM", "Est M", "No early rec comps", "No com comps", "Rec dome-shaped selex., recdevs", "Com dome-shaped selex.", "Rec block selex.") 
sens_models  <- SSsummarize(list(base.1000, base.1011, base.1011b, base.1012, base.1013, base.1017, base.1018, base.1019, base.10110b, base.10111, base.10112))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "topright", 
                  legendncol = 2,
                  filenameprefix = paste0("base.1000_sensitivities_"),
                  subplot = c(2,4,10), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "topright", 
                  legendncol = 2,
                  filenameprefix = paste0("base.1000_sensitivities_"),
                  subplot = c(1,3,9), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "bottom", 
                  legendncol = 2,
                  filenameprefix = paste0("base.1000_sensitivities_"),
                  subplot = 12, 
                  print = TRUE, 
                  pdf = FALSE)

# Create a Table of Results
n = length(sens_names)

sens_table = rbind(
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "TOTAL",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Length_comp",1:n]),
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Recruitment",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Forecast_Recruitment",1:n]),
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Parm_priors",1:n]),
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Parm_softbounds",1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "SR_LN(R0)", 1:n]), 
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_Virgin", 1:n]),
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_2021", 1:n]),
  as.numeric(sens_models$Bratio[sens_models$Bratio$Label == "Bratio_2021", 1:n]), 
  as.numeric(sens_models$quants[sens_models$quants$Label == "Dead_Catch_SPR", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "SR_BH_steep", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "L_at_Amin_Fem_GP_1", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "L_at_Amax_Fem_GP_1", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "VonBert_K_Fem_GP_1", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "CV_young_Fem_GP_1", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "CV_old_Fem_GP_1", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_WA_Recreational(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_WA_Commercial(2)", 1:n])  )  

sens_table = as.data.frame(sens_table)
colnames(sens_table) = sens_names
rownames(sens_table) = c("Total Likelihood",
                         "Length Likelihood",
                         "Recruitment Likelihood",
                         "Forecast Recruitment Likelihood",
                         "Parameter Priors Likelihood",
                         "Parameter Bounds Likelihood",
                         "log(R0)",
                         "SB Virgin",
                         "SB 2020",
                         "Fraction Unfished 2021",
                         "Total Yield at SPR 50",
                         "Steepness",
                         "Natural Mortality",
                         "Length at Amin",
                         "Length at Amax",
                         "Von Bert. k",
                         "CV young",
                         "CV old",
                         "Peak recreational selex",
                         "Peak commercial selex")

write.csv(sens_table, file = file.path(wd, "sensitivities", paste0("base.1000_sensitivities.csv")))

t = table_format(x = sens_table,
                 caption = 'Sensitivities relative to the base model.',
                 label = 'sensitivities',
                 longtable = TRUE,
                 font_size = 9,
                 digits = 3,
                 landscape = TRUE,
                 col_names = sens_names)

kableExtra::save_kable(t, file = file.path("C:/Users/Brian.Langseth/Desktop/wa/write_up/tex_tables/sensitivities.tex"))


