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
                            low =  c(0.03, 0.30, -0.5, 40, 0.15),
                            high = c(0.09, 0.99,  2, 46, 0.25),
                            step_size = c(0.01, 0.10, 0.25, 0.5, 0.01),
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
                            high = c(0.9),
                            step_size = c(0.1),
                            param_space = c('real'))
model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("profile"),
                                              profile_details = get ))
model_settings$extras = NULL #remove the no hessian option

run_diagnostics(mydir = mydir, model_settings = model_settings)

#There are a number of seemingly non-converged runs in the profiles, especially for steepness and M. Rerun manually. 
#replace base results as appropriately numbered files in profile results and run code below
#1. M at 0.07, 0.06, the base (for base use the values from the base run), and 0.04
load(paste0(mydir,"/10_0_0_baseProfile_profile_NatM_p_1_Fem_GP_1","/NatM_p_1_Fem_GP_1", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(3:1,4:8)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/10_0_0_baseProfile_profile_NatM_p_1_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)

#2. Steepness





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

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
                            low =  c(0.03, 0.30, -1, 40, 0.1),
                            high = c(0.09, 0.99,  1, 48, 0.25),
                            step_size = c(0.005, 0.10, 0.2, 1, 0.015),
                            param_space = c('real', 'real', 'relative', 'real', 'real'))


model_settings = get_settings(settings = list(base_name = base_name,
                                              run = c("jitter", "profile", "retro"),
                                              profile_details = get ))

model_settings$jitter_fraction = 0.1

run_diagnostics(mydir = mydir, model_settings = model_settings)

#There are a number of seemingly non-converged runs in the profiles. Rerun manually. 
#replace base results as appropriately numbered files in profile results and run code below
#1. M at base value (copy over report from baseProfile model)
load(paste0(mydir,"/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1","/NatM_p_1_Fem_GP_1", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(6:1,7:14)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/7_1_0_baseProfile_profile_NatM_p_1_Fem_GP_1"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
#2. R0 at 1.6. Run in new folder. Copy and replace report file
load(paste0(mydir,"/7_1_0_baseProfile_profile_SR_LN(R0)","/SR_LN(R0)", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(5:1,6:11)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/7_1_0_baseProfile_profile_SR_LN(R0)"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
#3. H at 0.5 and at 0.99 (since settings dont include 0.99). Run in new folder. Copy and replace report file
load(paste0(mydir,"/7_1_0_baseProfile_profile_SR_BH_steep","/SR_BH_steep", "_profile_output.Rdat"))
profilemodels <- r4ss::SSgetoutput(dirvec = profile_output$mydir, keyvec = c(5:1,6:8)) #make sure order follows order of parameters from runs
profilesummary <- r4ss::SSsummarize(profilemodels) 
profile_plot(paste0(mydir,"/7_1_0_baseProfile_profile_SR_BH_steep"), model_settings, profile_output$rep, profile_output$vec, profile_output$para, profilesummary)
#4. Redo K at 0.18. Run in new folder. Have to use par file as inits. Copy and replace report file. 
#Doesnt improve. 






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




