# Quillback California Model Runs post SSC (post June)
# based on request document provided by John DeVore

#devtools::install_github("r4ss/r4ss")
library(r4ss)
library(ggplot2)
library(tidyr)

wd = "C:/Users/Brian.Langseth/Desktop/ca"


############
#DebWV lengths
############

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


##Comparisons
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
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.800_debWV_sensitivities_"),
                  subplot = c(1,2,3,4,11,12), 
                  print = TRUE, 
                  pdf = FALSE,
                  uncertainty = c(TRUE,FALSE,FALSE,FALSE,FALSE))

SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots'), 
                  legendloc = "topleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.800_debWV_sensitivities_"),
                  subplot = c(9,10), 
                  print = TRUE, 
                  pdf = FALSE)

#Used in report
sens_names <- c("Base model","With new data", "With new data - reweight")
sens_models  <- SSsummarize(list(base.710, base.800, base.803))
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots', "ForReport"), 
                  legendloc = "bottomleft", 
                  legendncol = 1,
                  filenameprefix = paste0("base.800_debWV_sensitivities_"),
                  subplot = c(1,2,3,4,9,11,12), 
                  print = TRUE, 
                  pdf = FALSE,
                  uncertainty = c(TRUE,TRUE,TRUE))


#Plot comps of old and new data - Used in report
newlen <- read.csv(file.path("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish",
                             "data", "forSS", "ca_rec_notExpanded_Length_comp_Sex_0_bin=10-50_debWV.csv"), header = TRUE)
newlen <- newlen[,-c(2:5)]
newlen[,-c(1,2)] <- newlen[,-c(1,2)]/rowSums(newlen[,-c(1,2)])
newlen.long <- gather(newlen, length, proportion, U.10:U.50, factor_key = TRUE)
newlen.long$lengthbin = as.numeric(substr(newlen.long$length,3,4))
newlen.long$Source = "new"

oldlen <- read.csv(file.path("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish",
                             "data", "forSS", "ca_rec_notExpanded_Length_comp_Sex_0_bin=10-50_Feb2021.csv"), header = TRUE)
oldlen <- oldlen[,-c(2:5)]
oldlen[,-c(1,2)] <- oldlen[,-c(1,2)]/rowSums(oldlen[,-c(1,2)])
oldlen.long <- gather(oldlen, length, proportion, U.10:U.50, factor_key = TRUE)
oldlen.long$lengthbin = as.numeric(substr(oldlen.long$length,3,4))
oldlen.long$Source = "original"

len.long = rbind(newlen.long,oldlen.long)

png(file = file.path(wd, "postSSC_plots", "ForReport",
                     "Comp_overlap.png"), width = 7, height = 5, units = "in", res = 300)
ggplot(len.long[len.long$year %in% c(1987:1998), ], aes(lengthbin, proportion, color=Source))+ 
  geom_line(lwd=1.5)+
  ylab("Proportion")+
  xlab("Length (cm)")+
  facet_wrap(~year)+
  geom_text(aes(45, 0.7, label = Nsamp), position = position_dodge(width = 15), show.legend = FALSE)
dev.off()



###########
#Selectivity adjustments
###########
#Add block for rec fleet starting in 2001
#Copy model 710
model = "8_0_4_recBlock2001"
base.804 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.804)
SS_tune_comps(dir = file.path(wd, "8_0_4_recBlock2001"), write = FALSE)

#Add block with just estimating 3 parameters
#Copy model 804
model = "8_0_4b_recBlock2001_3parm"
base.804b = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.804b)
SS_tune_comps(dir = file.path(wd, "8_0_4b_recBlock2001_3parm"), write = FALSE)
#More or less the same

#Reweight model 804
model = "8_0_5_recBlock2001_reweight"
base.805 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.805)
SS_tune_comps(dir = file.path(wd, "8_0_5_recBlock2001_reweight"), write = FALSE)


#Add block for rec fleeting in 2001 and 2017
#These are based on the "requested" 2001 and 2017
#Copy model 804
model = "8_0_6_recBlock2001_2017"
base.806 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.806)
SS_tune_comps(dir = file.path(wd, "8_0_6_recBlock2001_2017"), write = FALSE)

#Parm 2 for the 2001-2016 block is at the upper bound. Try fixing it at original estimate
model = "8_0_6b_recBlock2001_2017_fix2"
base.806b = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.806b)
SS_tune_comps(dir = file.path(wd, "8_0_6b_recBlock2001_2017_fix2"), write = FALSE)
#Results in very different end year selectivity than model 806 due to fix,
#the model needs to compensate. Results much more similar to model 804. 
#Doesn't seem like best practice (seems better to fix at low value of parm2)
#but fits in later years for this model are better than fix2lo (model 806c)

