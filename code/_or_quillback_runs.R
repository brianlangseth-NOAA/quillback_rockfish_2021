# Quillback Oregon Model Runs

#remotes::install_github("r4ss/r4ss")
library(r4ss)
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\compare_catch_rec.R")
source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\Sensi_plot_dover.R")

sum_model <- function(model){
  return(c("NLL_Tot" = round(model$likelihoods_used[1,"values"],2),
           "NLL_Com" = round(model$likelihoods_by_fleet[6,"OR_Commercial"],2),
           "NLL_Rec" = round(model$likelihoods_by_fleet[6,"OR_Recreational"],2),
           "n_parm" = round(model$N_estimated_parameters,0),
           "R0" = round(model$estimated_non_dev_parameters["SR_LN(R0)","Value"],2),
           "depl" = round(model$current_depletion,2)))
}

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


##########################################################################################
#                         Clean up initiation options
##########################################################################################

#####################
#Starting with model 110
#1. Follow handbook guidance on setting selectivity for parm1 = mode; and parms 3, 4; set priors to inits)
#for both commercial and recreational
#2. Set length at Amax to reflect Linf (set to 999)
#3. Set prior type for steepness to be beta (2)
#4. Include age comps but set lambdas to 0
#5. Set age bins to 36, and age bins 5-40
#####################

model = "2_0_0_improvements"
base.200 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.200)
#Doesnt match comm age comps well but does for rec. Large spike in biomass after 2000 seems unusual

#Remove early recdevs
#Start from model 200
model = "2_0_1_noearlydevs"
base.201 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.201)

#Keep some early recdevs (start at 1950)
#Start from model 200
model = "2_0_2_earlydevs1950"
base.202 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.202)
#Go with this one for future directions (and include bias adj)

#Set bias adj
#Start from model 202
SS_fitbiasramp(base.202, verbose = TRUE)
model = "2_0_3_biasadj"
base.203 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.203)
#Bias adj parameters dont change very much from what I changed them to 

#Remove recdevs
#Start from model 200
model = "2_0_4_norecdevs"
base.204 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.204)
#Miss large recruitments <2000s but match most thereafter. Wonder whether commercial comps are pushing that
#or likely to support the large catch since commercial selectivity changes leftward the most

#Remove comm comps
#Start from model 200 and fix comm selex at estimated parameters
model = "2_0_5_noComComps"
base.205 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.205)
#Comm comps do provide signal for higher recruitments for 1995 and 1999 peaks but also for 2012 peak (though
#that one could be due to higher biomass at the time)

#Remove rec comps to see if signal all in rec
#Start from model 200 and fix rec selex at estimated parameters for both blocks
model = "2_0_5b_noRecComps"
base.205b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.205b)
#Com comps also have signal for recruitment but rec has more information

#Change sigmar to 0.9 which is around what is suggested for model 203
#Start with model 203
base.203$sigma_R_info
model = "2_0_6_sigmar09"
base.206 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.206)
#Bigger recent recruitments, lower NLL for rec and for comps
base.206$likelihoods_by_fleet


modelnames <- c("Initial", "noEarlyDevs", "earlyDevs1950", "biasAdj", "noRecDevs", "noComComps", "noRecComps", "sigmaR0.9")
mysummary  <- SSsummarize(list(base.200, base.201, base.202, base.203, base.204, base.205, base.205b, base.206))
SSplotComparisons(mysummary, 
                  filenameprefix = "1_rec_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

##########################################################################################
#                         Selex options
##########################################################################################
#Add third block for rec to limit residuals starting 2010 
#Start from model 203
model = "2_1_0_thirdSelexBlock"
base.210 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.210)
#No effect on residuals nor recdevs. Dont do. 

#Estimate selectivity of parameters 1-4 for rec, comm, and the block
#Start from model 203
model = "2_1_1_selexEst14"
base.211 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.211)

#Estimate selectivity of parameters 1-6 for rec, comm, and the block
#Start from model 203
model = "2_1_2_selexEstAll"
base.212 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.212)
#Population blows up but fits to comps are really good. Interesting, the rec block (early time)
#estimates asymptotic. Recdevs look similar, difference is in biomass. 

