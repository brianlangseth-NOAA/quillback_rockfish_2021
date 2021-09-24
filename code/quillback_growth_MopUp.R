########################################
#Script to assess biological data patterns 
#for length, age, and weight. Also to output
#tables for number of data entries
#
#Uses updated data for 2020 (and other years) in Feb 2021
#Updates recent data even more in July/Aug 2021 and
#then again in Sept 2021
#
#Author: Brian Langseth, Chantel Wetzel
#
#Updated: 9/16/2020
#########################################

library(dataModerate2021)
#devtools::load_all("U:/Stock assessments/dataModerate_2021")
#source("U:\\Stock assessments\\quillback_rockfish_2021\\code\\clean_quillback_biodata.R")
#devtools::install_github("nwfsc-assess/PacFIN.Utilities")
#library(nwfscSurvey)
#library(PacFIN.Utilities)
library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish"
#pacfin_abbr = "QLBK"
#kl_name = "Quillback Rockfish"
#recfin_name = "QUILLBACK ROCKFISH"
#or_rec_name = "Quillback"
#ca_mrfss_code = 8826010120

############################################################################################
#	Load Data
############################################################################################

#Biological data from quilllback_all_biological_analysis_for_model.R
out <- read.csv(file = file.path(dir, "data", "output biology", "all_biological_analysis_for_model_data.csv"), header = TRUE)

#Read in new post-SSC data
postssc <- read.csv(file = file.path(dir, "data", "postSSC_request_data", "growth_postSSC.csv"), header = TRUE)
postssc$Length <- postssc$FL..mm./10 #in cm
postssc$Weight <- postssc$Weight..kg.
postssc$Age <- postssc$Final.Age
postssc$State <- "CA"
postssc$state_source <- postssc$Source
postssc$Areas <- postssc$Depth <- postssc$Fleet <- postssc$Data_Type <- postssc$lat_bin <- NA

#Read in new mop-up data
mopup <- read.csv(file = file.path(dir, "data", "mopup_data", "growth_mopup.csv"), header = TRUE)
mopup$Length <- mopup$FL..mm./10 #in cm
mopup$Weight <- mopup$Weight..kg.
mopup$Age <- mopup$Final.Age
mopup$State <- "CA"
mopup$state_source <- mopup$Source
mopup$Areas <- mopup$Depth <- mopup$Fleet <- mopup$Data_Type <- mopup$lat_bin <- NA


#Growth curves
#All data
out_age = out
out_age[out_age$State == "ORage", "State"] = "OR"
out_age[out_age$Source == "RecFIN_ORage", "Source"] = "RecFIN"
la_ests <- estimate_length_age(data = out_age[-c(142,143),], grouping = "all")
#Just CA
out_ca = out[out$State == "CA" & !is.na(out$Age),]
la_ca_ests <- estimate_length_age(data = out_ca, grouping = "all")
#Post SSC data
postssc_ests <- estimate_length_age(data = postssc, grouping = "all")
#Mop up data
mopup_ests <- estimate_length_age(data = mopup, grouping = "all")


#CA combined
col_names <- c("State", "Areas", "Depth", "Sex", "Length", "Weight", "Age", "Fleet",
               "Data_Type", "Source", "state_source")
ca_comb_ests <- estimate_length_age(data = rbind(out_ca[,col_names],
                                                 postssc[,col_names]))
ca_comb_mopup_ests <- estimate_length_age(data = rbind(out_ca[,col_names],
                                                 postssc[,col_names],
                                                 mopup[,col_names]))

#New CA data
ca_new_ests <- estimate_length_age(data = rbind(postssc[,col_names],
                                                mopup[,col_names]))

#All combined
comb_ests <- estimate_length_age(data = rbind(out_age[,col_names],
                                              postssc[,col_names]))
comb_mopup_ests <- estimate_length_age(data = rbind(out_age[,col_names],
                                              postssc[,col_names],
                                              mopup[,col_names]))

