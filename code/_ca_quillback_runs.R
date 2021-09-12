# Quillback California Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\compare_catch_rec.R")
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\Sensi_plot_dover.R")

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


##########################################################################################
#                         Pre assessment workshop base model
##########################################################################################

#Starting from model 600 (with recdev bias adj included)

#1. Adjust steepness prior SD to 0.158 (was 0.09)
#2. Adjust forecast projection values to pstar values PEPtools::get_buffer (same as copper) 
#3. Change control rule format in forecast from f(SSB) on F to f(SSB) on catch
#4. Adjust forecast catch. Previously the value from 2020. Now, take the California percentage 
#of the North ACL (28.7% of 5.73 for 2021 and 5.74 for 2022) pluse the south component (4.19 for both 2021 and 2022)
#and apportioned to commercial and recreational based on the average percentage of catch for each from 2018-2020
#5. Change max age to 95 years, adjust natural mortality accordingly
#6. Update prior values for parameters 5 and 6 to -20 and 10, respectively

model = "7_0_0_MI"
base.700 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.700)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\7_0_0_base", write = FALSE, option = "none") #for first initial pass

#Switch to Francis weighting - Had to iterate twice
model = "7_0_1_Francis"
base.701 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.701)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\7_1_0_base", write = FALSE, option = "none") #for first initial pass
#Francis has slightly more extreme status but also have more dramatic recdevs. Keep with MI

#Copy model 7_0_0 
#Note that Im using 0.48 instead of 0.438 for prior sd on M. Its fixed so will have trivial change if any,
#so just adjust for sensitivity.
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.710)
SSplotSPR(base.710,subplots=4,print=TRUE)

#Set early years of commercial comps as ghost instead of outright remove
model = "7_1_1_base_ghostCom"
base.711 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.711)

#Explore whether reducing comp bins to nearer linf affect
#the high variability in recdevs
model = "7_1_2_reduceBinN"
base.712 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.712)
#No it does not. 



##############################################
#       Sensitivities - Starting with model 710
##############################################
#No recruitment deviations
model = "7_1_1_norec"
base.711 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.711)

#No recruitment deviations and reweighting
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\sensitivities\\7_1_1_norec", write = FALSE)
model = "7_1_1b_norec_reweight"
base.711b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.711b)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\sensitivities\\7_1_1b_norec_reweight", write = FALSE)
#Reweighting doesn't matter

#Data weighting using Francis
model = "7_1_2_dw_Francis"
base.712 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
SS_plots(base.712)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\sensitivities\\7_1_2_dw_Francis", write = FALSE)

#Data weighting using Francis, but iterating multiple times to get value - Use values from final model 701
model = "7_1_2b_dw_Francis_iter"
base.712b = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
SS_plots(base.712b)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\sensitivities\\7_1_2b_dw_Francis_iter", write = FALSE)

#Data weighting using Dirichlet Multinomial - Copy Report, ComReport, Covar, and Warning file from model 710
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\sensitivities\\7_1_3_dw_DM\\just model files")
model = "7_1_3_dw_DM"
base.713 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.713)
base.713$Length_Comp_Fit_Summary
#Theta/(1+theta) commercial = 0.9819261 (theta = 54.32830)
#Theta/(1+theta) recreational = 0.5121594 (theta = 1.04985)

#Estimate L infinity
model = "7_1_4_estlinf"
base.714 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.714)

#Estimate L infinity and K
model = "7_1_5_estlinfK"
base.715 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.715)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\sensitivities\\7_1_5_estlinfK", write = FALSE)

#Estimate K
model = "7_1_6_estK"
base.716 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.716)

#Estimate CV at L2
model = "7_1_7_estL2CV"
base.717 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.717)

#Estimate natural mortality. Use prior sd of 0.438
model = "7_1_8_estM"
base.718 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.718)

#Remove early recreational comps (before 2004)
model = "7_1_9_noEarlyRec_pre04"
base.719 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.719)

#Remove early recreational comps (before 1993)
model = "7_1_9b_noEarlyRec_pre93"
base.719b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.719b)

#Use dome shaped selectivity for recreational fleet
model = "7_1_10_recDome"
base.7110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7110)

