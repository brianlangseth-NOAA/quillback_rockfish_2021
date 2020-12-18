# Quillback Oregon Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)

wd = "C:/Users/Brian.Langseth/Desktop/or"


model.0 = "0_0_init_model"
base.0 = SS_output(file.path(wd, model.0),covar=TRUE)
SS_plots(base.0)

##Include recdevs
##Take init model and add rec devs. Extend early back to start of catch. Main at start of comps. 
model.1.1 = "0_1_0_recdevs"
base.1.1 = SS_output(file.path(wd, model.1),covar=TRUE)
SS_plots(base.1)

##Copy recdev version and shorten early phase devs to half of max age from comps (so 45 years before 1980 - 1935)
##Also the period at which early devs start to move away from 0
model.1.2 = "0_1_1_recdevs_adjearly"
base.1.2 = SS_output(file.path(wd, model.1.2),covar=TRUE)
SS_plots(base.1.2)

##Doing data weighting
##Starting with francis weighting with the 1980s recdev version
SS_tune_comps(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\models\\or\\0_1_1_recdevs_adjearly", write = FALSE)
#adjusting only for 1 iteration
model.2.1 = "0_2_dw_francis"
base.2.1 = SS_output(file.path(wd, model.2.1),covar=TRUE)
SS_plots(base.2.1)

model.2.2 = "0_2_dw_MI"
base.2.2 = SS_output(file.path(wd, model.2.2),covar=TRUE)
SS_plots(base.2.2)

