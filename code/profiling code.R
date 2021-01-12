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


###########The following scripts are from Chantel's script. Right now Im not using.##############################

# #Plot the results
# pngfun(wd = file.path(mydir, paste0(base_name)), 
#        file = "R0_profile_wa.png",
#        w = 7, h = 12)
# par(mfrow=c(3,1))
# SSplotProfile(summaryoutput = profile_output$profilesummary, 
#               main = "Changes in total likelihood", 
#               profile.string = "R0", 
#               profile.label = "R0", 
#               ymax = 40)
# abline(h = 1.92, lty = 2, col='red')
# 
# 
# PinerPlot (summaryoutput = profile_output$profilesummary, 
#            plot = TRUE, print = FALSE, component = "Length_like",
#            main = "Length-composition likelihoods", 
#            profile.string = "R0", 
#            profile.label = "R0",
#            ylab = "Change in -log-likelihood", 
#            legendloc = "topright", 
#            ymax = 20)
# 
# PinerPlot (summaryoutput = profile_output$profilesummary, 
#            plot = TRUE, print = FALSE, component = "Surv_like",
#            main = "Survey likelihoods", 
#            profile.string = "R0", 
#            profile.label = "R0",
#            ylab = "Change in -log-likelihood", 
#            legendloc = "topright", 
#            ymax = 10)
# dev.off()


# #######################################################################################################
# # North of Pt. Conception
# #######################################################################################################
# 
# mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c"
# base_name = "5.1_data_rec_len_trawl_survey"
# 
# get = get_settings_profile( parameters =  c("SR_LN(R0)"),
#                             low =  c(-2),
#                             high = c(2),
#                             step_size = c(0.25),
#                             param_space = c('relative'))
# 
# 
# model_settings = get_settings(settings = list(base_name = base_name,
#                                               run = c("profile"),
#                                               profile_details = get ))
# 
# run_diagnostics(mydir = mydir, model_settings = model_settings)
# 
# pngfun(wd = file.path(mydir, paste0(base_name, "_profile_SR_LN(R0)")), 
#        file = "R0_profile_ca_n_pt_c.png",
#        w = 12, h = 7)
# par(mfrow=c(1,2))
# SSplotProfile(summaryoutput = profile_output$profilesummary, 
#               main = "Changes in total likelihood", 
#               profile.string = "R0", 
#               profile.label = "R0", 
#               ymax = 40)
# abline(h = 1.92, lty = 2, col='red')
# 
# PinerPlot (summaryoutput = profile_output$profilesummary, 
#            plot = TRUE, print = FALSE, component = "Length_like",
#            main = "Length-composition likelihoods", 
#            profile.string = "R0", 
#            profile.label = "R0",
#            ylab = "Change in -log-likelihood", 
#            legendloc = "topright", 
#            ymax = 20)
# dev.off()
# 
# 
# 
# #######################################################################################################
# # Oregon
# #######################################################################################################
# 
# mydir = "C:/Assessments/2021/copper_rockfish_2021/models/or"
# base_name = "2.4_recdevs_early_est_p1_only_block"
# 
# get = get_settings_profile( parameters =  c("SR_LN(R0)"),
#                             low =  c(-1),
#                             high = c(1),
#                             step_size = c(0.1),
#                             param_space = c('relative'))
# 
# 
# model_settings = get_settings(settings = list(base_name = base_name,
#                                               run = c("profile"),
#                                               profile_details = get ))
# 
# run_diagnostics(mydir = mydir, model_settings = model_settings)
# 
# load(file.path(mydir, paste0(base_name, "_SR_LN(R0)"), "SR_LN(R0)_profile_output.Rdata"))
# 
# pngfun(wd = file.path(mydir, "2.4_recdevs_early_est_p1_only_block_profile_SR_LN(R0)"), 
#        file = "R0_profile_or.png", 
#        w = 12, h = 7)
# par(mfrow=c(1,2))
# SSplotProfile(summaryoutput = profile_output$profilesummary, 
#               main = "Changes in total likelihood", 
#               profile.string = "R0", 
#               profile.label = "R0", 
#               ymax = 20)
# abline(h = 1.92, lty = 2, col='red')
# 
# 
# PinerPlot (summaryoutput = profile_output$profilesummary, 
#            plot = TRUE, print = FALSE, component = "Length_like",
#            main = "Length-composition likelihoods", 
#            profile.string = "R0", 
#            profile.label = "R0",
#            ylab = "Change in -log-likelihood", 
#            legendloc = "topright", 
#            ymax = 20)
# 
# dev.off()
# 
# 
# #######################################################################################################
# # Washington
# #######################################################################################################
# 
# mydir = "C:/Assessments/2021/copper_rockfish_2021/models/wa"
# base_name = "5.1.1_selex_cv_fixed"
# 
# get = get_settings_profile( parameters =  c("SR_LN(R0)"),
#                             low =  c(-1),
#                             high = c(1),
#                             step_size = c(0.1),
#                             param_space = c('relative'))
# 
# 
# model_settings = get_settings(settings = list(base_name = base_name,
#                                               run = c("profile"),
#                                               profile_details = get ))
# 
# run_diagnostics(mydir = mydir, model_settings = model_settings)
# 
# load(file.path(mydir, paste0(base_name, "_SR_LN(R0)"), "SR_LN(R0)_profile_output.Rdata"))
# 
# pngfun(wd = file.path(mydir, "5.1.1_selex_cv_fixed_profile_SR_LN(R0)"), 
#        file = "R0_profile_wa.png", w = 12, h = 7)
# par(mfrow=c(1,2))
# SSplotProfile(summaryoutput = profile_output$profilesummary, 
#               main = "Changes in total likelihood", 
#               profile.string = "R0", 
#               profile.label = "R0", 
#               ymax = 20)
# abline(h = 1.92, lty = 2, col='red')
# 
# 
# PinerPlot (summaryoutput = profile_output$profilesummary, 
#            plot = TRUE, print = FALSE, component = "Length_like",
#            main = "Length-composition likelihoods", 
#            profile.string = "R0", 
#            profile.label = "R0",
#            ylab = "Change in -log-likelihood", 
#            legendloc = "topright", 
#            ymax = 20)
# 
# 
# dev.off()