#Estimate selectivity of parameters 1,3,6 for rec
#Start from model 203
model = "2_1_3_domeRec"
base.213 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.213)
#Estimates a dome, and increases biomass but have very similar recdev pattern. 
#Not a noticeable effect on comps. Dome is at too high of a size to have a meaningful impact
#When estimate all (model 212) then length at peak is smaller so dome occurs earlier and has
#an effect

#Estimate selectivity of parameters 1,3,6 for comm
#Start from model 213
model = "2_1_4_domeCom"
base.214 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.214)
#Estimates a dome, and increases biomass (but less than the dome for rec) 
#but have very similar recdev pattern. Not a noticeable effect on comps.
#Dome is at too high of a size to have a meaningful impact
#When estimate all (model 212) then length at peak is smaller so dome occurs earlier and has
#an effect

#Estimate selectivity of parameters 1,3,6 for the block
#Start from model 213
model = "2_1_5_domeBlock"
base.215 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.215)
#Although the model is flexible to estimate dome shape in the block it estimates
#asymptotic. Thus this model is functionally the same as the base

#Remove selectivity block, just for comparison. There is good reason to have a block
#Start from model 203
model = "2_1_6_noBlock"
base.216 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.216)
#Shifts selectivity leftward. Has a larger recruitment in 95 to draw biomass up. 
#Some differences in residuals however nothing drastic. Still no reason to include

modelnames <- c("base", "3blocks00_10", "selex14", "selexAll", "domeRec", "domeCom", "domeBlock", "noBlock")
mysummary  <- SSsummarize(list(base.203, base.210, base.211, base.212, base.213, base.214, base.215, base.216))
SSplotComparisons(mysummary, 
                  filenameprefix = "2_selex_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

#Could explore effect of allowing size of peak to change and dome would have more of an effect. 
#However without good evidence for dome, not currently doing.

##############
#Further Selex: allow estimation more flexibility
##############

#Fix estimates of selex 2 and 4 at estimates from model 211
#Set inits of selex 1 and 3 at estimates from model 211, then reestimate 1 and 3
#Start from model 211
model = "2_1_1_1_selexEst13again"
base.2111 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.2111)

#Estimate selex parameters 1-4, and 6
#Start from model 212
model = "2_1_2_1_selexEst146"
base.2121 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.2121)

#Fix estimates of selex 2 and 4 at estimates from model 2121, then reestimate 1, 3, and 6
#Start from model 2121
model = "2_1_2_2_selexEst136again"
base.2122 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.2122)

modelnames <- c("base", "selex14", "selexAll", "selex14_13", "selex146", "selex146_136")
mysummary  <- SSsummarize(list(base.203, base.211, base.212, base.2111, base.2121, base.2122))
SSplotComparisons(mysummary, 
                  filenameprefix = "2_selex_reest_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#Reestimation does nothing. Can estimate all at once. Estimating p5 does change recruits slightly, but 
#otherwise biomass trends are nearly identical when estimating 1-4 and 6. Thus, if wish to do dome,
#estimate 1-4 and 6, if wish not to do dome, estimate 1-4. 

##########################################################################################
#                         Figure out what is driving recruit years
##########################################################################################

#####################
#Selex? - Based on previous exploration (models 21X) its not selectivity
#####################

#####################
#Catch
#####################
#Apply smoother to catch
compare_catch_rec(base.203, plots = 2, offset = 0) #Recruitment seems to align with large catches
#Start with model 203
model = "2_2_0_smoothCatch"
base.220 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.220)
#No real effect on recdevs. Catch does not appear to be driver of recdevs 

#####################
#Ages
#####################
#Fit to ages
#Start with model 203
model = "2_2_1_fitages"
base.221 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.221)
#Biomass is lower near end, due to period of lower recdevs. 2012 peak still obvious. 
#Recdevs with ages appear more smooth compared to just lengths. 
#Bias ramp is changed, and fits to ages are pretty good

#Include bias adj in the fit to ages
SS_fitbiasramp(base.221, verbose = TRUE)
#Start with model 221
model = "2_2_1_fitages_biasadj"
base.221b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.221b)
#Biomass lowers a bit. Otherwise this is a reasonable model if we could do ages


#####################
#Comps
#####################
#Iterative remove some comps blocks
#Start with model 203
model = "2_2_2_remove1720" #Remove 2017-2020 comps
base.222 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.222)
#These years of comps drive the 2012 rec spike. Need to ensure these aren't due to changes in gear
#Looked across comm gears (lgl/hkl - trawl) and rec types (boat - private) and gear does not seem to be 
#driving these. All evidence points to clear recruitment signals