#Now try fixing it at its lower bound
model = "8_0_6c_recBlock2001_2017_fix2lo"
base.806c = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.806c)
SS_tune_comps(dir = file.path(wd, "8_0_6c_recBlock2001_2017_fix2lo"), write = FALSE)
#This seems more reasonable. Selects bigger fish after 2017 which is as would
#be expected because areas opening up (but mostly because large comps in those years), 
#and fairly tight bounds on sizes between 2001-2017. However, compared to fix2
#the fits in later years seem worse

#Try with later period as asymptotic (logic is those areas are more open
#and presumably more similar to pre-2001 times). Thus dome in later years
#is shifted fairly far right. 
#Copy model 806
model = "8_0_6d_recBlock2001_2017_lateAsymp"
base.806d = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.806d)
SS_tune_comps(dir = file.path(wd, "8_0_6d_recBlock2001_2017_lateAsymp"), write = FALSE)

#Try with extending the bound for parameter 2 to -10
#Copy model 806
model = "8_0_6e_recBlock2001_2017_extend"
base.806e = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.806e)
SS_tune_comps(dir = file.path(wd, "8_0_6e_recBlock2001_2017_extend"), write = FALSE)
#Very similar to model 806b, so try again with init value of parameter 2
#set to -7

#Add block for rec fleets in 2001, 2003, 2008, and 2017
#These are based on the "requested" 2001 and 2017, but also based 
#on changes in % area open to fishing from CDFW Report 1 (Table A-1)
#Copy model 806
model = "8_0_7_recBlock2001_2003_2008_2017"
base.807 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.807)
SS_tune_comps(dir = file.path(wd, "8_0_7_recBlock2001_2003_2008_2017"), write = FALSE)


#Add block for rec fleeting in 2001, 2005
#These are based on the "requested" 2001, but also based 
#on changes in mean length in 2005 from the data plots
#Copy model 806
model = "8_0_8_recBlock2001_2005"
base.808 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.808)
SS_tune_comps(dir = file.path(wd, "8_0_8_recBlock2001_2005"), write = FALSE)

#Add block for rec fleeting in 2001, 2005, and 2017
#These are based on the "requested" 2001 and 2017, but also based 
#on changes in mean length in 2005 from the data plots
#Copy model 806
model = "8_0_9_recBlock2001_2005_2017"
base.809 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.809)
SS_tune_comps(dir = file.path(wd, "8_0_9_recBlock2001_2005_2017"), write = FALSE)


##Comparisons
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
model = "8_0_4_recBlock2001"
base.804 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_5_recBlock2001_reweight"
base.805 = SS_output(file.path(wd, model), covar=TRUE)
model = "7_1_10_recDome"
base.7110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)
model = "8_0_6b_recBlock2001_2017_fix2"
base.806b = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6c_recBlock2001_2017_fix2lo"
base.806c = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6d_recBlock2001_2017_lateAsymp"
base.806d = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_7_recBlock2001_2003_2008_2017"
base.807 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_8_recBlock2001_2005"
base.808 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_9_recBlock2001_2005_2017"
base.809 = SS_output(file.path(wd, model), covar=TRUE)

#Compare sensitivities
sens_names <- c("Base model","Block 2001", "Block 2001 - reweight", "Rec dome",
                "Block 2001, 2017", "Block 2001, 2017 fix2", "Block 2001, 2017 fix2lo",
                "Block 2001, 2017 lateAsymp", 
                "Block 2001, 03, 08, 17", "Block 2001, 2005","Block 2001, 05, 17")
sens_models  <- SSsummarize(list(base.710, base.804, base.805, base.7110,
                                 base.806b, base.806c, base.806d, 
                                 base.807, base.808, base.809))

SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.800_block_sensitivities_"),
                  subplot = c(1,2,3,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)


###############
#Combined adjustments
###############
#Add block for rec fleet starting in 2001
#Copy model 802 .dat file with model 804 other files
model = "8_1_0_debWV_block"
base.810 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.810)
SS_tune_comps(dir = file.path(wd, "8_1_0_debWV_block"), write = FALSE)


#Used in report
sens_names <- c("Base model","Block 2001", "Block 2001, 2017",
                "Block 2001, 03, 08, 17", "Block 2001, 2005", "Block 2001, 05, 17", 
                "Block 2001 with new data")
sens_models  <- SSsummarize(list(base.710, base.804, base.806c, 
                                 base.807, base.808, base.809,
                                 base.810))
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots', "ForReport"), 
                  legendloc = "bottomleft",
                  legendncol = 1,
                  filenameprefix = paste0("base.800_block_sensitivities_"),
                  subplot = c(1,2,11,12), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots', "ForReport"), 
                  legendloc = "topright",
                  legendncol = 1,
                  filenameprefix = paste0("base.800_block_sensitivities_"),
                  subplot = c(3,4), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots', "ForReport"), 
                  legendloc = "topleft",
                  legendncol = 1,
                  filenameprefix = paste0("base.800_block_sensitivities_"),
                  subplot = c(9), 
                  print = TRUE, 
                  pdf = FALSE)