#No survey estimate - including the survey data matter!
nosurvey_ests <- estimate_length_age(data = out_age[out_age$Source != "NWFSC_WCGBTS",], grouping = "all")
#No ages < 5 - keeping survey greater than 4. Excluding young fish can produce similar estimates
noageless5_ests <- estimate_length_age(data = out_age[out_age$Age > 4,], grouping = "all")

#here just excluding the two youngest survey data points
ca_mopup_ests_noyoung <- estimate_length_age(data = rbind(out_ca[out_ca$Age > 3,col_names],
                                                postssc[,col_names],
                                                mopup[,col_names]))
#If use WCGBTS CA and new postSSC CA and mopup CA but double the two young ages
ca_mopup_ests_doubleyoung = estimate_length_age(data = rbind(out_ca[,col_names],
                                                             out_ca[out_ca$Length<20,col_names],
                                                             postssc[,col_names],
                                                             mopup[,col_names]))

#Now excluding just the smallest fish in the postssc data (which is a bit of an outlier). This doesn't really matter
outlier_ca_ests <- estimate_length_age(data = rbind(out_ca[,col_names],
                                                     postssc[postssc$Length>23,col_names],
                                                     mopup[,col_names]))


############################################################################################
#	Plot length-at-age data by source and year
############################################################################################
#Just CA growth curves
temp = out_age[-c(142,143),]
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), type = "n")
points(out_ca$Age, out_ca$Length, col = 2, pch = 19)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(mopup$Age, mopup$Length, col = 7, pch = 19)
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = 2, lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = mopup_ests["all"][[1]][1], L0 = mopup_ests["all"][[1]][2], k = mopup_ests["all"][[1]][3]), 
      col = 7, lty = 1, lwd = 3)
legend("bottomright", c("WCGBTS - CA", "Aug SSC - CA", "MopUp data - CA"), col = c(2,5,7), pch = 19, lty = 1, bty = "n", lwd = 2)


##Combining figures
#Original all-data Male-Female
plot(temp[temp$Sex == "F",]$Age,temp[temp$Sex == "F",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("red",0.25))
points(temp[temp$Sex == "M",]$Age,temp[temp$Sex == "M",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("blue",0.25))
points(temp[temp$Sex == "U",]$Age,temp[temp$Sex == "U",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("green",0.25))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
#Just CA original all
points(out_ca$Age, out_ca$Length, col = "green", pch = 19)
#New postSSC all
points(postssc$Age, postssc$Length, col = "magenta", pch = 19)
#New mopup all
points(mopup$Age, mopup$Length, col = "cyan", pch = 19)
#Add fits for just CA and new postSSC
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "green", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = "magenta", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = mopup_ests["all"][[1]][1], L0 = mopup_ests["all"][[1]][2], k = mopup_ests["all"][[1]][3]), 
      col = "cyan", lty = 1, lwd = 3)
#If use WCGBTS CA and new postSSC CA
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_ests["all"][[1]][1], L0 = ca_comb_ests["all"][[1]][2], k = ca_comb_ests["all"][[1]][3]), 
      col = 8, lty = 2, lwd = 3)
#If use WCGBTS CA and new postSSC CA and mopup CA
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = 1, lty = 2, lwd = 3)

#Look at impact of young ages on curves
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 8, lty = 2, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = 7, lty = 2, lwd = 3)
#If use WCGBTS CA and new postSSC CA and mopup CA without the two young ages
lines(0:75, vb_fn(age = 0:75, Linf = ca_mopup_ests_noyoung["all"][[1]][1], L0 = ca_mopup_ests_noyoung["all"][[1]][2], k = ca_mopup_ests_noyoung["all"][[1]][3]), 
      col = 2, lty = 1, lwd = 3)