#Use dome shaped selectivity for recreational fleet but only estimate parm6
model = "7_1_10b_recDome_3parm"
base.7110b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7110b)

#Use dome shaped selectivity for commercial fleet
model = "7_1_11_comDome"
base.7111 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7111)

#Use dome shaped selectivity for commercial fleet but only estimate parm6
model = "7_1_11b_comDome_3parm"
base.7111b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7111b)

#Set block for early recreational comps data (block ending in 1993)
#Allowed dome shaped for block
model = "7_1_12_recBlock93"
base.7112 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7112)

#Remove the extreme catches for rec in 1983, 1993 and com in 1991. Set to midway between previous and following years with real data.
#Rec 1993 is used to interpolate 1990-1992 so adjusting 1993 affects these years too. 
model = "7_1_13_noExtremeCatch"
base.7113 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7113)

#Remove the extreme catches for rec in 1983, 1993 and com in 1991. Set to average of three years before and three years after
#with real data. Rec 1993 is used to interpolate 1990-1992 so adjusting 1993 affects these years too. 
model = "7_1_14_noExtremeCatch_3yravg"
base.7114 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7114)

#Updating with values for 1990-1992 as the same as for 1993
#Budrick wanted me to run to see how different from 7114 this is. 
model = "7_1_14b_adjustExtremeCatch"
base.7114b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7114b)


##
#All in one place
##
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
model = "7_1_1_norec"
base.711 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_1b_norec_reweight"
base.711b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_2_dw_Francis"
base.712 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
model = "7_1_2b_dw_Francis_iter"
base.712b = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
model = "7_1_3_dw_DM"
base.713 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_4_estlinf"
base.714 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_5_estlinfK"
base.715 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_6_estK"
base.716 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_7_estL2CV"
base.717 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_8_estM"
base.718 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_9_noEarlyRec_pre04"
base.719 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_9b_noEarlyRec_pre93"
base.719b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_10_recDome"
base.7110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_10b_recDome_3parm"
base.7110b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_11_comDome"
base.7111 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_11b_comDome_3parm"
base.7111b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_12_recBlock93"
base.7112 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_13_noExtremeCatch"
base.7113 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_14_noExtremeCatch_3yravg"
base.7114 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)


#Compare sensitivities
sens_names <- c("Base model","No rec devs","DW Francis", "DW DM", "Est Linf", "Est Linf, K", "Est K", "Est Old CV", "Est M", "No pre-2004 rec comps", "No pre-1993 rec comps", "Rec dome selex.", "Com dome selex.", "Rec block selex. 1993", "Adjust extreme catches")
sens_models  <- SSsummarize(list(base.710, base.711, base.712b, base.713, base.714, base.715, base.716, base.717, base.718, base.719, base.719b, base.7110, base.7111, base.7112, base.7114))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.710_sensitivities_"),
                  subplot = 2, 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "topleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.710_sensitivities_"),
                  subplot = c(4,10), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "bottom", 
                  legendncol = 2,
                  filenameprefix = paste0("base.710_sensitivities_"),
                  subplot = 12, 
                  print = TRUE, 
                  pdf = FALSE)

##Smaller subset of sensitivities
sens_names <- c("Base model","No rec devs","Est Linf", "Est Linf, K", "Est K", "Est Old CV", "Est M", "Adjust extreme catches")
sens_models  <- SSsummarize(list(base.710, base.711, base.714, base.715, base.716, base.717, base.718, base.7114))
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "topleft", 
                  legendncol = 1,
                  filenameprefix = paste0("SSC_presentation_base.710_sensitivities_"),
                  subplot = c(1,3,9,11), 
                  print = TRUE, 
                  pdf = FALSE)


###################################################################################
# Jason Style Sensitivity Figure
###################################################################################
sens_names <- c("Base model","No rec devs","DW Francis", "DW DM", "Est Linf", "Est Linf, K", "Est K", "Est Old CV", "Est M", "No pre-2004 rec comps", "No pre-1993 rec comps", "Rec dome selex.", "Com dome selex.", "Rec block selex. 1993", "Adjust extreme catches")
x  <- SSsummarize(list(base.710, base.711, base.712b, base.713, base.714, base.715, base.716, base.717, base.718, base.719, base.719b, base.7110, base.7111, base.7112, base.7114))