################
#All comparisons
################
##Comparisons
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
model = "8_0_0_debWV"
base.800 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_3_debWV_comb_reweight"
base.803 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_4_recBlock2001"
base.804 = SS_output(file.path(wd, model), covar=TRUE)
model = "7_1_10_recDome"
base.7110 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

base.806b = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6c_recBlock2001_2017_fix2lo"
base.806c = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6d_recBlock2001_2017_lateAsymp"
base.806d = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_7_recBlock2001_2003_2008_2017"
base.807 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_8_recBlock2001_2005"
base.808 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_9_recBlock2001_2005_2017"
base.809 = SS_output(file.path(wd, model), covar=TRUE)

model = "8_1_0_debWV_block"
base.810 = SS_output(file.path(wd, model), covar=TRUE)


#Compare sensitivities
sens_names <- c("Base model", "DebWV", "DebWV - reweight",
                "Block 2001", "Block 2001 - reweight", "Rec dome",
                "Block 2001, 2017", "Block 2001, 2017 fix2", "Block 2001, 2017 fix2lo",
                "Block 2001, 2017 lateAsymp", 
                "Block 2001, 03, 08, 17", "Block 2001, 2005","Block 2001, 05, 17",
                "DebWV, Block 2001")
sens_models  <- SSsummarize(list(base.710, base.800, base.803, 
                                 base.804, base.805, base.7110,
                                 base.806b, base.806c, base.806d, 
                                 base.807, base.808, base.809,
                                 base.810))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots'), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("base.800_ALL_sensitivities_"),
                  subplot = c(1,2,3,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)


##For Report
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
model = "8_0_0_debWV"
base.800 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_3_debWV_comb_reweight"
base.803 = SS_output(file.path(wd, model), covar=TRUE)

model = "8_0_4_recBlock2001"
base.804 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6c_recBlock2001_2017_fix2lo"
base.806c = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_7_recBlock2001_2003_2008_2017"
base.807 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_8_recBlock2001_2005"
base.808 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_9_recBlock2001_2005_2017"
base.809 = SS_output(file.path(wd, model), covar=TRUE)

model = "8_1_0_debWV_block"
base.810 = SS_output(file.path(wd, model), covar=TRUE)


#Compare sensitivities
sens_names <- c("Base model", "DebWV", "DebWV reweight",
                "Block 2001", "Block 2001, 2017",
                "Block 2001, 03, 08, 17", "Block 2001, 2005", "Block 2001, 05, 17",
                "DebWV, Block 2001")
sens_models  <- SSsummarize(list(base.710, base.800, base.803, 
                                 base.804, base.806c,  
                                 base.807, base.808, base.809,
                                 base.810))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'sensitivities', 'postSSC_plots', "ForReport"), 
                  legendloc = "bottomleft", 
                  legendncol = 2,
                  filenameprefix = paste0("ALL_sensitivities_"),
                  subplot = c(1,2,3,4,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)




###############
#Blocking commercial selectivity as well as rec, both with dome-shaped
###############
#Add block for rec and com fleet in 2001 and 2017
#Copy model 806
model = "8_0_10_recComBlock2001_2017"
base.8010 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.8010)
SS_tune_comps(dir = file.path(wd, "8_0_10_recComBlock2001_2017"), write = FALSE)

#Commercial mean length seem to increase in 2009. Try blocking 2001 and 2009 for comm
#Keep rec block at 2001 and 2017
#Copy model 8010
model = "8_0_11_ComBlock2001_2009"
base.8011 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.8011)
SS_tune_comps(dir = file.path(wd, "8_0_11_ComBlock2001_2009"), write = FALSE)


###########
#Additional explorations based on mean length of commercial data and copper treatment
  #Commercial mean length seem to increase in 2018. Try blocking 2001 and 2017 for comm
  #Copy model 8010
  model = "8_0_12_recComBlock2001_2017or2018"
  base.8012 = SS_output(file.path(wd, model), covar=TRUE)
  SS_plots(base.8012)
  SS_tune_comps(dir = file.path(wd, "8_0_12_recComBlock2001_2017or2018"), write = FALSE)
  
  #Copper blocks at 2003, so try this for comm, without blocking at 2001
  #Copy model 8012
  model = "8_0_13_recComBlock2001_2017or2003"
  base.8013 = SS_output(file.path(wd, model), covar=TRUE)
  SS_plots(base.8013)
  SS_tune_comps(dir = file.path(wd, "8_0_13_recComBlock2001_2017or2003"), write = FALSE)

  #2017 dome is shifted far right, and increases Dead_Catch_SPR. What is simply block at 2001
  #Copy model 8013
  model = "8_0_14_recComBlock2001_2017orNot"
  base.8014 = SS_output(file.path(wd, model), covar=TRUE)
  SS_plots(base.8014)
  SS_tune_comps(dir = file.path(wd, "8_0_14_recComBlock2001_2017orNot"), write = FALSE)
