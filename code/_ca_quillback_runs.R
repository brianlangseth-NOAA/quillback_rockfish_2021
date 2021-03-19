# Quillback California Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\compare_catch_rec.R")

wd = "C:/Users/Brian.Langseth/Desktop/ca"

sum_model <- function(model){
  return(c("NLL_Tot" = round(model$likelihoods_used[1,"values"],2),
           "NLL_Com" = round(model$likelihoods_by_fleet[6,"CA_Commercial"],2),
           "NLL_Rec" = round(model$likelihoods_by_fleet[6,"CA_Recreational"],2),
           "n_parm" = round(model$N_estimated_parameters,0),
           "R0" = round(model$estimated_non_dev_parameters["SR_LN(R0)","Value"],2),
           "depl" = round(model$current_depletion,2)))
}

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


##########################################################################################
#                         More base model construction with updated data
##########################################################################################

#1. Start model with Francis weighting sensitivity from previously unweighted base

#Add updated data and new Life history data to model
#2. New L-A relationship based on WCGBTS data and new PacFIN age samples (with right A1 and L1)
#3. New L-W relationship based on including rec (excluding imputted weight and length) and new data
#4. Udpated 2020 data
  #a. Recreational catch (2020)
  #b. Commercial catch (all years) - Remove research removals
  #c. Commercial comps (all years) - Change to using InputN from Nsamples
  #d. Recreational comps (all years) - No samples for 2020
#5. Reset prior selex values to initial prior values (model 300)
#6. Set forecast to match 2020 catch levels
#7. Redo data weighting
#Process for adjusting inputs: run initial0, adjust data weighting (initial1), fix selex parms 2 and 4 and re-estimate 1, 3 (initial2), redo bias adj (initial3))

#Starting with model 411
model = "5_0_0_base"
base.500 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.500)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_0_0_base", write = FALSE, option = "none") #for first initial pass
sum_model(base.500)

#Replace with MI weighting
#Starting with model 500 - initial1. Reset dataweights, and reest selex parms 1,3
model = "5_0_1_MI"
base.501 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.501)

#Check effect of new growth - used oldLA relationship (with right A1 and L1)
#Starting with model 500
model = "5_0_2_oldLA"
base.502 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.502)
#Effect is to have more depletion

#Add selex blocks for rec and comm
#Starting with model 500 - run (initial 0) - reset dataweighting
model = "5_0_3_blocks"
base.503 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.503)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_0_3_blocks", write = FALSE, option = "none") #for first initial pass
#Comm appears to be more needing of it, rec difference is very small
#Originally placed at 2004 for both, but comm appears to be more so at 2006 based on fit and residuals, but not with mean leangth
#Rec NLL is lower but fits appear better without block. Thus set only for comm. Ultimately would suggest 2010 based on residual patter
#and fit and mean length though its very speculative. 

#No recdevs
#Starting with model 500 - run (initial 0) - reset dataweighting
model = "5_0_4_norecdevs"
base.504 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.504)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_0_4_norecdevs", write = FALSE, option = "none") #for first initial pass

#Effect of changing to NInput from Nsamples for commercial
#Starting with model 500 - reset dataweighting twice
model = "5_0_5_nsamples"
base.505 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.505)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_0_5_nsamples", write = FALSE, option = "none") #for first initial pass

#No dataweighting applied 
#Starting with model 500
model = "5_0_6_noDW"
base.506 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.506)

#Remove large rec catch in 1991 
#Starting with model 500
model = "5_0_7_noBigCatch"
base.507 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.507)
#No real effect

#Add dome shaped for rec 
#Starting with model 500 - minimal effect if just estimated parm 6 so try with reest parms 2 and 4 (initial1) - minimal effect
model = "5_0_8_domeRec"
base.508 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.508)
sum_model(base.508) #Minimal effect

#Add dome shaped for rec 
#Starting with model 500 - minimal effect if just estimated parm 6 so try with reest parms 2 and 4 (initial1) - minimal effect
model = "5_0_9_domeCom"
base.509 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.509)
sum_model(base.508) #Minimal effect

#Add dome shaped for rec 
#Starting with model 500  
model = "5_0_10_Linf42"
base.5010 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.5010)