wd_dat <- file.path(paste0(wd,"/sensitivities")) 
Sensi_plot_dover(model.summaries=x,
                 dir = wd_dat,
                 current.year=2021,
                 mod.names=sens_names, #List the names of the sensitivity runs
                 likelihood.out = c(0, 1, 0),
                 Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
                 CI=0.95, #Confidence interval box based on the reference model
                 TRP.in=0.40, #Target relative abundance value
                 LRP.in=0.25, #Limit relative abundance value
                 sensi_xlab="Sensitivity scenarios", #X-axis label
                 ylims.in=c(-2,2,-2,2,-2,2,-2,2,-2,2,-2,2,-2,2), #Y-axis label
                 plot.figs=c(1,1,1,1,1,1), #Which plots to make/save? 
                 sensi.type.breaks=c(2.5, 4.5, 9.5, 14.5), #vertical breaks that can separate out types of sensitivities
                 anno.x=c(1.5, 3.5, 7.0, 12, 15), # Vertical positioning of the sensitivity types labels
                 anno.y=c(1.83,1.80,1.85,1.85,1.85), # Horizontal positioning of the sensitivity types labels
                 anno.lab=c("Recruitment", "Data Weighting", "Parameters", "Selectivity", "Adj. Catches"), #Sensitivity types labels
                 horizontal = TRUE)
##########################

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
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Recreational(2)", 1:n]) )  

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
                         "SB 2021",
                         "Fraction Unfished 2021",
                         "Total Yield at SPR 50",
                         "Steepness",
                         "Natural Mortality",
                         "Length at Amin",
                         "Length at Amax",
                         "Von Bert. k",
                         "CV young",
                         "CV old",
                         "Peak commercial selex",
                         "Peak recreational selex")

write.csv(sens_table, file = file.path(wd, "sensitivities", paste0("base.710_sensitivities.csv")))

t = table_format(x = sens_table,
                 caption = 'Sensitivities relative to the base model.',
                 label = 'sensitivities',
                 longtable = TRUE,
                 font_size = 9,
                 digits = 2,
                 landscape = TRUE,
                 col_names = sens_names)

kableExtra::save_kable(t, file = file.path("C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables/sensitivities.tex"))



###################################################################################
#Post SSC model runs to update main report
#August GFSC meeting requests are in _ca_quillback_runs_postSSC
###################################################################################

#Starting from model 7_1_0_base

#1. Adjust projection values based on assuming recent catch. Update apportionment based on 2017-2019 catches 
#(values here: https://docs.google.com/spreadsheets/d/10EMQltWAhxCbdBvnt8Ao5tWJc-e7FmTDH8tcWgJKiXE/edit#gid=208964021)
#2. Correct M prior sd to 0.438

model = "9_0_0_postSSC_base"
base.900 = SS_output(file.path(wd, model),covar=TRUE)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\ca\\9_0_0_postSSC_base", write = FALSE, option = "none")
SS_plots(base.900, forecastplot = TRUE)
SSplotSPR(base.900,subplots=4,print=TRUE)

#The sensitivity tables and model output are the same whether base.710 or base.900 is used. 
#All values are identical, with the exception being the Forecast recruitment likelihood and the 
#parameter priors likelihood, which differ at 10^-9 and 10^-12 orders of magnitude, respectively. 
#Because the tables, when rounded, are identical, I use the base.710 model in the sensitivity table. 

#Use base.710 model results for the write up, but with the projection and time series table from base.900
#Use base.900 model for model files and but base.710 for r4ss plots because r4ss was updated since base.710
#and figure names are different


##
#Low and high states of nature - starting from model 9_0_0_postSSC_base
##

#Use states_of_nature.R to identify values for low and high state
#Low state is M = 0.0464, high is M = 0.0744 
model = "9_0_1_highState_M"
base.901 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.901)

model = "9_0_2_lowState_M"
base.902 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.902)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.900, base.901, base.902))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'decision_tables'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("M_States_of_nature_comparison_"),
                  subplot = c(2,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)

#Alternative Low state is R0 = 3.003, high is R0 = 3.323 
model = "9_0_3_highState_R0"
base.903 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.903)