###########
  
##For Report
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)

model = "8_0_4_recBlock2001"
base.804 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6c_recBlock2001_2017_fix2lo"
base.806c = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_7_recBlock2001_2003_2008_2017"
base.807 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_8_recBlock2001_2005"
base.808 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_9_recBlock2001_2005_2017"
base.809 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_1_0_debWV_block"
base.810 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_10_recComBlock2001_2017"
base.8010 = SS_output(file.path(wd, model), covar=TRUE)


sens_names <- c("Base model","Block 2001", "Block 2001, 2017",
                "Block 2001, 03, 08, 17", "Block 2001, 2005", "Block 2001, 05, 17", 
                "Block 2001 with new data", "RecCom Block 2001, 2017")
sens_models  <- SSsummarize(list(base.710, base.804, base.806c, 
                                 base.807, base.808, base.809,
                                 base.810, base.8010))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'postSSC_plots', "ForReport"), 
                  legendloc = "bottomleft", 
                  legendncol = 1,
                  col = c(rich.colors.short(8)[-1][1:7],"cyan"),
                  filenameprefix = paste0("All_comBlock_sensitivities_"),
                  subplot = c(1,2,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'postSSC_plots', "ForReport"), 
                  legendloc = "topright", 
                  legendncol = 1,
                  col = c(rich.colors.short(8)[-1][1:7],"cyan"),
                  filenameprefix = paste0("All_comBlock_sensitivities_"),
                  subplot = c(3,4), 
                  print = TRUE, 
                  pdf = FALSE)


##############
##Selectivity plots
##############

fleets = c("Comm", "Rec")

base_selex <- SSplotSelex(base.710, fleets = 2, fleetnames = fleets, subplot = 1)
base_selex$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[2]

selex_804 <- SSplotSelex(base.804, fleets = 2, subplot = 1, year = c(2000,2020))
selex_804$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[3]
selex_804$infotable$pch <- 2

selex_810 <- SSplotSelex(base.810, fleets = 2, subplot = 1, year = c(2000,2020))
selex_810$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[8]
selex_810$infotable$pch <- 7

selex_806c <- SSplotSelex(base.806c, fleets = 2, subplot = 1, year = c(2000,2016,2020))
selex_806c$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[4]
selex_806c$infotable$pch <- 3

selex_807 <- SSplotSelex(base.807, fleets = 2, subplot = 1, year = c(2000,2002,2007,2016,2020))
selex_807$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[5]
selex_807$infotable$pch <- 4

selex_808 <- SSplotSelex(base.808, fleets = 2, subplot = 1, year = c(2000,2004,2020))
selex_808$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[1]
selex_808$infotable$pch <- 5

selex_809 <- SSplotSelex(base.809, fleets = 2, subplot = 1, year = c(2000,2004,2016,2020))
selex_809$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[7]
selex_809$infotable$pch <- 6


##If combining all in one add this and exclude the png and dev.off() below
png(file = file.path(wd, "sensitivities", "postSSC_plots", "ForReport",
                     "Selex_together.png"), width = 8, height = 10, units = "in", res = 300)
par(mfrow = c(3,2), mai = c(0.5,0.5,0.5,0))