#If use WCGBTS CA and new postSSC CA and mopup CA but double the two young ages
lines(0:75, vb_fn(age = 0:75, Linf = ca_mopup_ests_doubleyoung["all"][[1]][1], L0 = ca_mopup_ests_doubleyoung["all"][[1]][2], k = ca_mopup_ests_doubleyoung["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)


#Compare fits from surveys
#CA survey suggests a higher K but it is too sparse to have confidence in
png(filename = paste0(dir, "/data/mopup_data/", "survey_compare.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
points(temp[temp$Source == "NWFSC_WCGBTS" & temp$State != "CA",]$Age, 
       temp[temp$Source == "NWFSC_WCGBTS" & temp$State != "CA",]$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
estimate_length_age(data = rbind(out_ca[,col_names]))$all
estimate_length_age(data = rbind(temp[temp$Source == "NWFSC_WCGBTS" & temp$State != "CA",col_names]))$all
legend("bottomright", c("Original", "WCGBTS CA data", "WCGBTS WA/OR data"), 
       col = c(1, "red", 5), pch = 19)
dev.off()

#Compare fits from non surveys
#CA survey suggests a higher K but it is too sparse to have confidence in
png(filename = paste0(dir, "/data/mopup_data/", "nonsurvey_compare.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
points(temp[temp$Source != "NWFSC_WCGBTS" & temp$State != "CA",]$Age, 
       temp[temp$Source != "NWFSC_WCGBTS" & temp$State != "CA",]$Length, col = 5, pch = 19)
points(rbind(postssc[,col_names],mopup[,col_names])$Age, rbind(postssc[,col_names],mopup[,col_names])$Length, col = "red", pch = 19)
estimate_length_age(data = rbind(postssc[,col_names],mopup[,col_names]))$all
estimate_length_age(data = rbind(temp[temp$Source != "NWFSC_WCGBTS" & temp$State != "CA",col_names]))$all
legend("bottomright", c("Original", "CA non-survey data", "WA/OR non-survey data"), 
       col = c(1, "red", 5), pch = 19)
dev.off()


#Proportion of samples in intermediate ages
round(cumsum(table(temp$Age))/tail(cumsum(table(temp$Age)),1),2)
round(cumsum(table(rbind(postssc[,col_names],mopup[,col_names])$Age))/122,2)
#About the same

#CVs of lengths at ages
cv_orig = NA
cv_new = NA
mean_orig = NA
mean_new = NA
for(i in 1:40){
  mean_orig[i] = mean(temp[temp$Age==i,]$Length,na.rm=T)
  mean_new[i] = mean(rbind(postssc[,col_names],mopup[,col_names])[rbind(postssc[,col_names],mopup[,col_names])$Age==i,]$Length,na.rm=T)
  
  cv_orig[i] = 100*sd(temp[temp$Age==i,]$Length,na.rm=T)/mean_orig[i]
  cv_new[i] = 100*sd(rbind(postssc[,col_names],mopup[,col_names])[rbind(postssc[,col_names],mopup[,col_names])$Age==i,]$Length,na.rm=T)/mean_new[i]
}
cbind(mean_orig,mean_new)
plot(mean_orig-mean_new)
abline(h=0)



###########################
##For presentation to GFSC
###########################
#Original all-data all-sex
png(filename = paste0(dir, "/data/mopup_data/", "orig_LA_data.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
dev.off()

png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
#New postSSC all
points(postssc$Age, postssc$Length, col = 5, pch = 19)
#Just CA all
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
#Mopup
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup"), 
       lty = c(1,NA,NA,NA), col = c(1, "red", 5, 7), pch = c(1,19,19,19), text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup"), 
       lty = c(1,NA,NA,NA), pch = NA, col = c("lightgray", "red", 5, 7), bg = NA)
dev.off()

png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data_withFit.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
#New postSSC all
points(postssc$Age, postssc$Length, col = 5, pch = 19)
#Just CA all
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
#Mopup
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup"), 
       lty = 1, col = c(1, "red", 5, 7), pch = c(1,19,19,19), text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup"), 
       lty = 1, col = c("lightgray", "red", 5, 7), pch = NA, bg = NA)
#Add fits for just CA and new postSSC and mopup
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = mopup_ests["all"][[1]][1], L0 = mopup_ests["all"][[1]][2], k = mopup_ests["all"][[1]][3]), 
      col = 7, lty = 1, lwd = 3)
dev.off()

png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data_withFit1.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "CA comb. fit - Mopup"), 
       lty = 1, col = c(1, "red", 5, 7, "violet"), pch = c(1,19,19,19,19), ncol = 1, text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "CA comb. fit - Mopup"), 
       lty = 1, col = c("lightgray", "red", 5, 7, "violet"), pch = NA, ncol = 1, bg = NA)
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = mopup_ests["all"][[1]][1], L0 = mopup_ests["all"][[1]][2], k = mopup_ests["all"][[1]][3]), 
      col = 7, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
dev.off()

png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data_withFit2.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup", 
                        "New CA data", "CA comb. fit - Aug", "CA comb. fit - Mopup"), 
       lty = 1, col = c(1, "red", 5, 7, 3, "purple", "violet"), pch = c(1,19,19,19,19,19,19), 
       ncol = 1, cex = 0.8, text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup", 
                        "New CA data", "CA comb. fit - Aug", "CA comb. fit - Mopup"), 
       lty = 1, col = c("lightgray", "red", 5, 7, 3, "purple", "violet"), pch = NA, 
       ncol = 1, cex = 0.8, bg = NA)
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = mopup_ests["all"][[1]][1], L0 = mopup_ests["all"][[1]][2], k = mopup_ests["all"][[1]][3]), 
      col = 7, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_new_ests["all"][[1]][1], L0 = ca_new_ests["all"][[1]][2], k = ca_new_ests["all"][[1]][3]), 
      col = 3, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_ests["all"][[1]][1], L0 = ca_comb_ests["all"][[1]][2], k = ca_comb_ests["all"][[1]][3]), 
      col = "purple", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