model = "9_0_4_lowState_R0"
base.904 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.904)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.900, base.903, base.904))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'decision_tables'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("R0_States_of_nature_comparison_"),
                  subplot = c(2,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)


#Alternative Low state is Lmax = 44.05, high is R0 = 41.86 
model = "9_0_5_highState_Lmax"
base.905 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.905)

model = "9_0_6_lowState_Lmax"
base.906 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.906)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.900, base.905, base.906))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'decision_tables'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("Lmax_States_of_nature_comparison_"),
                  subplot = c(2,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)


#Alternative Low state with sigma = 1 is low is R0 = 2.731, high is R0 = 3.553 
model = "9_0_7_highState_R0_sigma1"
base.907 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.907)

model = "9_0_8_lowState_R0_sigma1"
base.908 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.908)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.900, base.907, base.908))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'decision_tables'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("R0_Sigma1_States_of_nature_comparison_"),
                  subplot = c(2,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)


#Alternative Low state is K = 0.245, high is K = 0.152
model = "9_0_9_highState_K"
base.909 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.909)

model = "9_0_10_lowState_K"
base.9010 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.9010)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.900, base.909, base.9010))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'decision_tables'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("K_States_of_nature_comparison_"),
                  subplot = c(2,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)

#All are very similar, but given R0 doesn't vary much status wise, suggest M
#Growth could be an option too, but less variable status wise, and not as variable 
#over the full time series spawning output wise as M


#Now run M states with forecasted catches (ABC values) from base.900
#Copy model 901 and 902 and update forecast file with catches
#allocated based on same allocation for base forecast (rec = 76.1%)
#Set buffer to 1 for all years and caps and allocations to year 2033
fore_loc = grep("ForeCatch",base.900$derived_quants$Label)
baseABC = rbind(data.frame("Year" = c(2023:2032), "Seas" = 1, "Fleet" = 1, "Catch" = base.900$derived_quants[fore_loc,"Value"][-c(1:2)]*0.239),
                data.frame("Year" = c(2023:2032), "Seas" = 1, "Fleet" = 2, "Catch" = base.900$derived_quants[fore_loc,"Value"][-c(1:2)]*0.761))

model = "9_0_1b_highState_M_baseABC"
base.901b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.901b)

model = "9_0_2b_lowState_M_baseABC"
base.902b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.902b)



############################   Rebuilding models   #####################################

#Models in folder "rebuilding"

#Copy model 900 and make adjustments in 
#https://docs.google.com/document/d/17hH1CEdombkF33Nw-_BAZLIlSfHWWgfkBSSdFRNTX_s/edit
#1. Name of file = 2021_ca_quillback_rebuild.dat
#2. Max number of years = 200
#3. Fecundity-at-age 0 = 0
#4. Year for Tmin = 2021
#5. Number of years with prespecified catches = 2
#6. Prespecified catches
#7. Number of future recruitments to override = 0
#8. Projection type = 11
#9. Extra lines
#10. Year of catches and F set to 2023
#11. More extra lines
#12. Year to define projection type, switch to probabilities
#13. Switch years for probability of recovery
model = "9_1_0_rebuilding"
base.910 = SS_output(file.path(wd, "rebuilder", model),covar=TRUE)
SS_plots(base.910)

#Copy model 900 - because have warning about SSB not matching
#Change Ngenders in .dat file to 1 (from -1)
model = "9_1_0_1_oneSex"
base.9101 = SS_output(file.path(wd, "rebuilder", model),covar=TRUE)
SS_plots(base.9101)
#Very slight differences in parameter estimates

#Other explorations in the test folder included 
#2_test_run_AddGenderInfo - copy sex specific info twice (still get the error)
#3_test_run_-1Sex - set sex to -1 in rebuild.dat (it doesn't run)
#4_test_run_oneSex - use model 9101 from above
#5_test_multiplySBx2 - multiply SSB entry in rebuild.dat by 2

#These tests show results are the same (or very nearly so). Only differences
#are in historical spawner per recruit. Thus if do recruitment equals option 2
#then the warning would have an effect. 

#Based on emails with Owen, yinit should be 2021, ydecl 2023, and yinit^0 2021
#As such adjust age-structure to be from 2021
#Copy model 910's updated rebuild.dat file
#1. Set age structure to be from 2021 (so the values from model 921)
#Apply to 910_ageStruc2021 