#Compare Block 2001, Block 2001 with new data, Base
#png(file = file.path(wd, "sensitivities", "postSSC_plots", 
#                     "Selex_block2001-debWV.png"), width = 7, height = 5, units = "in", res = 300)
SSplotSelex(base.710, fleets = 2, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.804, fleets = 2, infotable = selex_804$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2020), add = TRUE)
SSplotSelex(base.810, fleets = 2, infotable = selex_810$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2020), add = TRUE)
legend("bottomright", c("Block 2001 new data 1916-2000", "Block 2001 new data 2001-2020", 
                        "Block 2001 1916-2000", "Block 2001 2001-2020", 
                        "Base 1916-2020"), lty = c(1,2,1,2, 1), 
       col = c(selex_810$infotable$col, selex_804$infotable$col, base_selex$infotable$col),
       pch = c(selex_810$infotable$pch, selex_804$infotable$pch, base_selex$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("Block 2001, Block 2001 new data", side = 3, line = 0.5, font = 2)
grid()
#dev.off()

plot(1, type = "n", ylab = NA, xlab = NA, xaxt = "n", yaxt = "n", bty = "n")


#Compare Block 2001 2017, Base
#png(file = file.path(wd, "sensitivities", "postSSC_plots", 
#                     "Selex_block2001-17.png"), width = 7, height = 5, units = "in", res = 300)
SSplotSelex(base.710, fleets = 2, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.806c, fleets = 2, infotable = selex_806c$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2016, 2020), add = TRUE)
legend("left", c("1916-2000", "2001-2016", "2017-2020",
                 "Base 1916-2020"), lty = c(1,2,3, 1), 
       col = c(selex_806c$infotable$col, base_selex$infotable$col),
       pch = c(selex_806c$infotable$pch, base_selex$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("Block 2001, 2017", side = 3, line = 0.5, font = 2)
grid()
#dev.off()

#Compare Block 2001 2003 2008 2017, Base
#png(file = file.path(wd, "sensitivities", "postSSC_plots", 
#                     "Selex_block2001-03-08-17.png"), width = 7, height = 5, units = "in", res = 300)
SSplotSelex(base.710, fleets = 2, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.807, fleets = 2, infotable = selex_807$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2002, 2007, 2016, 2020), add = TRUE)
legend("left", c("1916-2000", "2001-2002", 
                 "2003-2007", "2008-2016",
                 "2017-2020",
                 "Base 1916-2020"), lty = c(1,2,3,4,5,1), 
       col = c(selex_807$infotable$col, base_selex$infotable$col),
       pch = c(selex_807$infotable$pch, base_selex$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("Block 2001, 03, 08, 17", side = 3, line = 0.5, font = 2)
grid()
#dev.off()

#Compare Block 2001 2005, Base
#png(file = file.path(wd, "sensitivities", "postSSC_plots", 
#                     "Selex_block2001-05.png"), width = 7, height = 5, units = "in", res = 300)
SSplotSelex(base.710, fleets = 2, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.808, fleets = 2, infotable = selex_808$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2004, 2020), add = TRUE)
legend("left", c("1916-2000", "2001-2004", 
                 "2005-2020",
                 "Base 1916-2020"), lty = c(1,2,3,1), 
       col = c(selex_808$infotable$col, base_selex$infotable$col),
       pch = c(selex_808$infotable$pch, base_selex$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("Block 2001, 05", side = 3, line = 0.5, font = 2)
grid()
#dev.off()

#Compare Block 2001 2005 2017, Base
#png(file = file.path(wd, "sensitivities", "postSSC_plots", 
#                     "Selex_block2001-05-17.png"), width = 7, height = 5, units = "in", res = 300)
SSplotSelex(base.710, fleets = 2, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.809, fleets = 2, infotable = selex_809$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2004, 2016, 2020), add = TRUE)
legend("left", c("1916-2000", "2001-2004", 
                 "2005-2016", "2017-2020",
                 "Base 1916-2020"), lty = c(1,2,3,4,1), 
       col = c(selex_809$infotable$col, base_selex$infotable$col),
       pch = c(selex_809$infotable$pch, base_selex$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("Block 2001, 05, 17", side = 3, line = 0.5, font = 2)
grid()
dev.off()



#Compare Commercial Selectivity
base_selex <- SSplotSelex(base.710, fleets = 1, subplot = 1)
base_selex$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[2]

selex_804 <- SSplotSelex(base.804, fleets = 1, subplot = 1)
selex_804$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[3]
selex_804$infotable$pch <- 2

selex_810 <- SSplotSelex(base.810, fleets = 1, subplot = 1)
selex_810$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[8]
selex_810$infotable$pch <- 7

selex_806c <- SSplotSelex(base.806c, fleets = 1, subplot = 1)
selex_806c$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[4]
selex_806c$infotable$pch <- 3

selex_807 <- SSplotSelex(base.807, fleets = 1, subplot = 1)
selex_807$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[5]
selex_807$infotable$pch <- 4

selex_808 <- SSplotSelex(base.808, fleets = 1, subplot = 1)
selex_808$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[6]
selex_808$infotable$pch <- 5

selex_809 <- SSplotSelex(base.809, fleets = 1, subplot = 1)
selex_809$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[7]
selex_809$infotable$pch <- 6


png(file = file.path(wd, "sensitivities", "postSSC_plots", 
                     "Selex_Commercial.png"), width = 7, height = 5, units = "in", res = 300)
SSplotSelex(base.710, fleets = 1, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.804, fleets = 1, infotable = selex_804$infotable,
            subplot = 1, legendloc = NA, add = TRUE)
SSplotSelex(base.810, fleets = 1, infotable = selex_810$infotable,
            subplot = 1, legendloc = NA, add = TRUE)
SSplotSelex(base.806c, fleets = 1, infotable = selex_806c$infotable,
            subplot = 1, legendloc = NA, add = TRUE)
SSplotSelex(base.807, fleets = 1, infotable = selex_807$infotable,
            subplot = 1, legendloc = NA, add = TRUE)
SSplotSelex(base.808, fleets = 1, infotable = selex_808$infotable,
            subplot = 1, legendloc = NA, add = TRUE)
SSplotSelex(base.809, fleets = 1, infotable = selex_809$infotable,
            subplot = 1, legendloc = NA, add = TRUE)
legend("left", c("Base", "Block 2001", "Block 2001, 2017", 
                        "Block 2001, 2003, 2008, 2017", "Block 2001, 2005", "Block 2001, 2005, 2017",
                        "Block 2001 new data"),   
       col = rich.colors.short(n = 8, alpha = 0.75)[c(2:8)],
       lty = 1, pch = 1:7, bty = "n", lwd = 2, seg.len = 5)
mtext("Commercial Selectivity", side = 3, line = 0.5, font = 2)
grid()
dev.off()



##############
##Selectivity plots for recCom block 2001, 2017
##############
#Recreational
base_selex_rec <- SSplotSelex(base.710, fleets = 2, fleetnames = fleets, subplot = 1)
base_selex_rec$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[2]

selex_8010_rec <- SSplotSelex(base.8010, fleets = 2, subplot = 1, year = c(2000,2016,2020))
selex_8010_rec$infotable$col <- "cyan"
selex_8010_rec$infotable$pch <- 1

#Commercial
base_selex_com <- SSplotSelex(base.710, fleets = 1, subplot = 1)
base_selex_com$infotable$col <- rich.colors.short(n = 8, alpha = 0.75)[2]

selex_8010_com <- SSplotSelex(base.8010, fleets = 1, subplot = 1, year = c(2000,2016,2020))
selex_8010_com$infotable$col <- "cyan"
selex_8010_com$infotable$pch <- 1


png(file = file.path(wd, "postSSC_plots", "ForReport",
                     "comBlock_Selex.png"), width = 8, height = 10, units = "in", res = 300)
par(mfrow = c(2,1), mai = c(0.5,0.5,0.5,0))

SSplotSelex(base.710, fleets = 2, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.8010, fleets = 2, infotable = selex_8010_rec$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2016, 2020), add = TRUE)
legend("left", c("1916-2000", "2001-2016", "2017-2020",
                 "Base 1916-2020"), lty = c(1,2,3, 1), 
       col = c(selex_8010_rec$infotable$col, base_selex_rec$infotable$col),
       pch = c(selex_8010_rec$infotable$pch, base_selex_rec$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("RecCom Block 2001, 2017 - Recreational", side = 3, line = 0.5, font = 2)
grid()

SSplotSelex(base.710, fleets = 1, infotable = base_selex$infotable,
            subplot = 1, legendloc = NA, showmain=FALSE)
SSplotSelex(base.8010, fleets = 1, infotable = selex_8010_com$infotable,
            subplot = 1, legendloc = NA, year = c(2000, 2016, 2020), add = TRUE)
legend("left", c("1916-2000", "2001-2016", "2017-2020",
                 "Base 1916-2020"), lty = c(1,2,3, 1), 
       col = c(selex_8010_com$infotable$col, base_selex_com$infotable$col),
       pch = c(selex_8010_com$infotable$pch, base_selex_com$infotable$pch), 
       bty = "n", lwd = 2, seg.len = 5)
mtext("RecCom Block 2001, 2017 - Commercial", side = 3, line = 0.5, font = 2)
grid()
dev.off()


# ###Compare fits to mean length - Used a powerpoint figure and copied and pasted individual runs' plots
# ###Powerpoint is C:\Users\Brian.Langseth\Desktop\ca\postSSC_plots\Mean_length_Pearson_combination.ppt
# 
# library(png)
# library(grid)
# library(gridExtra)
# 
# plot1 <- readPNG(file.path(wd,"7_1_0_base","plots","comp_lenfit_residsflt2mkt0_page2.png"))
# plot2 <- readPNG(file.path(wd,"8_0_4_recBlock2001","plots","comp_lenfit_residsflt2mkt0_page2.png"))
# plot3 <- readPNG(file.path(wd,"8_0_6c_recBlock2001_2017_fix2lo","plots","comp_lenfit_residsflt2mkt0_page2.png"))
# plot4 <- readPNG(file.path(wd,"8_0_7_recBlock2001_2003_2008_2017","plots","comp_lenfit_residsflt2mkt0_page2.png"))
# plot5 <- readPNG(file.path(wd,"8_0_8_recBlock2001_2005","plots","comp_lenfit_residsflt2mkt0_page2.png"))
# plot6 <- readPNG(file.path(wd,"8_0_9_recBlock2001_2005_2017","plots","comp_lenfit_residsflt2mkt0_page2.png"))
# 
# png(file = file.path(wd, "postSSC_plots", "ForReport",
#                      "Block_compareResids.png"), width = 7, height = 5, units = "in", res = 300)
# grid.arrange(rasterGrob(plot1,width = unit(3,"in"), height=unit(2,"in")),
#              rasterGrob(plot2,width = unit(3,"in"), height=unit(2,"in")),
#              rasterGrob(plot3,width = unit(3,"in"), height=unit(2,"in")),
#              rasterGrob(plot4,width = unit(3,"in"), height=unit(2,"in")),
#              rasterGrob(plot5,width = unit(3,"in"), height=unit(2,"in")),
#              rasterGrob(plot6,width = unit(3,"in"), height=unit(2,"in")),
#              ncol=2,nrow=3, widths = c(3,3), heights = c(2,2,2))
# dev.off()
# 
# par(mfrow = c(3,2), mai = c(0.5,0.5,0.5,0))
# SSplotComps(base.710,subplots=24,fleets=2)
# SSplotComps(base.804,subplots=24,fleets=2)
# SSplotComps(base.806c,subplots=24,fleets=2)
# SSplotComps(base.807,subplots=24,fleets=2)
# SSplotComps(base.808,subplots=24,fleets=2)
# SSplotComps(base.809,subplots=24,fleets=2)
# 
# 
# 
# SSplotComps(base.710,subplots=8,fleets=2)
# SSplotComps(base.804,subplots=8,fleets=2)
# SSplotComps(base.806c,subplots=8,fleets=2)
# SSplotComps(base.807,subplots=8,fleets=2)
# SSplotComps(base.808,subplots=8,fleets=2)
# SSplotComps(base.809,subplots=8,fleets=2)



###################################################################################################
# Create a Table of Results
library(sa4ss)

#Switch up order to put debWV models together
sens_names <- c("Base model", "DebWV", "DebWV reweight","DebWV, Block 2001",
                "Block 2001", "Block 2001, 2017",
                "Block 2001, 03, 08, 17", "Block 2001, 2005", "Block 2001, 05, 17",
                "RecCom Block 2001, 2017")
sens_models  <- SSsummarize(list(base.710, base.800, base.803, base.810,
                                 base.804, base.806c,  
                                 base.807, base.808, base.809,
                                 base.8010))

n = length(sens_names)

AIC = 2 * as.numeric(colSums(sens_models$parphases>0,na.rm=TRUE)[1:n]) + 2 * as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "TOTAL",1:n])

sens_table = rbind(
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "TOTAL",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Length_comp",1:n]),
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Recruitment",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Parm_softbounds",1:n]),
  as.numeric(colSums(sens_models$parphases>0,na.rm=TRUE)[1:n]),
  AIC,
  c((AIC-AIC[1])[1],NA,NA,NA,(AIC-AIC[1])[5:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "SR_LN(R0)", 1:n]), 
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_Virgin", 1:n]),
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_2021", 1:n]),
  as.numeric(sens_models$Bratio[sens_models$Bratio$Label == "Bratio_2021", 1:n]), 
  as.numeric(sens_models$quants[sens_models$quants$Label == "Dead_Catch_SPR", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_ascend_se_CA_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Recreational(2)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_ascend_se_CA_Recreational(2)", 1:n]))  


sens_table = as.data.frame(sens_table)
colnames(sens_table) = sens_names
rownames(sens_table) = c("Total Likelihood",
                         "Length Likelihood",
                         "Recruitment Likelihood",
                         "Parameter Bounds Likelihood",
                         "N parms",
                         "AIC",
                         "delta AIC",
                         "ln(R0)",
                         "SB Virgin",
                         "SB 2021",
                         "Fraction Unfished 2021",
                         "Total Yield at SPR 50",
                         "Peak commercial selex",
                         "Ascend se commercial selex",
                         "Peak recreational selex 2020",
                         "Ascend se recreational selex 2020")

write.csv(sens_table, file = file.path(wd, 'postSSC_plots', 'ForReport', paste0("base.800_withComBlock_sensitivities.csv")))

t = table_format(x = sens_table,
                 caption = 'Parameter values and derived quantities from requested explorations for adding CPFV central California length data, and blocking of recreational and commercial selectivity, and the adopted base model.',
                 label = 'sens-table-withComBlock',
                 longtable = TRUE,
                 font_size = 9,
                 digits = 2,
                 landscape = TRUE,
                 col_names = sens_names)

kableExtra::save_kable(t, file = file.path(wd, "postSSC_plots", "ForReport", "sensitivities_withComBlock.tex"))


####
#Extra - post Aug 17 GFSC meeting exploratory runs
####
#Add 2001-only run for both rec and comm
#Copy model 8014
model = "8_0_15_recComBlock2001"
base.8015 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.8015)
SS_tune_comps(dir = file.path(wd, "8_0_15_recComBlock2001"), write = FALSE)

#Add 2001-only run for both rec and comm but keep commercial asymptotic
#Copy model 8014
model = "8_0_16_recComBlock2001_RecDomeOnly"
base.8016 = SS_output(file.path(wd, model), covar=TRUE)
SS_plots(base.8016)
SS_tune_comps(dir = file.path(wd, "8_0_16_recComBlock2001_RecDomeOnly"), write = FALSE)




###########################################
#Add comparison plot of MopUp sensitivity (RecCom block at 2001 only) with earlier blocking sensitivities
###########################################
##For Report
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)

model = "8_0_4_recBlock2001"
base.804 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_6c_recBlock2001_2017_fix2lo"
base.806c = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_7_recBlock2001_2003_2008_2017"
base.807 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_8_recBlock2001_2005"
base.808 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_9_recBlock2001_2005_2017"
base.809 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_1_0_debWV_block"
base.810 = SS_output(file.path(wd, model), covar=TRUE)
model = "8_0_10_recComBlock2001_2017"
base.8010 = SS_output(file.path(wd, model), covar=TRUE)

model = "9_4_0_recComBlock2001"
base.940 = SS_output(file.path(wd, "rebuilder", model), covar=TRUE)

sens_names <- c("Base model","Block 2001", "Block 2001, 2017",
                "Block 2001, 03, 08, 17", "Block 2001, 2005", "Block 2001, 05, 17", 
                "Block 2001 with new data", "RecCom Block 2001, 2017", "RecCom Block 2001")
sens_models  <- SSsummarize(list(base.710, base.804, base.806c, 
                                 base.807, base.808, base.809,
                                 base.810, base.8010, base.940))

#Plot each individually for control over legend location
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'rebuilder', 'write_up', "figures"), 
                  legendloc = "bottomleft", 
                  legendncol = 1,
                  #col = c(rich.colors.short(8)[-1][1:7],"cyan"),
                  filenameprefix = paste0("All_comBlock_sensitivities_"),
                  subplot = c(1,2,9,10,11,12), 
                  print = TRUE, 
                  pdf = FALSE)
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, 'rebuilder', 'write_up', "figures"), 
                  legendloc = "topright", 
                  legendncol = 1,
                  #col = c(rich.colors.short(8)[-1][1:7],"cyan"),
                  filenameprefix = paste0("All_comBlock_sensitivities_"),
                  subplot = c(3,4), 
                  print = TRUE, 
                  pdf = FALSE)