#Start with model 203
model = "2_2_2_remove9900" #Remove 1999-2000 comps
base.222b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.222b)
#Though these years have mass at smaller sizes enough information is in out years to inform recdevs


#Compare runs
modelnames <- c("base", "fitages", "noRecDevs", "no2017-2020")
mysummary  <- SSsummarize(list(base.203, base.221b, base.204, base.222))
SSplotComparisons(mysummary, 
                  filenameprefix = "3_explore_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         Base model set up
##########################################################################################

###
#Base model
###
#copy model 2111
model = "3_0_base"
base.300 = SS_output(file.path(wd, model),covar=TRUE)


#R0 profile - use profiling code.R
#Start with model 300 but set rec parm 1's phase to phase 1

#Data weighting
#Start with model 300
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\3_0_base", write = FALSE, option = "none")
model = "3_1_1_dw_francis"
base.311 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.311)
#Francis commercial = 0.15
#Francis recreational = 0.22
#A second iteration does not change things greatly
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\3_1_1_dw_francis", write = FALSE, option = "none")


model = "3_1_2_dw_MI"
base.312 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.312)
#MI commercial = 0.176
#MI recreational = 0.027

#InputN as sample size - Copy model 311, comment out weights, copy over compreport and report from model 300,
#set inputN for comm, and run this line
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\3_1_3_dw_DM\\just model files")
model = "3_1_3_dw_DM_inputN"
base.313 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.313)
#Theta/(1+theta) commercial = 0.968 (theta = 30)
#Theta/(1+theta) recreational = 0.525 (theta = 1.11)

#Original sample size
#Start from model 313
model = "3_1_4_dw_DM_fish"
base.314 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.314)
#Theta/(1+theta) commercial = 0.638 (theta = 1.76)
#Theta/(1+theta) recreational = 0.522 (theta = 1.09)

#Compare runs
modelnames <- c("base", "francis", "MI", "DM - input", "DM - fish")
mysummary  <- SSsummarize(list(base.300, base.311, base.312, base.313, base.314))
SSplotComparisons(mysummary, 
                  filenameprefix = "4_dataweighting_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#The downweighting of comps really removed information from the recent recruitment event in 
#2012, impacting terminal year depeletion. MI greatly downweights, which I find hard to believe
#given the data. Francis and DM are comparable. Go with francis with a DM sensitivity

##########################################################################################
#       Explore dome shaped, block, and excluding data in early block
##########################################################################################

#How much of an effect does the early data have on model output

#Remove pre-block length data and remove block
#Starting with model 300
model = "3_0_1_test_nopre99comps"
base.301 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.301)

#Remove block but keep all data
#Starting with model 300
model = "3_0_2_test_noblock"
base.302 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.302)


#How much of an effect does dome selex for rec in recent period have on model output

#Estimate recent dome shaped selex for rec 
#Starting with model 300
#Est parms 1-4,6; Fix parms 2, 4 at estimates; Reest 1, 3, 6
model = "3_0_3_test_recdome"
base.303 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.303)
#Do not reset the initial values for parms 1, 3, and 6. If I do, I hit a local minimum
#and my estimates aren't reestimated. Model where I keep the inits as originals produces
#different estimates, and has better NLL. I had done this incorrectly earlier. 


#Estimate dome shaped selex for rec without a block
#Starting with model 302
#Est parms 1-4,6; Fix parms 2, 4 at estimates; Reest 1, 3, 6
model = "3_0_4_test_noblock_dome"
base.304 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.304)



#Compare exploration runs
modelnames <- c("base: block_asymp", "noBlock_noPre00Comps", "noBlock", "block_recDome", "noBlock_recDome")
mysummary  <- SSsummarize(list(base.300, base.301, base.302, base.303, base.304))
SSplotComparisons(mysummary, 
                  filenameprefix = "5_base_explore_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


#Add rec ramp from 1970 (at 0) to catches in first year
#Starting with model 311
model = "3_2_0_base"
base.320 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.320)
#Slightly more depletion

#Estimate all 1-4 parms and then rest 1 and 3
model = "3_2_1_selex14_reest"
base.321 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.321)
#Parms are the same

