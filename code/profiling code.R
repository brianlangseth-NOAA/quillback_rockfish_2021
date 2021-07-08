###############
#
#Profiling code from Copper code. Updating to reflect quillback rockfish
#
################

#devtools::install_github("nwfsc-assess/nwfscDiag")
library(nwfscDiag)

#######################################################################################################
# Washington 
#######################################################################################################

mydir = "C:/Users/Brian.Langseth/Desktop/wa"

#####################
#Exploration runs
####################
base_name = "0_4_R0profiling"
base_name = "1_0_1_comSelex_R0profile"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
                            low =  c(-1.5),
                            high = c(1.5),
                            step_size = c(0.2),
                            param_space = c('relative'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)


####################
#Proposed base run
####################
base_name = "6_0_1_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1"),
                            low =  c(0.03, 0.30, -1.0, 40),
                            high = c(0.09, 0.99,  2, 48),
                            step_size = c(0.005, 0.10, 0.25, 1),
                            param_space = c('real', 'real', 'relative', 'real'))


model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

#Linf base run doesn't converge so rerun the base run manually, replace base results as appropriately numbered files
#in profile results and run the following code
load(paste0(mydir,"/6_0_1_baseR0profile_profile_L_at_Amax_Fem_GP_1","/L_at_Amax_Fem_GP_1", "_profile_output.Rdata"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(5:1,6:10)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/6_0_1_baseR0profile_profile_L_at_Amax_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)


####################
#Proposed base run 9_0
####################
base_name = "9_0_0_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
                            low =  c(0.03, 0.30, -1, 40, 0.10),
                            high = c(0.09, 0.99,  2, 48, 0.25),
                            step_size = c(0.005, 0.10, 0.25, 1, 0.01),
                            param_space = c('real', 'real', 'relative', 'real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))
model_settings$jitter_fraction = 0.1

run_diagnostics(mydir = mydir, model_settings = model_settings)


####################
#Proposed base run 10_0
####################
base_name = "10_0_0_baseProfile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
                            low =  c(0.03, 0.30, -0.5, 40, 0.1),
                            high = c(0.12, 1.0,  2, 45, 0.22),
                            step_size = c(0.01, 0.10, 0.25, 0.5, 0.02),
                            param_space = c('real', 'real', 'relative', 'real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))

model_settings$jitter_fraction = 0.1 #also tried 0.25

run_diagnostics(mydir = mydir, model_settings = model_settings)




get = get_settings_profile( parameters =  c("SR_LN(R0)"),
                            low =  c(-0.5),
                            high = c(2),
                            step_size = c(0.25),
                            param_space = c('relative'))
get = get_settings_profile( parameters =  c("SR_BH_steep"),
                            low =  c(0.3),
                            high = c(1.0),
                            step_size = c(0.1),
                            param_space = c('real'))
get = get_settings_profile( parameters =  c("CV_old_Fem_GP_1"),
                            low =  c(0.05),
                            high = c(0.15),
                            step_size = c(0.01),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

#There are a number of seemingly non-converged runs in the profiles, especially for steepness and M, and for CV at L2. Rerun manually. 
#replace base results as appropriately numbered files in profile results and run code below
#1. M at 0.07, 0.06, the base (for base use the values from the base run), and 0.04
#Estimates of peak selex for rec fleet were reaching bounds above M = 0.1
load(paste0(mydir,"/10_0_0_baseProfile_profile_NatM_p_1_Fem_GP_1","/NatM_p_1_Fem_GP_1", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(3:1,4:11)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_NatM_p_1_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
get_summary(paste0(mydir,"/10_0_0_baseProfile_profile_NatM_p_1_Fem_GP_1"), profile_output$para, profile_output$vec, "profile_NatM_p_1_Fem_GP_1", profilemodels, profilesummary)
#I also ran 0.03 manually and this did not change the pattern.



#######################
#Steepness profile explorations
#######################
#Manual profiles
  #2. Steepness - rerun all runs manually (initially did with prior_like set to 1 - runs and synthesis are in folder "withPriorLike")
  load(paste0(mydir,"/10_0_0_baseProfile_profile_SR_BH_steep_withPriorLike/10_0_0_baseProfile_profile_SR_BH_steep","/SR_BH_steep", "_profile_output.Rdat"))
  profilemodels <- r4ss::SSgetoutput(dirvec = paste0(profile_output$mydir,"_withPriorLike/10_0_0_baseProfile_profile_SR_BH_steep"), keyvec = c(5:1,6:9)) #make sure order follows order of parameters from runs
  profilesummary <- r4ss::SSsummarize(profilemodels) 
  profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_SR_BH_steep_withPriorLike/10_0_0_baseProfile_profile_SR_BH_steep"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
  get_summary(paste0(mydir,"/10_0_0_baseProfile_profile_SR_BH_steep_withPriorLike/10_0_0_baseProfile_profile_SR_BH_steep"), profile_output$para, profile_output$vec, "profile_SR_BH_steep", profilemodels, profilesummary)
  
  #Profile is a little odd. Plot results to look over
  for(i in seq(0.3,1,0.1)){
    model = paste0("10_0_0_baseProfile_profile_SR_BH_steep_",i)
    sens_h = SS_output(file.path(mydir, model), covar=TRUE)
    SS_plots(sens_h)
  }
  
  #2b. Steepness - USE THIS profile for report. Rerun all runs manually (set prior_like in the starter file to 0 - runs are in folder "noPriorLike")
  load(paste0(mydir,"/10_0_0_baseProfile_profile_SR_BH_steep","/SR_BH_steep", "_profile_output.Rdat"))
  profilemodels <- r4ss::SSgetoutput(dirvec = paste0(profile_output$mydir), keyvec = c(5:1,6:9)) #make sure order follows order of parameters from runs
  profilesummary <- r4ss::SSsummarize(profilemodels) 
  profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_SR_BH_steep"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
  get_summary(paste0(mydir,"/10_0_0_baseProfile_profile_SR_BH_steep"), profile_output$para, profile_output$vec, "profile_SR_BH_steep", profilemodels, profilesummary)
  
  #2btest. Steepness - test at values of 0.3 and 0.4 with rec selex phase set to 2 to see if phase makes these values so much different than the rest of the profile
  #These are in the folder "10_0_0_baseProfile_profile_SR_BH_steep_noPriorLike_origPhase"
  #NO difference
  
#Profiles with testing phase, and fixed selex
  #Tested whether oddity with steepness profile was due to phase of rec selex (which I set to 1 for full profiling). Reran steepness profile (automated) with selex phase set to 2
  get = get_settings_profile( parameters =  c("SR_BH_steep"),
                              low =  c(0.3),
                              high = c(1.0),
                              step_size = c(0.1),
                              param_space = c('real'))
  model_settings = get_settings(settings = list(base_name = "10_0_0_baseProfile_RecPhase2",
                                                run = c("profile"),
                                                profile_details = get ))
  run_diagnostics(mydir = mydir, model_settings = model_settings)
  #NO - same pattern
  
  #Tested whether oddity with steepness profile was due to com selex. Reran steepness profile (automated) with fixed commecial selex
  get = get_settings_profile( parameters =  c("SR_BH_steep"),
                              low =  c(0.3),
                              high = c(1.0),
                              step_size = c(0.1),
                              param_space = c('real'))
  model_settings = get_settings(settings = list(base_name = "10_0_0_baseProfile_fixComSelex",
                                                run = c("profile"),
                                                profile_details = get ))
  run_diagnostics(mydir = mydir, model_settings = model_settings)
  #Pattern differs but still affected by oddities. Would need to manually run to confirm
  
  #Tested whether oddity with steepness profile was due to rec selex. Reran steepness profile (automated) with fixed recreational selex
  get = get_settings_profile( parameters =  c("SR_BH_steep"),
                              low =  c(0.3),
                              high = c(1.0),
                              step_size = c(0.1),
                              param_space = c('real'))
  model_settings = get_settings(settings = list(base_name = "10_0_0_baseProfile_fixRecSelex",
                                                run = c("profile"),
                                                profile_details = get ))
  run_diagnostics(mydir = mydir, model_settings = model_settings)
  #Pattern looks normal. Rec selex clearly has an effect
  #USE THIS profile for report.
  
  
  #Tested whether oddity with steepness profile was due to selex. Reran steepness profile (automated) with fixed commecial AND recreational selex
  get = get_settings_profile( parameters =  c("SR_BH_steep"),
                              low =  c(0.3),
                              high = c(1.0),
                              step_size = c(0.1),
                              param_space = c('real'))
  model_settings = get_settings(settings = list(base_name = "10_0_0_baseProfile_fixSelex",
                                                run = c("profile"),
                                                profile_details = get ))
  run_diagnostics(mydir = mydir, model_settings = model_settings)
  #Pattern looks the same as when just rec selex is fixed.
######################
  
#3. CV at L2
#Fully manual
load(paste0(mydir,"/10_0_0_baseProfile_profile_CV_old_Fem_GP_1","/CV_old_Fem_GP_1", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(5:1,6:11)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_CV_old_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
get_summary(paste0(mydir,"/10_0_0_baseProfile_profile_CV_old_Fem_GP_1"), profile_output$para, profile_output$vec, "profile_CV_old_Fem_GP_1", profilemodels, profilesummary)
#Results show any value <0.1 results in very high R0 and biomass. However the uncertainty around R0 is REALLY large (CV ~ 50%) 

#Do profile for CV at L2, with fixed recreational selex because pattern above under base appeared to go into alternative states
get = get_settings_profile( parameters =  c("CV_old_Fem_GP_1"),
                            low =  c(0.05),
                            high = c(0.15),
                            step_size = c(0.01),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = "10_0_0_baseProfile_fixRecSelex",
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)
#This profile shows the effect of fixing selectivity matters.  
  

#Add profile for selectivity parameters
#These kick back at the plotting stage, but if run the profile_plot script (from github) manually there is no issue (This plots figures to mydir though)
#So have to run each selectivity pattern separately
#Recreational
get = get_settings_profile( parameters =  c("Size_DblN_peak_WA_Recreational(1)"),
                            low =  c(38),
                            high = c(47),
                            step_size = c(1),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)
#Plot manually - recreational
load(paste0(mydir,"/10_0_0_baseProfile_profile_Size_DblN_peak_WA_Recreational(1)/Size_DblN_peak_WA_Recreational(1)_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = paste0(profile_output$mydir), keyvec = c(7:1,8:11)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
#profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_Size_DblN_peak_WA_Recreational(1)"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
#Run the internal script in profile_plot function after running the following and plots are produced
rep = profile_output$rep
vec = profile_output$vec
para = profile_output$para
#USE THIS for the report

#Commercial
get = get_settings_profile( parameters =  c("Size_DblN_peak_WA_Commercial(2)"),
                            low =  c(38),
                            high = c(47),
                            step_size = c(1),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)

#Plot manually - commercial
load(paste0(mydir,"/10_0_0_baseProfile_profile_Size_DblN_peak_WA_Commercial(2)/Size_DblN_peak_WA_Commercial(2)_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = paste0(profile_output$mydir), keyvec = c(7:1,8:11)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
#profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_Size_DblN_peak_WA_Commercial(2)"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
#Run the internal script in profile_plot function after running the following and plots are produced
rep = profile_output$rep
vec = profile_output$vec
para = profile_output$para
#Commercial is odd so would need to rerun manually to remedy




#######################################################################################################
# Oregon
#####################################################################################################

mydir = "C:/Users/Brian.Langseth/Desktop/or"

base_name = "1_0_recdevs_R0profile"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
                            low =  c(-1.5),
                            high = c(1.5),
                            step_size = c(0.2),
                            param_space = c('relative'))



model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

####################
#Proposed base run
####################
base_name = "3_0_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1"),
                            low =  c(0.03, 0.30, -1, 40),
                            high = c(0.09, 0.99,  1, 48),
                            step_size = c(0.005, 0.10, 0.25, 1),
                            param_space = c('real', 'real', 'relative', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

####################
#Proposed base run
####################
base_name = "5_0_0_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
                            low =  c(0.03, 0.30, -1, 40, 0.1),
                            high = c(0.09, 0.99,  1, 48, 0.25),
                            step_size = c(0.005, 0.10, 0.25, 1, 0.01),
                            param_space = c('real', 'real', 'relative', 'real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))
model_settings$jitter_fraction = 0.1

run_diagnostics(mydir = mydir, model_settings = model_settings)


####################
#Proposed base run
####################
base_name = "7_0_0_baseProfile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
                            low =  c(0.03, 0.30, -1, 40, 0.1),
                            high = c(0.09, 0.99,  1, 48, 0.25),
                            step_size = c(0.005, 0.10, 0.2, 1, 0.015),
                            param_space = c('real', 'real', 'relative', 'real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))
model_settings$jitter_fraction = 0.1
model_settings$prior_like = 1

run_diagnostics(mydir = mydir, model_settings = model_settings)
#Previous runs were not converged


####################
#Proposed base run
####################
base_name = "7_1_0_baseProfile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1", "CV_old_Fem_GP_1"),
                            low =  c(0.03, 0.30, 1.6, 40, 0.12, 0.05),
                            high = c(0.12, 1.0, 3.0, 48, 0.225, 0.15),
                            step_size = c(0.01, 0.10, 0.2, 1, 0.015, 0.01),
                            param_space = c('real', 'real', 'real', 'real', 'real', 'real'))


model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("jitter", "profile", "retro"),
                                              profile_details = get ))

model_settings$jitter_fraction = 0.1

run_diagnostics(mydir = mydir, model_settings = model_settings)


get = get_settings_profile( parameters =  c("SR_BH_steep"),
                            low =  c(0.11),
                            high = c(0.23),
                            step_size = c(0.02),
                            param_space = c('real'))
get = get_settings_profile( parameters =  c("VonBert_K_Fem_GP_1"),
                            low =  c(0.12),
                            high = c(0.225),
                            step_size = c(0.015),
                            param_space = c('real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)


#There are a number of seemingly non-converged runs in the profiles. Rerun manually. 
#replace base results as appropriately numbered files in profile results and run code below
#1. M at base value (copy over report from baseProfile model)
load(paste0(mydir,"/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1","/NatM_p_1_Fem_GP_1", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(3:1,4:11)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
get_summary(paste0(mydir,"/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1"), profile_output$para, profile_output$vec, "profile", profilemodels, profilesummary)

#2. H at 0.5. Run in new folder. Copy and replace report file. Set prior like to 0
load(paste0(mydir,"/7_1_0_baseProfile_profile_SR_BH_steep","/SR_BH_steep", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(5:1,6:9)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/7_1_0_baseProfile_profile_SR_BH_steep"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
get_summary(paste0(mydir,"/7_1_0_baseProfile_profile_SR_BH_steep"), profile_output$para, profile_output$vec, "profile_SR_BH_steep", profilemodels, profilesummary)


#4. Redo K at 0.18. Run in new folder. Have to use par file as inits. Copy and replace report file. 
#Doesnt improve. 
#Rerun all runs manually (set prior_like in the starter file to 0 - runs are in folder "noPriorLike")
#Also doesnt work
load(paste0(mydir,"/7_1_0_baseProfile_profile_VonBert_K_Fem_GP_1","/VonBert_K_Fem_GP_1", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(5:1,6:8)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/7_1_0_baseProfile_profile_VonBert_K_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
get_summary(paste0(mydir,"/7_1_0_baseProfile_profile_VonBert_K_Fem_GP_1"), profile_output$para, profile_output$vec, "profile", profilemodels, profilesummary)

#Try rerunning the profile with rec selec fixed - 7_1_0_baseProfile_fixRecSelex. K of 0.18 still doesnt line up well
get = get_settings_profile( parameters =  c("VonBert_K_Fem_GP_1"),
                            low =  c(0.12),
                            high = c(0.225),
                            step_size = c(0.015),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = "7_1_0_baseProfile_fixRecSelex",
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)


#Run RO profile on norecdevs model (model 711) to ensure length data inform profile
#Recreational informs recruitment component
get = get_settings_profile( parameters =  c("SR_LN(R0)"),
                            low =  c(2.4),
                            high = c(3.0),
                            step_size = c(0.1),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = "7_1_1_norecProfile",
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)


####################
#Jitter Linf and K sensitivities
####################
mydir = "C:/Users/Brian.Langseth/Desktop/or/sensitivities"

base_name = "7_1_4_estlinf"
base_name = "7_1_4b_estk"


model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("jitter")))

model_settings$jitter_fraction = 0.1

run_diagnostics(mydir = mydir, model_settings = model_settings)

#Sensitivity for Linf is not converged. Best run models indicate a value very near the
#base is the best fitting model, which is consistent with the Linf profile.

#Sensitivity for K is not converged. Best run models indicate a value near 0.12 is 
#the best fitting model. This differs from the K profile.


#######################################################################################################
# California
#####################################################################################################

mydir = "C:/Users/Brian.Langseth/Desktop/ca"
base_name = "1_0_0_recdevs_R0profile"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
                            low =  c(-1.5),
                            high = c(1.5),
                            step_size = c(0.2),
                            param_space = c('relative'))



model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

####################
#Proposed base run 4_0
####################
base_name = "4_0_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1"),
                            low =  c(0.03, 0.40, -1, 41),
                            high = c(0.09, 0.99,  1, 48),
                            step_size = c(0.005, 0.10, 0.25, 1),
                            param_space = c('real', 'real', 'relative', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)


####################
#Proposed base run 5_0
####################
base_name = "5_0_1_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1"),
                            low =  c(0.03, 0.40, -1, 40),
                            high = c(0.09, 0.99,  1, 47),
                            step_size = c(0.005, 0.10, 0.25, 1),
                            param_space = c('real', 'real', 'relative', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

####################
#Proposed base run 6_0
####################
base_name = "6_0_0_baseR0profile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
                            low =  c(0.03, 0.40, -1, 40, 0.10),
                            high = c(0.09, 0.99,  1, 47, 0.25),
                            step_size = c(0.005, 0.10, 0.25, 1, 0.01),
                            param_space = c('real', 'real', 'relative', 'real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))
model_settings$jitter_fraction = 0.1

run_diagnostics(mydir = mydir, model_settings = model_settings)


##
#Long retro
model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("retro")))
model_settings$retro_yrs = ((-1):(-25))
run_diagnostics(mydir = mydir, model_settings = model_settings)


####################
#Proposed base run 7_1
####################
base_name = "7_1_0_baseProfile"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1", "CV_old_Fem_GP_1"),
                            low =  c(0.03, 0.30, 2.25, 40, 0.1, 0.05),
                            high = c(0.12, 1.00,  3.75, 47, 0.25, 0.15),
                            step_size = c(0.01, 0.10, 0.25, 1, 0.01, 0.01),
                            param_space = c('real', 'real', 'real', 'real', 'real', 'real'))


model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile", "retro", "jitter"),
                                              profile_details = get ))
model_settings$jitter_fraction = 0.25

run_diagnostics(mydir = mydir, model_settings = model_settings)


get = get_settings_profile( parameters =  c("CV_old_Fem_GP_1"),
                            low =  c(0.05),
                            high = c(0.15),
                            step_size = c(0.01),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)



#Run RO profile on norecdevs model (model 711) to ensure length data inform profile
#Recreation fleet informs recruitments most
get = get_settings_profile( parameters =  c("SR_LN(R0)"),
                            low =  c(3.1),
                            high = c(4.0),
                            step_size = c(0.1),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = "7_1_1_norecProfile",
                                              run = c("profile"),
                                              profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)


