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
base_name = "0_4_R0profiling"
base_name = "1_0_1_comSelex_R0profile"

mydir = "C:/Users/Brian.Langseth/Desktop/or"
base_name = "1_0_recdevs_R0profile"

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