#Redo bias adj
SS_fitbiasramp(base.321, verbose = TRUE)
model = "3_2_2_biasadj"
base.322 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.322)
#Really doesn't affect things


##########################################################################################
#       New base from which to explore earlier steps with
##########################################################################################

#Copy model 322
model = "4_0_base"
base.400 = SS_output(file.path(wd, model),covar=TRUE)
sum_model(base.400)

##########################################################################################
#       Explore dome shaped, block, and excluding data in early block
##########################################################################################

#How much of an effect does the early data have on model output

#Remove pre-block length data and remove block
#Starting with model 400
model = "4_0_1_test_nopre99comps"
base.401 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.401)

#Remove block but keep all data
#Starting with model 400
model = "4_0_2_test_noblock"
base.402 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.402)
sum_model(base.402)


#How much of an effect does dome selex for rec in recent period have on model output

#Estimate recent dome shaped selex for rec 
#Starting with model 400
#Est parms 1-4,6; Fix parms 2, 4 at estimates; Reest 1, 3, 6
model = "4_0_3_test_recdome"
base.403 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.403)
sum_model(base.403)
#Doesnt matter if reset the initial values for parms 1, 3, and 6 (though dont). Previously did.


#Estimate dome shaped selex for rec without a block
#Starting with model 402
#Est parms 1-4,6; Fix parms 2, 4 at estimates; Reest 1, 3, 6
model = "4_0_4_test_noblock_dome"
base.404 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.404)
sum_model(base.404)

#Compare exploration runs
modelnames <- c("base: block_asymp", "noPre00Comps", "noBlock", "block_recDomeRecent", "noBlock_recDome")
mysummary  <- SSsummarize(list(base.400, base.401, base.402, base.403, base.404))
SSplotComparisons(mysummary, 
                  filenameprefix = "6_base_dw_explore_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)
#Pretty minimal effects for all of these. Dome shaped results in biggest change. 


##########################################################################################
#                         More base model construction with updated data
##########################################################################################

#Add updated data and new Life history data to model
#1. New L-A relationship based on WCGBTS data and new PacFIN age samples (with correct A1 and L1 values)
#2. New L-W relationship based on including rec (excluding imputted weight and length) and new data
#3. Udpated 2020 data
  #a. Recreational catch (2020 and all years - shore and estuary)
  #b. Commercial catch
  #c. Commercial comps (2020 and all years) - Change to using InputN from Nsamples
  #d. Update ghost ages using new format (ages dont actually change) - Change to using InputN from Nsamples
#4. Reset prior selex values to initial prior values
#5. Set selex for rec to dome-shaped 
#6. Set forecast to match 2020 catch levels
#7. Redo data weighting
#Process for adjusting inputs: run initial0, adjust data weighting (initial1), fix selex parms 2 and 4 and re-estimate 1, 3, 6 (initial2), redo bias adj (initial3))

#Starting with model 400 - make changes as described above - Had to readjust bias adj a second time
model = "5_0_0_base"
base.500 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.500)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\5_0_0_base", write = FALSE, option = "none") #for first initial pass

#Explore removal of early time block
#Starting with model 500 initial0
model = "5_0_1_noblock"
base.501 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.501)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\5_0_1_noblock", write = FALSE, option = "none") #for first initial pass

#Explore asymptotic selex
#Starting with model 500  initial0
model = "5_0_2_nodome"
base.502 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.502)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\5_0_2_nodome", write = FALSE, option = "none") #for first initial pass

#Explore effects of previous l-a curve 
#Starting with model 500 - just changing l-a curve to old version
model = "5_0_3_oldLA"
base.503 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.503)

#Explore effects of previous l-a curve 
#Starting with model 503 - adjusting data weigthing and parm est
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\5_0_3_oldLA", write = FALSE, option = "none") #for first initial pass
model = "5_0_3b_oldLA"
base.503b = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.503b)

#Explore effects of new l-a curve on previous base
#Starting with model 400 - just changing l-a curve to new version (with correct A1 and L1 values)
model = "4_0_5_newLA"
base.405 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.405)


#Compare exploration runs
modelnames <- c("base: block_dome", "noBlock", "noDome", "base: oldLA", "base: oldLA reest", "model400: block-asymp","model400: newLA")
mysummary  <- SSsummarize(list(base.500, base.501, base.502, base.503, base.503b, base.400, base.405))
SSplotComparisons(mysummary, 
                  filenameprefix = "7_base_explore_",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)

