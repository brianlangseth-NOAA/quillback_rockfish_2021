# Quillback Washington Model Runs

#devtools::install_github("r4ss/r4ss")
library(r4ss)

wd = "C:/Users/Brian.Langseth/Desktop/wa"

model = "0_0_init_model"
base = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base)

model = "0_0_init_model_recFirst"
base.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1)

wd = "C:/Users/Brian.Langseth/Desktop/wa"
model = "0_1_0_recdevs"
base.1.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.1)

##Extending recdevs further into past
#Makes no difference - ignore
model = "0_1_1_recdevs_longearly"
base.1.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.2)

##Starting recdevs when data become available 1980 to reduce # of parameters
##Do so since longer recdevs aren't that variable. 
#Very similar to starting recdevs in 1960.
#Probably best to go with this one. 
model = "0_1_2_recdevs_1980"
base.1.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.1.3)


##Doing data weighting
##Starting with francis weighting with the 1980s recdev version
SS_tune_comps(dir = "L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\models\\wa\\0_1_recdevs_1980", write = FALSE)
#adjusting only for 1 iteration
model = "0_2_dw_francis"
base.2.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.1)

#adjusting only for 1 iteration
model = "0_2_dw_MI"
base.2.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.2.2)


##Even with recdevs and data weighting the Hessian may not be positive definite
##Starting with the 1980s recdev version
#Adding catch to 2020, set equal to 2019 catch
#Nope - still might not be positive definite
model = "0_3_0_fixHessian_2020catch"
base.3.0 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.0)

#Copying the 2020catch version, now removing fits to commercial comps 
#Nope - still might not be positive definite
model = "0_3_1_fixHessian_noComComps"
base.3.1 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.1)

#Copying the removing fits to commercial comps, removing fits to commercial catch 
#Nope - still might not be positive definite
model = "0_3_2_fixHessian_noCom"
base.3.2 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.2)

#Copying the removing fits to commercial catch, adding eq catch 
#Nope - still might not be positive definite
model = "0_3_3_fixHessian_eqCatch"
base.3.3 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.3)

#Copying the removing fits to commercial catch, extending selex top length (parm 1) 
#Nope - still might not be positive definite
model = "0_3_4_fixHession_upSelex"
base.3.4 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.4)

#Copying the removing fits to commercial catch, removing sparse length comps (up to 1995 - the first 4 years)
#Nope - still might not be positive definite
model = "0_3_5_fixHession_cleanComps"
base.3.5 = SS_output(file.path(wd, model),covar=FALSE)
SS_plots(base.3.5)