#Compare differences from last base
modelnames <- c("oldBase-noDW", "oldBase-DW", "newBase", "newBase-oldLA", "newBase-Nsamples", "newBase-noDW")
mysummary  <- SSsummarize(list(base.400, base.411, base.500, base.502, base.505, base.506))
SSplotComparisons(mysummary, 
                  filenameprefix = "5b_differences_from_last_base_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#A combination of data weighting and the new growth curve put model in more depletion state.  


#Compare runs
modelnames <- c("francis", "MI", "blocks", "norecdev", "noDW", "recDome", "comDome")
mysummary  <- SSsummarize(list(base.500, base.501, base.503, base.504, base.506, base.508, base.509))
SSplotComparisons(mysummary, 
                  filenameprefix = "5_base_exploration_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#Main story is that the model goes to the same place regardless of common decisions. Evidence to point to current setup


################
#Ongoing exploration with base. MI model (501)
################

#Adjust bias adj to match recent (2000+) pattern
#Starting with model 501  
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_0_1_MI", write = FALSE, option = "none") #for first initial pass
model = "5_1_0_biasAdj"
base.510 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.510)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_1_0_biasAdj", write = FALSE, option = "none") #for first initial pass

#Remove comps with N <= 5 (see if this affects estimated) - Does affect dataweighting so redid weighting
#Starting with model 501  
model = "5_1_1_noSmallSamps"
base.511 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.511)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_1_1_noSmallSamps", write = FALSE, option = "none") #for first initial pass

#Remove comps with N < 10 (see if this affects estimated) - Does affect dataweighting so redid weighting
#Starting with model 501  
model = "5_1_2_noSmallSamps10"
base.512 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.512)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_1_2_noSmallSamps10", write = FALSE, option = "none") #for first initial pass

#Estimate Linf
#Starting with model 501 - change prior and SD on L2 (set normal and arbitrarily SD to 5 to have wide variability)  
model = "5_1_3_estLinf"
base.513 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.513)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_1_3_estLinf", write = FALSE, option = "none") #for first initial pass
sum_model(base.513)

#Estimate Linf and K
#Starting with model 513 
model = "5_1_4_estLinfK"
base.514 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.514)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_1_4_estLinfK", write = FALSE, option = "none") #for first initial pass

#Estimate Linf and L1
#Starting with model 513 
model = "5_1_5_estLinfKL1"
base.515 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.515)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\5_1_5_estLinfKL1", write = FALSE, option = "none") #for first initial pass

#Compare runs
modelnames <- c("MI", "adjBias", "noSmallSamp5", "noSmallSamp10", "estLinf", "estLinfK", "estLinfKL1")
mysummary  <- SSsummarize(list(base.501, base.510, base.511, base.512, base.513, base.514, base.515))
SSplotComparisons(mysummary, 
                  filenameprefix = "5_1_base_exploration_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

#Testing effects of changing weights, but keeping relative ratio the same
#Starting with model 501

#Decreasing both weights three-fold
model = "5_2_0_testDWsmall"
base.520 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.520)

#Increasing both weights three-fold
model = "5_2_1_testDWlarge"
base.521 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.521)

#Francis: decreasing both weights three-fold 
model = "5_2_2_testDWlarge_Francis"
base.522 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.522)

#Francis: increasing both weights three-fold 
model = "5_2_3_testDWsmall_Francis"
base.523 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.523)

#Francis: no change. To compare with increase and decrease
model = "5_2_4_testDW_Francis"
base.524 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.524)

#Take home is that the absolute value does matter, maybe not so much for overall trajectory,
#but it can adjust scale, and recdevs.



##########################################################################################
#                         Updating base
##########################################################################################

#Start with model 5_1_0 and
#1. remove first three years of commercial comps (which have Ninput of 1)

#Starting with model 510
model = "6_0_0_base"
base.600 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.600)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_0_base", write = FALSE, option = "none") #for first initial pass


#################
#Exploring reason for variance of recdevs being more than sigmaR (bias adj plots showing many eaerly years with higher se than sigmaR)
#################
#Increase sigmaR to recommended value
#Starting with model 600
base.600$sigma_R_info #set to 0.9
model = "6_0_1_sigmaR09"
base.601 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.601)
base.601$sigma_R_info #set to 0.9
#Wants to push sigmaR even higher to 1.2. Also setting to 0.9 doesnt resolve poorly informed recdevs before 2000 (still have variance above sigmaR^2)
#And overall biomass trajectory is the same