#Comparing likelihood fits
temp = sapply(list(base.500,base.501,base.502,base.503,base.503b), FUN = sum_model)
colnames(temp) = c("base", "noBlock", "noDome", "OldLA", "OldLA-reest")
t(temp)
#The noBlock model has lower NLL and fewer parameters, however the data weighting values are different, hence not comparable. 


##########################################################################################
#                         More base model construction with updated data
##########################################################################################

#Starting with model 501 

#Make final tweeks 
#1. Set ghost fleet for first year of commercial comp (low sample size)
#2. Exclude age data in dat, and reset lambda in ctl
#3. Reset prior selex paramters to original (model 200), and reset inits of estimated parms to priors (this has no effect)

#Initial0 is run with changing and generating weightings, initial1 is using those to determine bias adj. After that estimate bias adjust 
model = "6_0_0_base"
base.600 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.600)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\6_0_0_base", write = FALSE, option = "none") #for first initial pass
SSunavailableSpawningOutput(base.600, plot=TRUE, print = TRUE, plotdir = file.path(wd, model, "plots"))


#Remove comp data with less than 12 inputN or fish
#Start with model 600, initial1 (changed bias adjust on base after doing these runs)
model = "6_0_1_sparseComps"
base.601 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.601)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\6_0_1_sparseComps", write = FALSE, option = "none") #for first initial pass
#This results in less information in early period and thus recdevs for 1992ish have high variability
#Some intermediate steps showed recdevs with limited variability, though final one had more. 
#The trajectory is higher, primarily due to a lower dome. Otherwsie very similar. 
#Choose to keep the comp data as is for model 600 (just very small sample size). 

#Remove all pre1999 rec comps, ala copper rockfish
#Start with model 600, initial1 (changed bias adjust on base after doing these runs)
model = "6_0_2_nopre1999rec"
base.602 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.602)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\6_0_2_nopre1999rec", write = FALSE, option = "none") #for first initial pass
#This significantly reduces the variability in recdevs prior to 1999. This suggests to me the comps during this 
#year are not informative with each other, or with the significantly more information from later years of comps. 
#Overall population trajectory is very similar to 601, since domeshaped is lower 

#Add block for commercial with dome for both periods - look to see if fit to aggregate is better
#Use 2000 (no early dome and slight late dome and fits to the 2000 comp), 2005 (no early dome estimated - strong late dome), 2015 (no early or late dome estimated)
#Start with model 600, initial1 (changed bias adjust on base after doing these runs)
model = "6_0_3_comBlock"
base.603 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.603)
#There is some improvement in fits to aggregated (mostly fitting right peak better) but not enough to warrant 
#speculative changes in selex. Futhermore, using later domes cause dome-shaped not to be esitmated. The 2015 block
#does improve individual year fits to bimodal peaks, again not enough to warrant change. 

#Set up block (dome) for rec fleet at 2000 to see if affects fits. Allow dome. Chose 2000 because sample size increases
#and mean length variability becomes tight. Fits are slightly better. Dome in early period very slight so model wants
#asymptotic in early period. Slight differences in scale and amount of 2010 biomass peak. Overall not much of a change. 
#Recdevs behave better though. Ultimately dont use since have no good reason to start in a specific year. Remove pre2000 comps is comparable
#Start with model 600, initial1 (changed bias adjust on base after doing these runs)
model = "6_0_4_recBlock"
base.604 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.604)

#Compare exploration runs
modelnames <- c("600", "sparse", "noPre1999", "comBlockDome05", "recBlock00")
mysummary  <- SSsummarize(list(base.600, base.601, base.602, base.603, base.604))
SSplotComparisons(mysummary, 
                  filenameprefix = "8_base_explore_comps",
                  legendlabels = modelnames, 
                  plotdir = file.path(wd, "plots"),
                  pdf = TRUE)


##########################################################################################
#                         Pre assessment workshop base model
##########################################################################################

#Starting from model 600 (with recdev bias adj included)

