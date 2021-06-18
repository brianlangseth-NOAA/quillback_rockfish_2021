####
#
#Script for SSC presentation figures
#
####

library(r4ss)

#####################################
#Stock Size and Status
#####################################

model = "10_0_0_base"
wa = SS_output(file.path("C:/Users/Brian.Langseth/Desktop/wa", model),covar=TRUE)

model = "7_1_0_base"
or = SS_output(file.path("C:/Users/Brian.Langseth/Desktop/or", model),covar=TRUE)

model = "7_1_0_base"
ca = SS_output(file.path("C:/Users/Brian.Langseth/Desktop/ca", model),covar=TRUE)

base_names <- c("WA base model", "OR base model", "CA base model")
base_models  <- SSsummarize(list(wa, or, ca))

#Plot each individually for control over legend location
SSplotComparisons(base_models, endyrvec = 2021, 
                  legendlabels = base_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path("L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\presentations"), 
                  legendloc = "topright", 
                  legendncol = 1,
                  col = c("green3", "blue", "red"),
                  filenameprefix = paste0("base_comparisons"),
                  subplots = c(1,2,3,4,9,10,12), 
                  print = TRUE, 
                  pdf = FALSE)



#####################################
##Length samples
#####################################
loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"
ca_rec_len <- read.csv(file.path(loc, "forSS", "ca_rec_Samples.csv"))
or_rec_len <- read.csv(file.path(loc, "forSS", "or_rec_Samples.csv"))
wa_rec_len <- read.csv(file.path(loc, "forSS", "wa_rec_Samples.csv"))

ca_com_len <- read.csv(file.path(loc, "forSS", "CA_Samples_Feb2021.csv"))
or_com_len <- read.csv(file.path(loc, "forSS", "OR_Samples_Feb2021.csv"))
wa_com_len <- read.csv(file.path(loc, "forSS", "WA_Samples_Feb2021.csv"))

ca_com_len$com_total = rowSums(ca_com_len[,c("N_Fish_Female","N_Fish_Male","N_Fish_Unsexed")])
or_com_len$com_total = rowSums(or_com_len[,c("N_Fish_Female","N_Fish_Male","N_Fish_Unsexed")])
wa_com_len$com_total = rowSums(wa_com_len[,c("N_Fish_Female","N_Fish_Male","N_Fish_Unsexed")])

ca_len = data.frame(Year = c(ca_com_len$Year, ca_rec_len$Year),
                     Source = c(rep("Commercial", nrow(ca_com_len)), 
                                rep("Recreational", nrow(ca_rec_len))),
                     Number = c(ca_com_len$com_total, ca_rec_len$All_Fish))
or_len = data.frame(Year = c(or_com_len$Year, or_rec_len$Year),
                    Source = c(rep("Commercial", nrow(or_com_len)), 
                               rep("Recreational", nrow(or_rec_len))),
                    Number = c(or_com_len$com_total, or_rec_len$All_Fish))
wa_len = data.frame(Year = c(wa_com_len$Year, wa_rec_len$Year),
                    Source = c(rep("Commercial", nrow(wa_com_len)), 
                               rep("Recreational", nrow(wa_rec_len))),
                    Number = c(wa_com_len$com_total, wa_rec_len$All_Fish))

ca_len$Source = factor(ca_len$Source, levels = c( "Recreational", "Commercial"))
or_len$Source = factor(or_len$Source, levels = c( "Recreational", "Commercial"))
wa_len$Source = factor(wa_len$Source, levels = c( "Recreational", "Commercial"))

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/presentations"
pngfun(wd = file.path(loc), file = "Lengths_by_Source_CA.png", w = 9, h = 7, pt = 12)
ggplot(ca_len, aes(fill = Source, y = Number, x = Year)) + 
  geom_bar(position="stack", stat="identity")+
  coord_cartesian(ylim = c(0, 1000)) + 
  theme(axis.text.y = element_text(size = 13, color = 1),
        axis.text.x = element_text(size = 13, color = 1), 
        legend.text.align = 0,
        axis.title.x = element_text(size = 18),
        axis.title.y = element_text(size = 18),
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        panel.grid.minor = element_blank())  +
  xlab("Year") + ylab("Length Samples (#)")
dev.off()


pngfun(wd = file.path(loc), file = "Lengths_by_Source_OR.png", w = 9, h = 7, pt = 12)
ggplot(or_len, aes(fill = Source, y = Number, x = Year)) + 
  geom_bar(position="stack", stat="identity")+
  coord_cartesian(ylim = c(0, 2000)) + 
  theme(axis.text.y = element_text(size = 13, color = 1),
        axis.text.x = element_text(size = 13, color = 1), 
        legend.text.align = 0,
        axis.title.x = element_text(size = 18),
        axis.title.y = element_text(size = 18),
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        panel.grid.minor = element_blank())  +
  xlab("Year") + ylab("Length Samples (#)")
dev.off()