dev.off()


png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data_withFit3.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "New CA data", "CA comb. fit - Mopup"), 
       lty = 1, col = c(1, "red", 5, 7, 3, "violet"), pch = c(1,19,19,19,19,19), ncol = 1, text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "New CA data", "CA comb. fit - Mopup"), 
       lty = 1, col = c("lightgray", "red", 5, 7, 3, "violet"), pch = NA, ncol = 1, bg = NA)
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = mopup_ests["all"][[1]][1], L0 = mopup_ests["all"][[1]][2], k = mopup_ests["all"][[1]][3]), 
      col = 7, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_new_ests["all"][[1]][1], L0 = ca_new_ests["all"][[1]][2], k = ca_new_ests["all"][[1]][3]), 
      col = 3, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
dev.off()


png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data_withFit4.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
#New postSSC all
points(postssc$Age, postssc$Length, col = 5, pch = 19)
#Just CA all
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
#Mopup
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup", 
                        "CA comb. fit - Mopup", "No youngest 2"), 
       lty = c(1,NA,NA,NA,1,2), col = c(1, "red", 5, 7, "violet", "purple"), pch = c(1,19,19,19,NA,NA), text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "CA comb. fit - Mopup", "No youngest 2"), 
       lty = c(1,NA,NA,NA,1,2), pch = NA, col = c("lightgray", "red", 5, 7, "violet", "purple"), bg = NA)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_mopup_ests_noyoung["all"][[1]][1], L0 = ca_mopup_ests_noyoung["all"][[1]][2], k = ca_mopup_ests_noyoung["all"][[1]][3]), 
      col = "purple", lty = 2, lwd = 3)
dev.off()


