########################################
#Script to assess biological data patterns 
#for length, age, and weight. Also to output
#tables for number of data entries
#
#Uses updated data for 2020 (and other years) in Feb 2021
#
#Author: Brian Langseth, Chantel Wetzel
#
#Updated: 2/26/2020
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


#CA combined
col_names <- c("State", "Areas", "Depth", "Sex", "Length", "Weight", "Age", "Fleet",
               "Data_Type", "Source", "state_source")
ca_comb_ests <- estimate_length_age(data = rbind(out_ca[,col_names],
                                                 postssc[,col_names]))

#All combined
comb_ests <- estimate_length_age(data = rbind(out_age[,col_names],
                                              postssc[,col_names]))


############################################################################################
#	Plot length-at-age data by source and year
############################################################################################
#Plot of Original all-data relationship
temp = out_age[-c(142,143),]
plot(temp[temp$Sex == "F",]$Age,temp[temp$Sex == "F",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("red",0.25))
points(temp[temp$Sex == "M",]$Age,temp[temp$Sex == "M",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("blue",0.25))
points(temp[temp$Sex == "U",]$Age,temp[temp$Sex == "U",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("green",0.25))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
#lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all_F"][[1]][1], L0 = la_ests["all_F"][[1]][2], k = la_ests["all_F"][[1]][3]), 
#      col = 2, lty = 1, lwd = 3)
#lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all_M"][[1]][1], L0 = la_ests["all_M"][[1]][2], k = la_ests["all_M"][[1]][3]), 
#      col = "blue", lty = 1, lwd = 3)


#Just CA
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), type = "n")
points(out_ca$Age, out_ca$Length)
points(postssc$Age, postssc$Length, col = 2)
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 2, lty = 1, lwd = 3)
legend("bottomright", c("WCGBTS - CA", "New data - CA"), col = c(1,2), pch = 1, lty = 1, bty = "n", lwd = 2)


##Combining figures
#Original all-data Male-Female
plot(temp[temp$Sex == "F",]$Age,temp[temp$Sex == "F",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("red",0.25))
points(temp[temp$Sex == "M",]$Age,temp[temp$Sex == "M",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("blue",0.25))
points(temp[temp$Sex == "U",]$Age,temp[temp$Sex == "U",]$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55), col = alpha("green",0.25))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
#Just CA all
points(out_ca$Age, out_ca$Length, col = "green", pch = 19)
#New postSSC all
points(postssc$Age, postssc$Length, col = "magenta", pch = 19)
#Add fits for just CA and new postSSC
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "green", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = "magenta", lty = 1, lwd = 3)
#If use WCGBTS CA and new postSSC CA
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_ests["all"][[1]][1], L0 = ca_comb_ests["all"][[1]][2], k = ca_comb_ests["all"][[1]][3]), 
      col = 8, lty = 1, lwd = 3)

######
##For presentation to GFSC
######
#Original all-data all-sex
png(filename = paste0(dir, "/data/postSSC_request_data/", "orig_LA_data.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
dev.off()

png(filename = paste0(dir, "/data/postSSC_request_data/", "comb_LA_data.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
#New postSSC all
points(postssc$Age, postssc$Length, col = 5, pch = 19)
#Just CA all
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data"), lty = 1, col = c(1, "red", 5), pch = 19,  )
dev.off()

png(filename = paste0(dir, "/data/postSSC_request_data/", "comb_LA_data_withFit.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
#New postSSC all
points(postssc$Age, postssc$Length, col = 5, pch = 19)
#Just CA all
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data"), lty = 1, col = c(1, "red", 5), pch = 19,  )
#Add fits for just CA and new postSSC
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
dev.off()

png(filename = paste0(dir, "/data/postSSC_request_data/", "comb_LA_data_withFit2.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data", "CA comb. fit"), 
       lty = 1, col = c(1, "red", 5, "purple"), pch = c(19,19,19,NA))
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_ests["all"][[1]][1], L0 = ca_comb_ests["all"][[1]][2], k = ca_comb_ests["all"][[1]][3]), 
      col = "purple", lty = 1, lwd = 3)
dev.off()


png(filename = paste0(dir, "/data/postSSC_request_data/", "comb_LA_data_All.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = 1, lty = 1, lwd = 2)
points(postssc$Age, postssc$Length, col = 5, pch = 19)
points(out_ca$Age, out_ca$Length, col = "red", pch = 19)
legend("bottomright", c("Original", "Original CA data", "New CA data", "CA comb. fit", "All"), 
       lty = 1, col = c(1, "red", 5, "purple",7), pch = c(19,19,19,NA,NA))
lines(0:75, vb_fn(age = 0:75, Linf = la_ca_ests["all"][[1]][1], L0 = la_ca_ests["all"][[1]][2], k = la_ca_ests["all"][[1]][3]), 
      col = "red", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = postssc_ests["all"][[1]][1], L0 = postssc_ests["all"][[1]][2], k = postssc_ests["all"][[1]][3]), 
      col = 5, lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = ca_comb_ests["all"][[1]][1], L0 = ca_comb_ests["all"][[1]][2], k = ca_comb_ests["all"][[1]][3]), 
      col = "purple", lty = 1, lwd = 3)
lines(0:75, vb_fn(age = 0:75, Linf = comb_ests["all"][[1]][1], L0 = comb_ests["all"][[1]][2], k = comb_ests["all"][[1]][3]), 
      col = 7, lty = 1, lwd = 3)
dev.off()


##Plot of density by age and length
temp_all <- rbind(temp[,col_names],postssc[,col_names])
temp_all$CA <- temp_all$State == "CA"
temp_all$NEW <- (temp_all$State == "CA" & temp_all$Fleet != "survey")
ggplot(temp_all, aes(x = Age, group = CA, fill = CA)) +
   geom_density(alpha = 0.5)
ggplot(temp_all, aes(x = Age, group = CA, fill = CA)) +
   geom_bar(alpha = 0.5)


#Original all-data all-sex
png(filename = paste0(dir, "/data/postSSC_request_data/", "orig_LA_data_sensitvity values.png"), height = 4, width = 6,
    res = 300, units = "in")
plot(temp$Age,temp$Length, xlab = "Age", ylab = "Length (cm)", ylim = c(0,55))
lines(0:75, vb_fn(age = 0:75, Linf = la_ests["all"][[1]][1], L0 = la_ests["all"][[1]][2], k = la_ests["all"][[1]][3]), 
      col = "darkgray", lty = 1, lwd = 2)
lines(0:75, vb_fn(age = 0:75, Linf = 43.02, L0 = -0.505, k = 0.141), 
      col = 2, lty = 1, lwd = 2)
legend("bottomright", c("Original", "Original Est Linf, K"), 
       lty = 1, col = c("darkgray", 2))
dev.off()