#Copy model 910 and make changes to forecast
#1. Change allocation of F years to 2017-2019 (originally was just 2020)
#Make adjustments to rebuild.dat in 
#https://docs.google.com/document/d/17hH1CEdombkF33Nw-_BAZLIlSfHWWgfkBSSdFRNTX_s/edit but
#a. Try to keep Year for Tmin = 2023 (COULDNT so KEPT at 2021)
model = "9_2_0_RelF2017_2019"
base.920 = SS_output(file.path(wd, "rebuilder", model),covar=TRUE)
#Apply to 920_F2017_2019

#It is confusing to me that Tmin cant be because age structure is 2023, so...
#Copy model 920 and adjust Ydecl in forecast to be 2021
#Ydecl is now set to 2021 and age structure changes, with Tmin set to 2021
#Make adjustments to rebuild.dat in 
#https://docs.google.com/document/d/17hH1CEdombkF33Nw-_BAZLIlSfHWWgfkBSSdFRNTX_s/edit
model = "9_2_1_forecastYdecl"
base.921 = SS_output(file.path(wd, "rebuilder", model),covar=TRUE)
#Apply to 921_ydecl2021 

#Based on emails with Owen, yinit should be 2021, ydecl 2023, and yinit^0 2021
#As such adjust age-structure to be from 2021
#Copy model 920's updated rebuild.dat file
#1. Set age structure to be from 2021 (can use the values from model 921 - also works to use age structure
#from lines just above this in the rebuild.dat file)
#Apply to 920_F2017_2019_ageStruc2021 

######################### Base runs ##################################

  #Apply states of nature incorporation based on 921 values
  #Copy the rebuild.data file in 920_F2017_2019_ageStruc2021
  #and add name rebuild_m_states_921_2021.SSO as file to draw from
  #Apply to 930_F2017_2019_ageStruc2021
  
  
  #Remove cap on catch by ABC
  #Copy the rebuild.data file in 930_F2017_2019_ageStruc2021
  #Set constrain catches by ABC to 2
  #Apply to 931_no_abc_max

############################################################################