#1. Adjust steepness prior SD to 0.158 (was 0.09)
#2. Adjust forecast projection values to pstar values PEPtools::get_buffer (same as copper) 
#3. Change control rule format in forecast from f(SSB) on F to f(SSB) on catch
#4. Adjust forecast catch. Previously the value from 2020. Now, take the Oregon percentage 
#of the North ACL (58.4% of 5.73 for 2021 and 5.74 for 2022) apportioned to commercial and recreational
#based on the average percentage of catch for each from 2017-2020
#5. Change max age to 95 years, adjust natural mortality accordingly

model = "7_0_0_base"
base.700 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.700)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\7_0_0_base", write = FALSE, option = "none") #for first initial pass
SSunavailableSpawningOutput(base.700, plot=TRUE, print = TRUE, plotdir = file.path(wd, model, "plots"))

#Based on the jitter from model 700, my base model is not at the minimum NLL. Need to readjust. 
#Use par file for base run from NatM profile (run 7), and change starter to read it in as init values 
model = "7_0_1_base_parfile"
base.701 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.701)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\7_0_1_base_parfile", write = FALSE, option = "none") #for first initial pass
#This model has extreme recdev estimates that push the population higher. Results suggest reweighting is needed. 
#Decide to reweight with keeping par file and naming old ones _initial0.
#Reset bias adjust (name previous version initial1) and then again (initial2)

#Reweight model 701 (model 701 version is initial0) and use ctl file inits. Update bias adj to reflect model provided estimate (rename previous version initial1). 
model = "7_0_2_base_reweight"
base.702 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.702)
#Model 702 and model 701 (with reweighting and applying inits from the par file) have the same likelihood. Thus either should work. 
#Bias correction varies slightly, and with the par file version doesn't change, but with the reweighting version, convergence is less precise
#and the bias correction suggestion changes slightly

#Use initial2 from model 702 as a new base. Seems to match pattern well and have low gradient
#Note that Im using 0.48 instead of 0.438 for prior sd on M. Its fixed so will have trivial change if any,
#so just adjust for sensitivity.
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\7_1_0_base", write = FALSE, option = "none")
SS_plots(base.710)
SSunavailableSpawningOutput(base.710, plot=TRUE, print = TRUE, plotdir = file.path(wd, model, "plots"))
SSplotSPR(base.710,subplots=4,print=TRUE)


#Test out slight change in maturity to reflect fork length
#From Echeverria nad Lenarz (1984) in Love et al. (2002) the conversion from 
#Total to Fork is FL = 9.075 + TL * 0.965 (with lengths in mm). Thus 29.23 TL L50 is 29.11 FL L50.
model = "7_1_1_matFL"
base.711mat = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.711mat)
#Gives same results, not exactly but pretty close. 

#Test is model with estimating all four of the commercial selectivity parameters change knife-edge like pattern
#Start from model 710
model = "7_1_2_selex4parm"
base.712 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.712)
#Doing so shows those parameters are very uncertain. Best to keep with just two parms

#See what is causing com comp to be bimodal
#Start from model 710 - remove last four years in com comps
model = "7_1_3_ghostCom_2017_2020"
base.713 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.713)

#Start from model 710 - remove last six years in com comps
model = "7_1_4_ghostCom_2015_2020"
base.714 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.714)

#Start from model 710 - remove last six years in com comps and 1999
model = "7_1_5_ghostCom_1999_2015_2020"
base.715 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.715)

#Start from model 710 - remove last six years in com comps and 1999-2002
model = "7_1_6_ghostCom_1999_2002_2015_2020"
base.716 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.716)
#First 4 years and last 6 years are main factor. 

#Start from model 710 - remove 1999-2002
model = "7_1_7_ghostCom_1999_2002"
base.717 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.717)

#Start from model 710 - remove 1999-2002
model = "7_1_8_ghostCom_1999_2002_2017_2020"
base.718 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.718)
#First 4 years and last 6 years are main factor. 

#Start from model 710 - block Com from start-2002, assume asymptotic
model = "7_1_9_comBlock_2002"
base.719 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.719)

#Start from model 710 - block Com at 2015-2020, assume asymptotic
model = "7_1_10_comBlock_2014"
base.7110 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.7110)

#Start from model 710 - block Com at 2003-2014, assume asymptotic
model = "7_1_11_comBlock_2003-2014"
base.7111 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.7111)

#Start from model 710 - block Com from start-1999, assume asymptotic
model = "7_1_12_comBlock_1999"
base.7112 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.7112)
#Results do differ from base, but sample size is small and only for one year