###
#Table with fleet likelihoods distinguished
###
n = length(sens_names)

AIC = 2 * as.numeric(colSums(sens_models$parphases>0,na.rm=TRUE)[1:n]) + 2 * as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "TOTAL",1:n])

sens_table = rbind(
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "TOTAL",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Length_comp",1:n]),
  as.numeric(sens_models$likelihoods_by_fleet[sens_models$likelihoods_by_fleet$Label == "Length_like","CA_Commercial"]),
  as.numeric(sens_models$likelihoods_by_fleet[sens_models$likelihoods_by_fleet$Label == "Length_like","CA_Recreational"]),
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Recruitment",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Parm_softbounds",1:n]),
  as.numeric(colSums(sens_models$parphases>0,na.rm=TRUE)[1:n]),
  AIC,
  c((AIC-AIC[1])[1],NA,NA,NA,(AIC-AIC[1])[5:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "SR_LN(R0)", 1:n]), 
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_Virgin", 1:n]),
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_2021", 1:n]),
  as.numeric(sens_models$Bratio[sens_models$Bratio$Label == "Bratio_2021", 1:n]), 
  as.numeric(sens_models$quants[sens_models$quants$Label == "Dead_Catch_SPR", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_ascend_se_CA_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Recreational(2)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_ascend_se_CA_Recreational(2)", 1:n]))  


sens_table = as.data.frame(sens_table)
colnames(sens_table) = sens_names
rownames(sens_table) = c("Total Likelihood",
                         "Length Likelihood",
                         "Length Comm Likelihood",
                         "Length Rec Likelihood",
                         "Recruitment Likelihood",
                         "Parameter Bounds Likelihood",
                         "N parms",
                         "AIC",
                         "delta AIC",
                         "ln(R0)",
                         "SB Virgin",
                         "SB 2021",
                         "Fraction Unfished 2021",
                         "Total Yield at SPR 50",
                         "Peak commercial selex",
                         "Ascend se commercial selex",
                         "Peak recreational selex 2020",
                         "Ascend se recreational selex 2020")

write.csv(sens_table, file = file.path(wd, 'rebuilder', 'write_up', "tables", paste0("AllBlock_sensitivities_reccomLike.csv")))


