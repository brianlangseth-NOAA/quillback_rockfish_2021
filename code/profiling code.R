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
#Proposed base run
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