#Alternative phasing
#just model files_all2 - Set all parameters (expect R0) to phase 2
#just model files_selex2 - Set all selex parameters to phase 2
#just model files_selex3 - Set all selex parameters to phase 3
#just model files_rec2 - Set all rec (early and main devs) parameters to phase 2
#just model files_rec4 - Set all rec (early and main devs) parameters to phase 4


##############################################
#       Sensitivities - Starting with model 710
##############################################
#No recruitment deviations
model = "7_1_1_norec"
base.711 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.711)

#No recruitment deviations and reweighting
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\sensitivities\\7_1_1_norec", write = FALSE, option = "none") #for first initial pass
model = "7_1_1b_norec_reweight"
base.711b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.711b)
#Reweighting doesn't matter

#Data weighting using McAllister-Ianelli
model = "7_1_2_dw_MI"
base.712 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
SS_plots(base.712)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\sensitivities\\7_1_2_dw_MI", write = FALSE)

#Data weighting using Dirichlet Multinomial - Copy Report, ComReport, Covar, and Warning file from model 710
DM_parm_info = SS_tune_comps(option = "DM", niters_tuning = 0, write = FALSE,
                             dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\sensitivities\\7_1_3_dw_DM\\just model files")
model = "7_1_3_dw_DM"
base.713 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.713)
base.713$Length_Comp_Fit_Summary
#Theta/(1+theta) commercial = 0.9801535 (theta = 49.38680)
#Theta/(1+theta) recreational = 0.5145631 (theta = 1.06223)

#Estimate L infinity
model = "7_1_4_estlinf"
base.714 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.714)

#Estimate K
model = "7_1_4b_estk"
base.714b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.714b)

#Estimate L infinity and K
model = "7_1_5_estlinfK"
base.715 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.715)

#Estimate CV at L2
model = "7_1_6_estL2CV"
base.716 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.716)

#Estimate natural mortality. Use prior sd of 0.438
model = "7_1_7_estM"
base.717 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.717)

#Remove early recreational comps (before 2001)
model = "7_1_8_noEarlyRec"
base.718 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.718)

#Use asymptotic selectivity for recreational fleet
model = "7_1_9_recAsym"
base.719 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.719)

#Use dome shaped selectivity for commercial fleet
model = "7_1_10_comDome"
base.7110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7110)

#Set block for early recreational comps data (block ending in 2000)
#Allowed dome shaped for block
model = "7_1_11_recBlock"
base.7111 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
SS_plots(base.7111)

#Use sensitivity of model 7111 - but RENAME as model 7112 for sensitivities
model = "7_1_11_comBlock_2003-2014"
base.7112 = SS_output(file.path(wd, model),covar=TRUE)
#Results are similar to that of model 716 where com comps in 1999-2002 and 2015-2020 are not fit


##
#All in one place
###
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
model = "7_1_1_norec"
base.711 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_1b_norec_reweight"
base.711b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_2_dw_MI"
base.712 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)
model = "7_1_3_dw_DM"
base.713 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_4_estlinf"
base.714 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_4b_estk"
base.714b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_5_estlinfK"
base.715 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_6_estL2CV"
base.716 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_7_estM"
base.717 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_8_noEarlyRec"
base.718 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_9_recAsym"
base.719 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_10_comDome"
base.7110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_11_recBlock"
base.7111 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "7_1_11_comBlock_2003-2014"
base.7112 = SS_output(file.path(wd, model),covar=TRUE)

#Compare sensitivities
sens_names <- c("Base model","No rec devs","DW MI", "DW DM", "Est Linf", "Est K", "Est Linf, K", "Est Old CV", "Est M", "No early rec comps", "Rec asymp. selex.", "Com dome-shaped selex.", "Rec block selex.", "Com block selex.")
sens_models  <- SSsummarize(list(base.710, base.711, base.712, base.713, base.714, base.714b, base.715, base.716, base.717, base.718, base.719, base.7110, base.7111, base.7112))

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

####
#Subset
####
#Compare sensitivities
sens_names <- c("Base model","No rec devs", "Rec asymp. selex.")
sens_models  <- SSsummarize(list(base.710, base.711, base.719))

SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "bottomleft", 
                  legendncol = 1,
                  filenameprefix = paste0("SSC_presentation_base.710_sensitivities_"),
                  subplot = c(1,3,11,12), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "topleft", 
                  legendncol = 1,
                  filenameprefix = paste0("SSC_presentation_base.710_sensitivities_"),
                  subplot = c(9), 
                  print = TRUE, 
                  pdf = FALSE)


###################################################################################
# Jason Style Sensitivity Figure
###################################################################################
sens_names <- c("Base model","No rec devs","DW MI", "DW DM", "Est Linf", "Est K", "Est Linf, K", "Est Old CV", "Est M", "No early rec comps", "Rec asymp. selex.", "Com dome-shaped selex.", "Rec block selex.", "Com block selex.")
x  <- SSsummarize(list(base.710, base.711, base.712, base.713, base.714, base.714b, base.715, base.716, base.717, base.718, base.719, base.7110, base.7111, base.7112))

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
                 sensi.type.breaks=c(2.5, 4.5, 9.5), #vertical breaks that can separate out types of sensitivities
                 anno.x=c(1.5, 3.5, 7.0, 12), # Vertical positioning of the sensitivity types labels
                 anno.y=c(1.83,1.80,1.85,1.85), # Horizontal positioning of the sensitivity types labels
                 anno.lab=c("Recruitment", "Data Weighting", "Parameters", "Selectivity"), #Sensitivity types labels
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
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_OR_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_OR_Recreational(2)", 1:n])   )  

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

kableExtra::save_kable(t, file = file.path("C:/Users/Brian.Langseth/Desktop/or/write_up/tex_tables/sensitivities.tex"))




###################################################################################
#Post SSC model runs
###################################################################################

#Starting from model 7_1_0_base

#1. Adjust projection values based on assuming recent catch 
#(values here: https://docs.google.com/spreadsheets/d/10EMQltWAhxCbdBvnt8Ao5tWJc-e7FmTDH8tcWgJKiXE/edit#gid=208964021)
#2. Correct M prior sd to 0.438


model = "8_0_0_postSSC_base"
base.800 = SS_output(file.path(wd, model),covar=TRUE)
SS_tune_comps(dir = "C:\\Users\\Brian.Langseth\\Desktop\\or\\8_0_0_postSSC_base", write = FALSE, option = "none")
SS_plots(base.800, forecastplot = TRUE)
SSunavailableSpawningOutput(base.800, plot=TRUE, print = TRUE, plotdir = file.path(wd, model, "plots"))
SSplotSPR(base.800,subplots=4,print=TRUE)

# #Copy model 800 but keep old version of M sd prior (0.48)
# #It is exactly the same (gradients too) as model 710
# model = "8_0_1_keepMsd"
# base.801 = SS_output(file.path(wd, model),covar=TRUE)
# SS_plots(base.801, forecastplot = TRUE)


#The sensitivity tables and model output are the same whether base.710 or base.800 is used. 
#All values are identical, with the exception being the Forecast recruitment likelihood and the 
#parameter priors likelihood, which differ at 10^-10 and 10^-12 orders of magnitude, respectively. 
#Because the tables, when rounded, are identical, I use the base.710 model in the sensitivity table. 

#Use base.710 model results for the write up, but with the projection table from base.800
#Use base.800 model for model files and r4ss plots


##
#Low and high states of nature - starting from model 8_0_0_postSSC_base
##

#Use states_of_nature.R to identify values for low and high state
#Low state is M = 0.0444, high is M = 0.0752 
model = "8_0_2_highState"
base.802 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.802)

model = "8_0_3_lowState"
base.803 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.803)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.800, base.802, base.803))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'decision_tables'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("States_of_nature_comparison_"),
                  subplot = c(2,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)

#Alternative Low state is R0 = 2.01, high is R0 = 2.28 
model = "8_0_4_highState_R0"
base.804 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.804)

model = "8_0_5_lowState_R0"
base.805 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.805)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.800, base.804, base.805))

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


#Alternative Low state is Lmax = 43.89, high is R0 = 40.51 
model = "8_0_6_highState_Lmax"
base.806 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.806)

model = "8_0_7_lowState_Lmax"
base.807 = SS_output(file.path(wd, model),covar=TRUE)
SS_plots(base.807)

sens_names <- c("Base model","High state","Low state")
sens_models  <- SSsummarize(list(base.800, base.806, base.807))

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