png(filename = paste0(dir, "/data/mopup_data/", "comb_LA_data_All.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
points(mopup$Age, mopup$Length, col = 7, pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "All - Aug", "All - Mopup"), 
       lty = c(1,NA,NA,NA,2,3), col = c(1, "red", 5, 7, 8, 3), pch = c(1,19,19,19,NA,NA), ncol = 2, bty = "n", text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "All - Aug", "All - Mopup"), 
       lty = c(1,NA,NA,NA,2,3), col = c("lightgray", "red", 5, 7, 1, 3), pch = NA, ncol = 2, bty = "n")
lines(0:75, vb_fn(age = 0:75, Linf = comb_ests["all"][[1]][1], L0 = comb_ests["all"][[1]][2], k = comb_ests["all"][[1]][3]), 
      col = 1, lty = 2, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = comb_mopup_ests["all"][[1]][1], L0 = comb_mopup_ests["all"][[1]][2], k = comb_mopup_ests["all"][[1]][3]), 
      col = 3, lty = 3, lwd = 3)
dev.off()


##Plot of density by age and length by CA versus not-CA
temp_all <- rbind(temp[,col_names],postssc[,col_names],mopup[,col_names])
temp_all$CA <- temp_all$State == "CA"
temp_all$NEW <- is.na(temp_all$Fleet)
ggplot(temp_all, aes(x = Age, group = CA, fill = CA)) +
   geom_density(alpha = 0.5)
ggplot(temp_all, aes(x = Age, group = CA, fill = CA)) +
   geom_bar(alpha = 0.5)



#Original all-data all-sex compared to model and new estimates
png(filename = paste0(dir, "/data/mopup_data/", "orig_LA_data_sensitvity values0.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = 43.02, L0 = 2.96, k = 0.141), #Update L0 from previous plots. Need to change because have different K and Linf (L1 is the same) 
      col = 4, lty = 1, lwd = 3)
legend("bottomright", c("Original", "Model Est Linf, K"), 
       lty = 1, col = c("lightgray", 4))
dev.off()


#Original all-data all-sex compared to model and new estimates
png(filename = paste0(dir, "/data/mopup_data/", "orig_LA_data_sensitvity values1.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), type="n")
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = 43.02, L0 = 2.96, k = 0.141), #Update L0 from previous plots. Need to change because have different K and Linf (L1 is the same) 
      col = 4, lty = 1, lwd = 3)
#lines(0:75, vb_fn(age = 0:75, Linf = 42.085, L0 = -0.094, k = 0.199), #Linf curve
#      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
legend("bottomright", c("Original", "Model Est Linf, K", "CA data"), 
       lty = 1, col = c("lightgray", 4, "violet"))
dev.off()


#Original all-data all-sex compared to model and new estimates
png(filename = paste0(dir, "/data/mopup_data/", "orig_LA_data_sensitvity values2.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), type = "n")
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = 43.02, L0 = 2.96, k = 0.141), #Update L0 from previous plots. Need to change because have different K and Linf (L1 is the same) 
      col = 4, lty = 1, lwd = 3)
#lines(0:75, vb_fn(age = 0:75, Linf = 42.085, L0 = -0.094, k = 0.199), #Linf curve
#      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
#lines(0:75, vb_fn(age = 0:75, Linf = 43.35, L0 = 8.04, k = 0.127), #If estimate internally Linf, K, and L1
#     col = 7, lty = 1, lwd = 3)
#lines(0:75, vb_fn(age = 0:75, Linf = 42.72, L0 = -4.7, k = 0.23), #Oregon-only growth curve
#      col = 7, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = 44.5, L0 = 3.17, k = 0.1305), #Internally estimated curve from Oregon sens
      col = 3, lty = 2, lwd = 3)
legend("bottomright", c("Original", "CA model est Linf, K", "CA data", "OR model est. Linf, K"), 
       lty = c(1,1,1,2), col = c("lightgray", 4, "violet", 3))
dev.off()