#Set doRecDev option (line 110 in .ctl) to 2 (so devs dont have to sum to 1)
model = "6_0_2_option2"
base.602 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.602)
sum(base.602$recruit[base.602$recruit$era=="Main",]$dev, na.rm=T)
#Biomass pattern is similar and issue of early years of recdev with high variance is not fixed. Selex and R0 do change, and probably are reasons for some change in trajectory

#Fix R0 and redo model 602.
#Fix R0 at estimate from model 600, set parm1 selex for rec and comm to phase 1
model = "6_0_2_1_option2fix"
base.6021 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6021)
sum(base.6021$recruit[base.6021$recruit$era=="Main",]$dev, na.rm=T)
#Zero recdev line moves up, causing period of lower recdevs to be less low, so population trajectory tics up in later years. 
#Issue with variance of recdevs does is not fixed however. 

#Cut out early recdevs. Start main devs in 1996
model = "6_0_3_latedevs96"
base.603 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.603)
#Allows less negative recruitments in recent period so population bumps up a bit. R0 changes slightly. Pattern still there in early devs. 

#Cut out early recdevs. Start main devs in 1999
model = "6_0_3_1_latedevs99"
base.6031 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6031)


#Adjust growth to be tigheter (lower CV). Set to 0.01 for low and high ages
model = "6_0_4_0_LACV01"
base.6040 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6040)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_4_0_LACV01", write = FALSE, option = "none") #for first initial pass
#This resolves the bias adjust variance issue. Obviously doesn't fit well 

#Adjust growth to be tigheter (lower CV). Set to 0.05 for low and high ages
model = "6_0_4_1_LACV_05"
base.6041 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6041)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_4_1_LACV05", write = FALSE, option = "none") #for first initial pass
#Fits are better though some bias adjust issues persist. 

#Adjust growth to be tigheter for young (lower CV). Set to 0.01 for young ages only
model = "6_0_4_2_LACVyoung01"
base.6042 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6042)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_4_2_LACVyoung01", write = FALSE, option = "none") #for first initial pass
#Bias adjust issues persist

#Adjust growth to be tigheter for old (lower CV). Set to 0.01 for high ages only
model = "6_0_4_3_LACVold01"
base.6043 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6043)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_4_3_LACVold01", write = FALSE, option = "none") #for first initial pass
#Bias adjust issues are much better (recdev variance < sigmaR) suggesting varibility at older size is contirubting to uncertainty. BIomass trajectory is fairly similar
#May need to readjust dataweighting

#Adjust CV patterns to be based on CV by age, set low to 1 and high to 20
model = "6_0_4_4_CVfunc1"
base.6044 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6044)

#Adjusting steepness does not change bias adjust issue. to see if that affects bias adj
model = "6_0_5_0_lowerH"
base.6050 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6050)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_5_0_lowerH", write = FALSE, option = "none") #for first initial pass
#Bias adjust issues are much better (recdev variance < sigmaR) suggesting varibility at older size is contirubting to uncertainty. BIomass trajectory is fairly similar

#Adjust steepness to see if that affects bias adj
model = "6_0_5_1_higherH"
base.6051 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.6051)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_4_3_LACVold01", write = FALSE, option = "none") #for first initial pass
#Bias adjust issues are much better (recdev variance < sigmaR) suggesting varibility at older size is contirubting to uncertainty. BIomass trajectory is fairly similar

#Reduce high catch years - took spikes and made between the year before and year after for rec and comm
model = "6_0_6_lowerCatch"
base.606 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.606)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_0_6_lowerCatch", write = FALSE, option = "none") #for first initial pass
#Affects scale, but not pattern of population. Doesn't fix recdev variance issue

#Remove recdevs
model = "6_1_0_norecdevs"
base.610 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.610)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\6_1_0_norecdevs", write = FALSE, option = "none") #for first initial pass

#Adjust CV for high to be low (1%) when estimating Linf and K. Start from model 514
model = "6_0_7_estLinfK_lowCV"
base.607 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.607)

#Can set cormin and cormax in SS_output to see what parms are correlated and which are not
#The early recdevs, first 7 years of main recdevs, 2003, late devs
model = "6_0_0_base"
base.600 = SS_output(file.path(wd, model),covar=TRUE, cormax = 0.7, cormin = 0.05, printlowcor = 50)
#Our main devs between 1985 to 2017 are correlated, there isn't one (other than 2003) thats uninformed