pngfun(wd = file.path(loc), file = "Lengths_by_Source_WA.png", w = 9, h = 7, pt = 12)
ggplot(wa_len, aes(fill = Source, y = Number, x = Year)) + 
  geom_bar(position="stack", stat="identity")+
  scale_fill_manual(values=c("#00BFC4","#F8766D")) +
  coord_cartesian(ylim = c(0, 500)) + 
  theme(axis.text.y = element_text(size = 13, color = 1),
        axis.text.x = element_text(size = 13, color = 1), 
        legend.text.align = 0,
        axis.title.x = element_text(size = 18),
        axis.title.y = element_text(size = 18),
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        panel.grid.minor = element_blank())  +
  xlab("Year") + ylab("Length Samples (#)")
dev.off()

ca_len$Area = "California"
or_len$Area = "Oregon"
wa_len$Area = "Washington"

all_len = rbind(ca_len, 
                or_len, 
                wa_len)

#all_len$Area = factor(all_len$Area, 
#                      levels = c("North of Point Conception",
#                                 "Oregon", "Washington"))

pngfun(wd = file.path(loc), file = "Lengths_by_Source_All.png", w = 14, h = 7, pt = 12)
ggplot(all_len, aes(fill = Source, y = Number, x = Year)) + 
  geom_bar(position="stack", stat="identity") +
  facet_wrap(facets = c("Area")) +
  coord_cartesian(ylim = c(0, 2000)) + 
  theme(axis.text.y = element_text(size = 13, color = 1),
        axis.text.x = element_text(size = 13, color = 1), 
        legend.text.align = 0,
        strip.text = element_text(size = 18), 
        axis.title.x = element_text(size = 18),
        axis.title.y = element_text(size = 18),
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 18),
        panel.grid.minor = element_blank())  +
  xlab("Year") + ylab("Length Samples (#)")
dev.off()

##################################################################################
#Selectivites
#################################################################################

###
#WASHINGTON
###
wd = "C:/Users/Brian.Langseth/Desktop/wa"

model = "10_0_0_base"
base.1000 = SS_output(file.path(wd, model),covar=TRUE)

model = "10_1_1_recDevs"
base.1011 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

model = "10_1_1b_recDevs_reweight"
base.1011b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

model = "10_1_1b_recDevs_reweight"
base.1011b = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

model = "10_1_6_estL2CV"
base.1016 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

model = "10_1_4_estlinf"
base.1014 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

model = "10_1_7_estM"
base.1017 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)

model = "10_1_14_altphase"
base.10114 = SS_output(file.path(wd, "sensitivities", model),covar=TRUE)

model = "10_1_3_dw_DM"
base.1013 = SS_output(file.path(wd, "sensitivities", model), covar=TRUE)


sens_names <- c("Base model","Rec devs","Rec devs reweight")
sens_models  <- SSsummarize(list(base.1000, base.1011, base.1011b))
  
SSplotComparisons(sens_models, endyrvec = 2021, 
                  legendlabels = sens_names, 
                  ylimAdj = 1.10,
                  plotdir = file.path(wd, "plots"), 
                  legendloc = "topright", 
                  legendncol = 2,
                  filenameprefix = paste0("rec_SSCpresentation_"),
                  subplot = c(2,4,9,11),
                  col = c("blue","orange","green3"),
                  print = TRUE, 
                  pdf = FALSE)