# #Pulled from "lingcod_PacFIN_BDS.R" the plot for PacFIN_ldist
# #Need to finish if have time. DONT HAVE TIME
# orig_data = many_data[,col_names]
# orig_data$type = "orig"
# new_data = rbind(out_ca[,col_names],
#                  postssc[,col_names],
#                  mopup[,col_names])
# new_data$type = "new"
# gg <- ggplot2::ggplot(subset(rbind(orig_data,new_data), Age %in% c(6:8,10:15)),
#                       ggplot2::aes(x = Length, group = type, fill = type)) +
#   ggplot2::geom_density(alpha=0.5) + 
#   ggplot2::facet_grid(rows = vars(Age))


##
#Explore estimates for K and Linf if L0 were fixed
##
vb_fn_L0fixed <- function(age, Linf, k) {
  #vec <- Linf * (1 - exp( -k * (age - t0)))
  vec <- Linf - (Linf - 0.57) * exp(-age * k)
  return(vec)
}
vb_opt_fn_L0fixed <- function(x, age, lengths) { 
  
  sum( (lengths - vb_fn_L0fixed( age, Linf = x[1], k = x[2]) )^2 )
}
data_t0fixed = rbind(out_ca[,col_names],postssc[,col_names],mopup[,col_names]) 
t0fixed = optim(c(40, 0.1), vb_opt_fn_L0fixed, age = data_t0fixed$Age, lengths = data_t0fixed$Length)$par

png(filename = paste0(dir, "/data/mopup_data/", "orig_LA_data_L1Fixed.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "lightgray", lty = 1, lwd = 2)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(mopup$Age, mopup$Length, col = 7, pch = 19)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_mopup_ests["all"][[1]][1], L0 = ca_comb_mopup_ests["all"][[1]][2], k = ca_comb_mopup_ests["all"][[1]][3]), 
      col = "violet", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = t0fixed[1], L0 = 0.59, k = t0fixed[2]), 
      col = "violet", lty = 2, lwd = 3)
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "CA data", "CA data - L1 fixed"), 
       lty = c(1,NA,NA,NA,1,2), col = c(1, "red", 5, 7, "violet", "violet"), pch = c(1,19,19,19,NA,NA), 
       text.col = "white")
legend("bottomright", c("Original", "Original CA data", "New CA data - Aug", "New CA data - mopup",
                        "CA data", "CA data - L1 fixed"), 
       lty = c(1,NA,NA,NA,1,2), col = c("lightgray", "red", 5, 7, "violet", "violet"), pch = NA, bg = NA)
dev.off()


##################################
#Table of estimates 
##################################
names_rows <- c("Adopted base", 
                "All CA data",
                "Original CA data",
                "New CA data - Aug.",
                "New CA data - Sept",
                "New CA data",
                "All age 3+ CA data",
                "CA model estimated",
                "OR model estimated",
                "All CA data - L1 fixed",
                "Original All No survey",
                "Original All 5+",
                "All data")
parm_ests <- rbind(la_ests$all,
                   ca_comb_mopup_ests$all,
                   la_ca_ests$all,
                   postssc_ests$all,
                   mopup_ests$all,
                   ca_new_ests$all,
                   ca_mopup_ests_noyoung$all,
                   c(43.02, 2.96, 0.141), #CA model estimated
                   c(44.5, 3.17, 0.1305), #OR model estimated
                   c(t0fixed[1], 0.57, t0fixed[2]),
                   nosurvey_ests$all,
                   noageless5_ests$all,
                   comb_mopup_ests$all)
write.csv(parm_ests, paste0(dir, "/data/mopup_data/", "parameter_estimates.csv"), 
          row.names = names_rows)


###################################
#Growth simulation
###################################

library(devtools)
source_url("https://raw.githubusercontent.com/brianlangseth-NOAA/quillback_rockfish_2021/master/code/growth_sim.R")
#i SHA-1 hash of file is 94dacab0b637bce27e2fb3ec726b704abba866b7

