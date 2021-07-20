# Quillback California Model Runs post SSC (post June)

#devtools::install_github("r4ss/r4ss")
library(r4ss)

wd = "C:/Users/Brian.Langseth/Desktop/ca"


####
#Post SSC analyses with DebWV lengths
####

#Add historical CA data from debWV separately
#Copy model 710
model = "8_0_0_debWV"
base.800 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.800)
SS_tune_comps(dir = file.path(wd, "8_0_0_debWV"), write = FALSE)

#Reweight model 800
model = "8_0_1_debWV_reweight"
base.801 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.801)
SS_tune_comps(dir = file.path(wd, "8_0_1_debWV_reweight"), write = FALSE)

#Combine historical CA data from debWV (debWV_comb.csv) with original comps
#Copy model 710
model = "8_0_2_debWV_comb"
base.802 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.802)
SS_tune_comps(dir = file.path(wd, "8_0_2_debWV_comb"), write = FALSE)

#Reweight model 802 (note this is different than the values for reweighting model 800)
model = "8_0_3_debWV_comb_reweight"
base.803 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.803)
SS_tune_comps(dir = file.path(wd, "8_0_3_debWV_comb_reweight"), write = FALSE)


##
#All in one place
##
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
model = "8_0_0_debWV"
base.800 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_1_debWV_reweight"
base.801 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_2_debWV_comb"
base.802 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_3_debWV_comb_reweight"
base.803 = SS_output(file.path(wd, model), covar=TRUE)

#Compare sensitivities
sens_names <- c("Base model","Add sep","Add sep - reweight", "Add comb", "Add comb - reweight")
sens_models  <- SSsummarize(list(base.710, base.800, base.801, base.802, base.803))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.800_sensitivities_"),
                  subplot = c(1,2,3,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities'), 
                  legendloc = "topleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.800_sensitivities_"),
                  subplot = c(9,10), 
                  print = TRUE, 
                  pdf = FALSE)