#Plot selectivities for recruitment estimation
png(
  filename = file.path(wd, "plots","rec_SSCpresentation_selex.png"),
  width = 6.5,
  height = 5,
  units = "in",
  res = 300,
  pointsize = 10
)
plot(unlist(base.1000$sizeselex[base.1000$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
     type = "b", lty = 1, lwd = 2, col = "blue", pch = 1, ylab = "Selectivity", xlab = "Length (cm)",
     main = "Recreational Fleet")
lines(unlist(base.1011$sizeselex[base.1011$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
     type = "b", lty = 1, lwd = 2, col = "orange", pch = 2)
lines(unlist(base.1011b$sizeselex[base.1011b$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = "green3", pch = 3)
legend("topleft", c(sens_names), col = c("blue","orange","green3"), lty = 1, lwd = 2, bty = "n", pch = c(1,2,3))
abline(v=44.07,col="blue",lty=2)
abline(v=46.25,col="orange",lty=2)
abline(v=47.655,col="green3",lty=2)
dev.off()


#Plot selectivities for SSS selectivity comparison
png(
  filename = file.path(wd, "plots","SSCpresentation_SSSselex.png"),
  width = 6.5,
  height = 5,
  units = "in",
  res = 300,
  pointsize = 10
)
xx = seq(0,60,2)
SSSyy = c(0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.001,0.001,0.003,0.007,0.015,0.029,0.054,0.095,0.158,0.247,0.362,0.500,0.649,0.792,0.909,0.982,1.000,1.000,1.000,1.000,1.000,1.000,1.000,1.000)
plot(SSSyy, x = xx,
     type = "l", lty = 1, lwd = 2, col = "red", pch = 1, ylab = "Selectivity", xlab = "Length (cm)")
lines(unlist(base.1000$sizeselex[base.1000$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "l", lty = 1, lwd = 2, col = "blue", pch = 1)
lines(unlist(base.1000$sizeselex[base.1000$sizeselex$Label=="2020_2_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "l", lty = 2, lwd = 2, col = "blue", pch = 1)
legend("topleft", c("SSS for rec and com", "Base for rec", "Base for com"), col = c("red","blue","blue"), lty = c(1,1,2), lwd = 2, bty = "n")
dev.off()

#Select sensitivites selectivities for Rec only
#Fix color for color-blind
png(
  filename = file.path(wd, "plots","CV2_SSCpresentation_selex.png"),
  width = 6.5,
  height = 5,
  units = "in",
  res = 300,
  pointsize = 10
)
plot(unlist(base.1000$sizeselex[base.1000$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
     type = "b", lty = 1, lwd = 2, col = rich.colors.short(7)[1], pch = 1, ylab = "Selectivity", xlab = "Length (cm)",
     main = "Recreational Fleet")
lines(unlist(base.1016$sizeselex[base.1016$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(7)[6], pch = 6)
legend("topleft", c("Base model", "Est CVL2"), 
       col = c(rich.colors.short(7)[1],rich.colors.short(7)[6]), 
       pch = c(1,6), lty = 1, lwd = 2, bty = "n")
dev.off()

png(
  filename = file.path(wd, "plots","CV2_M_SSCpresentation_selex.png"),
  width = 6.5,
  height = 5,
  units = "in",
  res = 300,
  pointsize = 10
)
plot(unlist(base.1000$sizeselex[base.1000$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
     type = "b", lty = 1, lwd = 2, col = rich.colors.short(7)[1], pch = 1, ylab = "Selectivity", xlab = "Length (cm)",
     main = "Recreational Fleet")
lines(unlist(base.1016$sizeselex[base.1016$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(7)[6], pch = 6)
lines(unlist(base.1017$sizeselex[base.1017$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(7)[7], pch = 7)
legend("topleft", c("Base model", "Est CVL2", "Est M"), 
       col = c(rich.colors.short(7)[1],rich.colors.short(7)[6],rich.colors.short(7)[7]), 
       pch = c(1,7,8), lty = 1, lwd = 2, bty = "n")
dev.off()

#Comparing all select sensitivities
png(
  filename = file.path(wd, "plots","Select_SSCpresentation_selex.png"),
  width = 6.5,
  height = 5,
  units = "in",
  res = 300,
  pointsize = 10
)
plot(unlist(base.1000$sizeselex[base.1000$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
     type = "b", lty = 1, lwd = 2, col = rich.colors.short(14)[1], pch = 1, ylab = "Selectivity", xlab = "Length (cm)",
     main = "Recreational Fleet")
lines(unlist(base.1016$sizeselex[base.1016$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(14)[7], pch = 7)
lines(unlist(base.10114$sizeselex[base.10114$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(14)[14], pch = 14)
lines(unlist(base.1014$sizeselex[base.1014$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(14)[6], pch = 6)
lines(unlist(base.1017$sizeselex[base.1017$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(14)[8], pch = 8)
lines(unlist(base.1013$sizeselex[base.1013$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = rich.colors.short(14)[5], pch = 5)
legend("topleft", c("Base model", "Est CVL2", "Alt phase/state", "Est Linf", "Est M", "DW DM"), 
       col = c(rich.colors.short(14)[1],rich.colors.short(14)[7],rich.colors.short(14)[14],rich.colors.short(14)[6],rich.colors.short(14)[8],rich.colors.short(14)[5]), 
       pch = c(1,7,14,6,8,5), lty = 1, lwd = 2, bty = "n")
dev.off()



###
#OREGON
###
wd = "C:/Users/Brian.Langseth/Desktop/or"

model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)

model = "7_1_11_comBlock_2003-2014"
base.7112 = SS_output(file.path(wd, model),covar=TRUE)

png(
  filename = file.path(wd, "plots","ComBlock_SSCpresentation_selex.png"),
  width = 6.5,
  height = 5,
  units = "in",
  res = 300,
  pointsize = 10
)
plot(unlist(base.7112$sizeselex[base.7112$sizeselex$Label=="2020_1_Lsel",-c(1:5)]), x = seq(5,59,2),
     type = "b", lty = 1, lwd = 2, col = "blue", pch = 1, ylab = "Selectivity", xlab = "Length (cm)")
lines(unlist(base.7112$sizeselex[base.7112$sizeselex$Label=="2020_2_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "b", lty = 1, lwd = 2, col = "red", pch = 1)
lines(unlist(base.7112$sizeselex[base.7112$sizeselex$Label=="2003_1_Lsel",-c(1:5)]), x = seq(5,59,2),
      type = "l", lty = 2, lwd = 2, col = "blue", pch = 1)
legend("topleft", c("Commercial", "Commercial 2003-2014", "Recreational"), 
       col = c("blue","blue","red"), 
       pch = c(1,NA,1), lty = c(1,2,1), lwd = 2, bty = "n")
dev.off()