######################### Sensitivity runs ##################################

  #Set up sensitivity rebuilder run based on model 8015 sensitivity
  #Copy SS model 9_2_0_RelF2017_2019.
  #Replace .ctl file with the one from model 8015. Set sd of M prior to 0.438.
  #Run model
  #Make adjustments to rebuild.dat in 
  #https://docs.google.com/document/d/17hH1CEdombkF33Nw-_BAZLIlSfHWWgfkBSSdFRNTX_s/edit and
  #adjust age-structure to be from 2021 (copy from line above in rebuild.dat)
  model = "9_4_0_recComBlock2001"
  base.940 = SS_output(file.path(wd, "rebuilder", model),covar=TRUE)
  SS_plots(base.940)
  #Apply to 940_recComBlock2001
  
  #Remove cap on catch by ABC
  #Copy the rebuild.data file in 940_recComBlock2001
  #Set constrain catches by ABC to 2
  #Apply to 941_no_abc_max
  
  
  ####
  #Comparison plots and tables
  ####
  model = "7_1_0_base"
  base.710 = SS_output(file.path(wd, model), covar=TRUE, printstats = FALSE, verbose = FALSE)
  model = "9_4_0_recComBlock2001"
  base.940 = SS_output(file.path(wd, "rebuilder", model), covar=TRUE, printstats = FALSE, verbose = FALSE)
  
  reb_names <- c("Adopted SS base", "SS RecCom Block 2001")
  reb_models  <- SSsummarize(list(base.710, base.940))
  
  if(!dir.exists(file.path(wd, 'rebuilder','write_up','figures'))){
    dir.create(file.path(wd, 'rebuilder','write_up','figures'), recursive=TRUE)
  }
  
  #Plot each individually for control over legend location
  SSplotComparisons(reb_models, endyrvec = 2021, 
                    legendlabels = reb_names, 
                    ylimAdj = 1.10,
                    plotdir = file.path(wd, 'rebuilder','write_up','figures'), 
                    legendloc = "bottomleft", 
                    legendncol = 1,
                    filenameprefix = paste0("rebuilder_sensitivities_"),
                    subplot = c(2,4,9,10,11,12), 
                    print = TRUE, 
                    pdf = FALSE)
  
  
  ####
  ##Selectivity plots
  ####
  fleets = c("Comm", "Rec")
  
  #Recreational
  base_selex_rec <- SSplotSelex(base.710, fleets = 2, fleetnames = fleets, subplot = 1)
  base_selex_rec$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[2]
  
  selex_940_rec <- SSplotSelex(base.940, fleets = 2, subplot = 1, year = c(2000,2020))
  selex_940_rec$infotable$col <- "red"
  selex_940_rec$infotable$pch <- 1
  
  #Commercial
  base_selex_com <- SSplotSelex(base.710, fleets = 1, subplot = 1)
  base_selex_com$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[2]
  
  selex_940_com <- SSplotSelex(base.940, fleets = 1, subplot = 1, year = c(2000,2020))
  selex_940_com$infotable$col <- "red"
  selex_940_com$infotable$pch <- 1
  
  
  png(file = file.path(wd, "rebuilder", "write_up", "figures", "selex_compare.png"), 
      width = 8, height = 10, units = "in", res = 300)
  par(mfrow = c(2,1), mai = c(0.5,0.5,0.5,0))
  
  SSplotSelex(base.710, fleets = 2, infotable = base_selex_rec$infotable,
              subplot = 1, legendloc = NA, showmain=FALSE)
  SSplotSelex(base.940, fleets = 2, infotable = selex_940_rec$infotable,
              subplot = 1, legendloc = NA, year = c(2000, 2020), add = TRUE)
  legend("left", c("1916-2000", "2001-2020",
                   "Base 1916-2020"), lty = c(1,2, 1), 
         col = c(selex_940_rec$infotable$col, base_selex_rec$infotable$col),
         pch = c(selex_940_rec$infotable$pch, base_selex_rec$infotable$pch), 
         bty = "n", lwd = 2, seg.len = 5)
  mtext("RecCom Block 2001 - Recreational", side = 3, line = 0.5, font = 2)
  grid()
  
  SSplotSelex(base.710, fleets = 1, infotable = base_selex_com$infotable,
              subplot = 1, legendloc = NA, showmain=FALSE)
  SSplotSelex(base.940, fleets = 1, infotable = selex_940_com$infotable,
              subplot = 1, legendloc = NA, year = c(2000, 2020), add = TRUE)
  legend("left", c("1916-2000", "2001-2020",
                   "Base 1916-2020"), lty = c(1,2, 1), 
         col = c(selex_940_com$infotable$col, base_selex_com$infotable$col),
         pch = c(selex_940_com$infotable$pch, base_selex_com$infotable$pch), 
         bty = "n", lwd = 2, seg.len = 5)
  mtext("RecCom Block 2001 - Commercial", side = 3, line = 0.5, font = 2)
  grid()
  dev.off()

############################################################################

  
  
  
  ####
  #States of nature exploration - adding uncertainty around M
  ####
  
  #Copy 910 into "rebuilding/states of nature" folder
  #Other models in folder "rebuilding/states of nature"
  
  #Copy model 901 and make adjustments in "CA_rebuilding.R"
  model = "9_1_1_M_high"
  base.911 = SS_output(file.path(wd, model),covar=TRUE)
  #Copy model 902 and make adjustments in "CA_rebuilding.R"
  model = "9_1_2_M_low"
  base.912 = SS_output(file.path(wd, model),covar=TRUE)
  
  
  
  #Copy 921 into "rebuilding/states of nature" folder
  #Other models in folder "rebuilding/states of nature"
  
  #Copy model 911_M_high (in states_of_nature_910)
  #Adjust forecast rel F to be from 2017-2019
  #Set forecast ydecl to 2021 (so as to get proper age structure)
  model = "9_2_1_M_high"
  base.921 = SS_output(file.path(wd, model),covar=TRUE)
  #Copy model 912_M_low (in states_of_nature_910)
  #Adjust forecast rel F to be from 2017-2019
  #Set forecast ydecl to 2021 (so as to get proper age structure)
  model = "9_2_2_M_low"
  base.922 = SS_output(file.path(wd, model),covar=TRUE)










