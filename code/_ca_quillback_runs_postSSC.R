# Quillback California Model Runs post SSC (post June)
# based on request document provided by John DeVore

#devtools::install_github("r4ss/r4ss")
library(r4ss)

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

#Plot each individually for control over legend location
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



##############
##Selectivity plots
##############
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





###################################################################################################
# Create a Table of Results
library(sa4ss)

n = length(sens_names)

sens_table = rbind(
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "TOTAL",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Length_comp",1:n]),
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Recruitment",1:n]), 
  as.numeric(sens_models$likelihoods[sens_models$likelihoods$Label == "Parm_softbounds",1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "SR_LN(R0)", 1:n]), 
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_Virgin", 1:n]),
  as.numeric(sens_models$SpawnBio[sens_models$SpawnBio$Label == "SSB_2021", 1:n]),
  as.numeric(sens_models$Bratio[sens_models$Bratio$Label == "Bratio_2021", 1:n]), 
  as.numeric(sens_models$quants[sens_models$quants$Label == "Dead_Catch_SPR", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Commercial(1)", 1:n]),
  as.numeric(sens_models$pars[sens_models$pars$Label == "Size_DblN_peak_CA_Recreational(2)", 1:n]) )  

sens_table = as.data.frame(sens_table)
colnames(sens_table) = sens_names
rownames(sens_table) = c("Total Likelihood",
                         "Length Likelihood",
                         "Recruitment Likelihood",
                         "Parameter Bounds Likelihood",
                         "log(R0)",
                         "SB Virgin",
                         "SB 2020",
                         "Fraction Unfished 2021",
                         "Total Yield at SPR 50",
                         "Peak recreational selex",
                         "Peak commercial selex")

write.csv(sens_table, file = file.path(wd, "sensitivities", 'postSSC_plots', "ForReport", paste0("base.800_sensitivities.csv")))

t = table_format(x = sens_table,
                 caption = 'Requested explorations with additioanl data and additional model runs, alongside the adopted base model.',
                 label = 'sens-table',
                 longtable = TRUE,
                 font_size = 9,
                 digits = 2,
                 landscape = TRUE,
                 col_names = sens_names)

kableExtra::save_kable(t, file = file.path(wd, "sensitivities", "postSSC_plots", "ForReport", "sensitivities.tex"))