col_names <- c("Sex","Length","Age")
many_data <- temp[!is.na(temp$Age),]
few_data <- rbind(out_ca[,col_names],postssc[,col_names],mopup[,col_names])
nsim = 10
linf = 40
l0 = 10
k = 0.1

#Plot the data
plot(many_data$Age, many_data$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
points(postssc$Age, postssc$Length, col = 5, pch = 19) #New postSSC all
points(out_ca$Age, out_ca$Length, col = "red", pch = 19) #Just CA all
points(mopup$Age, mopup$Length, col = 7, pch = 19) #Mopup


nsims <- 100
sim <- growth_sim(many_data,few_data,nsim = nsims, linf = 40, l0 = 10, k = 0.1)
agemat = matrix(rep(sim$Ages,nsims),nrow = length(sim$Ages),ncol=nsims)
#matplot(agemat,t(sim$Lengths), xlim=c(0,75), ylim = c(0,55), pch = 19)
plot(agemat,t(sim$Lengths),xlim=c(0,75),ylim=c(0,55))
points(few_data$Age,few_data$Length,col=2,pch=19)

ca_ests <- optim(c(linf, l0, k), vb_opt_fn, age = few_data$Age, lengths = few_data$Length)$par	
sim1_ests <- optim(c(linf, l0, k), vb_opt_fn, age = sim$Ages, lengths = sim$Lengths[1,])$par	
sim1_ests_above4 <- optim(c(linf, l0, k), vb_opt_fn, age = sim$Ages[which(sim$Ages>4)], lengths = sim$Lengths[1,which(sim$Ages>4)])$par	
sim1_ests_above3 <- optim(c(linf, l0, k), vb_opt_fn, age = sim$Ages[which(sim$Ages>3)], lengths = sim$Lengths[1,which(sim$Ages>3)])$par	

plot(many_data$Age, many_data$Length, ylim = c(0,55))
points(sim$Ages, sim$Lengths[1,], ylim = c(0,55), col =5, pch=19)
points(sim$Ages[which(sim$Ages>4)], sim$Lengths[1,which(sim$Ages>4)], ylim = c(0,55), col =7, pch=19)
points(few_data$Age,few_data$Length,col=2,pch=19)
lines(0:75, vb_fn(age = 0:75, Linf = sim$Ests[1,1], L0 = sim$Ests[1,2], k = sim$Ests[1,3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = sim1_ests_above4[1], L0 = sim1_ests_above4[2], k = sim1_ests_above4[3]), 
      col = 7, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_ests[1], L0 = ca_ests[2], k = ca_ests[3]), 
      col = 2, lty = 1, lwd = 3)
#Removing ages 1-3 makes the WA/OR curve still have pretty high K (k=0.17)
#Removing ages 1-4 makes the WA/OR curve have lower K (k=0.145) but overall estimate is still consistent with all data
#Therefore CA data do appear different, however the curve is still very sparse

ggplot(sim$Ests, aes(x = linf)) +
  geom_density(alpha = 0.5) + 
  geom_vline(xintercept = ca_ests[1], col = 2, lwd = 1)

ggplot(sim$Ests, aes(x = k)) +
  geom_density(alpha = 0.5) + 
  geom_vline(xintercept = ca_ests[3], col = 2, lwd = 1)

ggplot(sim$Ests, aes(x = l0)) +
  geom_density(alpha = 0.5) + 
  geom_vline(xintercept = ca_ests[2], col = 2, lwd = 1)


##Run the simulation with ages only > 4
nsims <- 1000
sim <- growth_sim(many_data, few_data[few_data$Age>4,], nsim = nsims, linf = 40, l0 = 15, k = 0.15)

##Run the simulation without WCGBTS data
nsims <- 1000
sim <- growth_sim(many_data[many_data$Source != "NWFSC_WCGBTS",],few_data[few_data$Age>4,],nsim = nsims, linf = 40, l0 = 15, k = 0.15)



