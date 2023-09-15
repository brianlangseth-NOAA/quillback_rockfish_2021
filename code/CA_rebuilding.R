######################
# California rebuilding analysis for Quillback Rockfish - 2021
# Based on: Rebuilder 3.13h from August 2021
# located here: "\\nwcfile\FRAM\Assessments\Archives\2.Rebuilder_Program\2021 Rebuilder"
#
# Rebuilder instructions are here: 
# https://docs.google.com/document/d/17hH1CEdombkF33Nw-_BAZLIlSfHWWgfkBSSdFRNTX_s/edit
# Copied model 900 and made the changes based on the above instructions
#
# Adjusted rebuild.dat file is in the folder, but also copied over into the 
# just model files folder (of base.910) as (updated rebuild file_USE_THIS.dat)
#
# Author: Brian Langseth - September 3, 2021 but
# large compliments to Chantel Wetzel for leading the charge
######################

library(devtools)
library(r4ss)
library(reshape2)
library(ggplot2)

source_url("https://raw.githubusercontent.com/chantelwetzel-noaa/copper_rockfish_2021/master/code/get_values_rebuilder.R")

source_url("https://raw.githubusercontent.com/r4ss/r4ss/main/R/RebuildPlot.R")

#Rebuilding analysis folder
dir = "C:/Users/Brian.Langseth/Desktop/ca"

# Set the working directory where runs are located
rebuild_dir = file.path(dir, "rebuilder")

####
#Copy Chantel's script for running rebuilder for states of nature
#Revise to apply to mine, which are based on M, not R0
#For model 910
####

# Create a rebuilding that incorporates uncertainity around M
# make a table of the 9 states of nature with information about each one
statetable <- data.frame(iM=rep(NA, 3), M=rep(NA,3), dir=rep(NA,3), weight = rep(NA,3),weight_frac=rep(NA,3))
st_dir = file.path(rebuild_dir, "states_of_nature_910") 
n <- 1
for(iM in 1:length(dir(st_dir))){
  mydir <- file.path(st_dir, dir(st_dir)[iM])
  # set index and text for M
  statetable$iM[n] <- iM
  statetable$iM[n] <- c("mle","high", "low")[iM]
  # set directory where files are located
  statetable$dir[n] <- mydir
  # set weighting of 1, 2, or 4
  statetable$weight[n] <- c(2, 1, 1)[iM]
  statetable$weight_frac[n] <- c(0.50, 0.25, 0.25)[iM]
  statetable$M[n] <- c(0.057, 0.0744, 0.0464)[iM]
  n <- n+1
}

rebuildblend <- NULL
for(i in 1:nrow(statetable)){
  # read rebuild.sso from directories
  rebuildlines <- readLines(paste(statetable$dir[i],"/rebuild.sso",sep=""))
  # take only final section of this file
  # (because file doesn't get deleted when model is rerun and may contain out-of-date values)
  rebuildlines <- rebuildlines[max(1+grep("in maximization mode",rebuildlines)):length(rebuildlines)]
  # print first line to confirm that it looks like some numbers
  print(rebuildlines[1])
  for(j in 1:statetable$weight[i]){
    header <- c(paste("# values from ",statetable$dir[i],", catch at ", statetable$catch[i],"%",
                      " and natural mortality at ",statetable$M[i]," value.",sep=""),
                paste("# this is state of nature ",i," out of ",3," (in no particular order)",sep=""),
                paste("# and parameter set number ", j, " out of ", statetable$weight[i], sep=""))
    # can only have 1 header line, must collapse header into 1 line
    header <- paste(header, collapse=" ")
    # concatenate new header and lines to existing stuff
    rebuildblend <- c(rebuildblend, header, rebuildlines)  	
  }
}

# write resulting file
writeLines(rebuildblend, file.path(rebuild_dir, "rebuild_m_states_910_2021.sso"))

# Double check that the rebuildblend file appears to have the correct values from the state of nature models
a1 <- unique(sort(as.numeric(substring(rebuildblend[grep("#mean M", rebuildblend, fixed = TRUE)], 1, 7))))

# Now run the rebuilder using the "rebuild_m_states_2021.dat" by placing in folder
# with exe file and rebuild.data file. Need to enter the name of this file into the 
# rebuild.dat file under the "# File with multiple parameter vectors " section


#######################
#Now doing it for 921
#######################

statetable <- data.frame(iM=rep(NA, 3), M=rep(NA,3), dir=rep(NA,3), weight = rep(NA,3),weight_frac=rep(NA,3))
st_dir = file.path(rebuild_dir, "states_of_nature_921") 
n <- 1
for(iM in 1:length(dir(st_dir))){
  mydir <- file.path(st_dir, dir(st_dir)[iM])
  # set index and text for M
  statetable$iM[n] <- iM
  statetable$iM[n] <- c("mle","high", "low")[iM]
  # set directory where files are located
  statetable$dir[n] <- mydir
  # set weighting of 1, 2, or 4
  statetable$weight[n] <- c(2, 1, 1)[iM]
  statetable$weight_frac[n] <- c(0.50, 0.25, 0.25)[iM]
  statetable$M[n] <- c(0.057, 0.0744, 0.0464)[iM]
  n <- n+1
}

rebuildblend <- NULL
for(i in 1:nrow(statetable)){
  # read rebuild.sso from directories
  rebuildlines <- readLines(paste(statetable$dir[i],"/rebuild.sso",sep=""))
  # take only final section of this file
  # (because file doesn't get deleted when model is rerun and may contain out-of-date values)
  rebuildlines <- rebuildlines[max(1+grep("in maximization mode",rebuildlines)):length(rebuildlines)]
  # print first line to confirm that it looks like some numbers
  print(rebuildlines[1])
  for(j in 1:statetable$weight[i]){
    header <- c(paste("# values from ",statetable$dir[i],", catch at ", statetable$catch[i],"%",
                      " and natural mortality at ",statetable$M[i]," value.",sep=""),
                paste("# this is state of nature ",i," out of ",3," (in no particular order)",sep=""),
                paste("# and parameter set number ", j, " out of ", statetable$weight[i], sep=""))
    # can only have 1 header line, must collapse header into 1 line
    header <- paste(header, collapse=" ")
    # concatenate new header and lines to existing stuff
    rebuildblend <- c(rebuildblend, header, rebuildlines)  	
  }
}

# write resulting file
writeLines(rebuildblend, file.path(rebuild_dir, "rebuild_m_states_921_2021.sso"))

# Double check that the rebuildblend file appears to have the correct values from the state of nature models
a1 <- unique(sort(as.numeric(substring(rebuildblend[grep("#mean M", rebuildblend, fixed = TRUE)], 1, 7))))


##
#IMPORTANT - NEED TO MAKE MANUAL ADJUSTMENTS TO PARAMETER FILE
##
#Do from rebuild_m_states_921_2021.sso
rebuildblend[grep("# spawn-recr", rebuildblend)] #In these lines add a fourth element, 0.4
rebuildblend[grep("#female fecundity", rebuildblend)] #In these lines, set the first element to zero
#SAVE AS "rebuild_m_fixed.sso"



#######################
#Now doing it for 1100 
#######################

# Create a rebuilding that incorporates uncertainity around M
# make a table of the 3 states of nature with information about each one
statetable <- data.frame(iM=rep(NA, 3), M=rep(NA,3), dir=rep(NA,3), weight = rep(NA,3),weight_frac=rep(NA,3))
st_dir = file.path(rebuild_dir, "states_of_nature_1100") 
n <- 1
for(iM in 1:length(dir(st_dir))){
  mydir <- file.path(st_dir, dir(st_dir)[iM])
  # set index and text for M
  statetable$iM[n] <- iM
  statetable$iM[n] <- c("mle","high", "low")[iM]
  # set directory where files are located
  statetable$dir[n] <- mydir
  # set weighting of 1, 2, or 4
  statetable$weight[n] <- c(2, 1, 1)[iM]
  statetable$weight_frac[n] <- c(0.50, 0.25, 0.25)[iM]
  statetable$M[n] <- c(0.057, 0.0744, 0.0464)[iM]
  n <- n+1
}

rebuildblend <- NULL
for(i in 1:nrow(statetable)){
  # read rebuild.sso from directories
  rebuildlines <- readLines(paste(statetable$dir[i],"/rebuild.sso",sep=""))
  # take only final section of this file
  # (because file doesn't get deleted when model is rerun and may contain out-of-date values)
  rebuildlines <- rebuildlines[max(1+grep("in maximization mode",rebuildlines)):length(rebuildlines)]
  # print first line to confirm that it looks like some numbers
  print(rebuildlines[1])
  for(j in 1:statetable$weight[i]){
    header <- c(paste("# values from ",statetable$dir[i],", catch at ", statetable$catch[i],"%",
                      " and natural mortality at ",statetable$M[i]," value.",sep=""),
                paste("# this is state of nature ",i," out of ",3," (in no particular order)",sep=""),
                paste("# and parameter set number ", j, " out of ", statetable$weight[i], sep=""))
    # can only have 1 header line, must collapse header into 1 line
    header <- paste(header, collapse=" ")
    # concatenate new header and lines to existing stuff
    rebuildblend <- c(rebuildblend, header, rebuildlines)  	
  }
}

# Double check that the rebuildblend file appears to have the correct values from the state of nature models
a1 <- unique(sort(as.numeric(substring(rebuildblend[grep("#mean M", rebuildblend, fixed = TRUE)], 1, 7))))

#IMPORTANT - NEED TO MAKE ADJUSTMENTS TO PARAMETER FILE
#This time around I do it after combining whereas before (for 921) I did it to each state of nature file before combining

rebuildblend[grep("# spawn-recr", rebuildblend)] #In these lines add a fourth element, 0.4
rebuildblend[grep("#female fecundity", rebuildblend)] #In these lines, set the first element to zero
rebuildblend[grep("#numbers for year Ydeclare", rebuildblend)] #In these lines, need to replace Ydecl age structure with Yinit's
#Add fourth element first
rebuildblend[grep("# spawn-recr", rebuildblend)] <- 
  unlist(lapply(
    lapply(strsplit(rebuildblend[grep("# spawn-recr", rebuildblend)], " "), FUN = function(x) append(x, 0.4, after = 3)),
    FUN = paste, collapse = " "))
#Now set first element to zero (typically its the second element because the first is a space)
rebuildblend[grep("#female fecundity", rebuildblend)] <- 
  unlist(lapply(
    lapply(strsplit(rebuildblend[grep("#female fecundity", rebuildblend)], " "), FUN = function(x) replace(x, 2, 0)),
    FUN = paste, collapse = " "))
#Now replace Ydecl age structure. 
#Copy over default SS3 output for second set of age-structures to be from Yinit for 2023 quillback (SS3 default is to use Ydecl)
rebuildblend[grep("#numbers for year Ydeclare", rebuildblend)] <- 
  unlist(lapply(
    lapply(strsplit(rebuildblend[grep("#numbers for year Yinit", rebuildblend)], " "), FUN = function(x) 
    replace(x, length(x)-3, c("Ydeclare:"))),
    FUN = paste, collapse = " "))

#SAVE AS "rebuild_m_2023.sso" THERE IS A FINAL NAME LENGTH LIMIT of 16 characters. BEWARE!!
writeLines(rebuildblend, file.path(rebuild_dir, "rebuild_m_2023.sso"))



#---------------------------------------------------------------------------------------------------------#
#                                             Result Plotting
#---------------------------------------------------------------------------------------------------------#

####
#Make plots from runs
####

frac_fem = 0.5

# Read in rebuilding options
# #Test runs based on these models
# run <- c(
#   "930_F2017_2019_ageStruc2021",
#   "931_no_abc_max",
#   "tests/4_test_run_oneSex")
#Report is based on these models
run <- c(
  "930_F2017_2019_ageStruc2021",
  "930b_no_abc_max",
  "940_recComBlock2001",
  "940b_no_abc_max",
  "931_Tmax",
  "931b_Tmax_no_abc_max",
  "tests/6_test_2sexSS",
  "933_StatesOfNature",
  "933b_no_abc_max",
  "933c_1200sims",
  "933d_2000sims")
reb <- list()
for(a in 1:length(run)){
  reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[[a]]))	
}

# This function currently works to create figures but could use so refinement
#Dont use r4ss::DoProjectPlots because Im updated just this script for now, not the full r4ss package
for(a in 1:length(run)){
  DoProjectPlots( 
    dirn = file.path(rebuild_dir, run[[a]]), 
    fileN = "RES.CSV",
    ncols = 200,
    Outlines = c(2, 2),
    OutlineMulti = c(2,3),
    pdf = TRUE)
}

# Here is some modified code that does the cummalative figures in a nice way using 
# ggplot
for (a in 1:length(run)){
  x = reb[[a]]
  
  #Probability Plots
  probs_gg <-reshape2::melt(data = x$prob_matrix[,2:ncol(x$prob_matrix)])
  colnames(probs_gg)<-c("Year", "Scenario", "Prob")
  probs_gg[,"Year"] = rep(x$prob_matrix[,1], length(2:ncol(x$prob_matrix)))
  find = which(probs_gg$Prob <=1.0 & probs_gg$Year <= (x$tmax + 3*x$mean_gen))
  ggplot2::ggplot(probs_gg[find,], aes(x = Year,y = Prob, color = Scenario)) + 
    geom_line(lwd = 1.5) + ylab("Probability Relative Spawning Output > 40% Spawning Output")
  ggsave(file.path(rebuild_dir, run[a], "rebuilding_probability.png"), width = 10, height = 7)
  
  #Catches
  acl_gg <- reshape2::melt(x$acl_matrix[,2:ncol(x$acl_matrix)])
  colnames(acl_gg)<-c("Year", "Scenario", "Catch")
  acl_gg[,"Year"] = rep(x$acl_matrix[,1], length(2:ncol(x$acl_matrix)))
  find = which(acl_gg$Year > 2023 & acl_gg$Year <= (x$tmax + 3*x$mean_gen))
  ggplot2::ggplot(acl_gg[find,], aes(x = Year, y = Catch, color = Scenario)) + 
    geom_line(lwd=1.5) + ylab("Catches (mt)")
  ggsave(file.path(rebuild_dir, run[a], "rebuilding_acl.png"), width = 10, height = 7)
  
  
  #Spawning output 
  #Set frac female in 2sex model to 1 so plot just SSB. Keep at 0.5 for all others
  if(run[a]=="tests/6_test_2sexSS"){ frac_fem = 0 }
  sb_gg <- reshape2::melt(x$ssb_matrix[,2:ncol(x$ssb_matrix)])
  colnames(sb_gg)<-c("Year","Scenario","SB")
  sb_gg[,"Year"] = rep(x$ssb_matrix[,1], length(2:ncol(x$ssb_matrix)))
  find = which(sb_gg$Year > 2023 & sb_gg$Year <= (x$tmax + 3*x$mean_gen))
  ggplot(sb_gg[find,], aes(x = Year, y = SB*frac_fem, color = Scenario)) + 
    geom_line(lwd = 1.5) + ylab("Spawning output")
  ggsave(file.path(rebuild_dir, run[a], "rebuilding_ssb.png"), width = 10, height = 7)
  
  
  #Spawning output relative to the target
  sb_gg <- reshape2::melt(x$relativeb_matrix[,2:ncol(x$relativeb_matrix)])
  colnames(sb_gg)<-c("Year","Scenario","SB")
  sb_gg[,"Year"] = rep(x$relativeb_matrix[,1], length(2:ncol(x$relativeb_matrix)))
  find = which(sb_gg$Year > 2023 & sb_gg$Year <= (x$tmax + 3*x$mean_gen))
  ggplot(sb_gg[find,], aes(x = Year, y = SB, color = Scenario)) + 
    geom_line(lwd = 1.5) + ylab("Spawning output relative to 40% spawning output")
  ggsave(file.path(rebuild_dir, run[a], "rebuilding_relative_sb.png"), width = 10, height = 7)
  
}

####
#Figures for report
#Replaced SPR500 and Tmid scnearios with no cap runs
####

#Runs that are the base model with ABC caps, and without
nrun = which(run %in% c("930_F2017_2019_ageStruc2021","930b_no_abc_max")) 
x=reb[[nrun[1]]]  
x_nocap = reb[[nrun[2]]]

#Probability Plots
probs_gg <-reshape2::melt(data = x$prob_matrix[,2:ncol(x$prob_matrix)])
colnames(probs_gg)<-c("Year", "Scenario", "Prob")
#############
probs_gg_nocap <-reshape2::melt(data = x_nocap$prob_matrix[,2:ncol(x_nocap$prob_matrix)]) #no cap run
probs_gg[1:200,] <- probs_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
probs_gg[1001:1200,] <- probs_gg_nocap[1001:1200,] #replace Tmid values with no cap run
#############
probs_gg[,"Year"] = rep(x$prob_matrix[,1], length(2:ncol(x$prob_matrix)))
find = which(probs_gg$Prob <=1.0 & probs_gg$Year <= (x$tmax + 3*x$mean_gen))
ggplot2::ggplot(probs_gg[find,], aes(x = Year,y = Prob, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Probability Relative Spawning Output > 40% Spawning Output")
ggsave(file.path(rebuild_dir, "write_up", "figures", "rebuilding_probability_forREPORT.png"), width = 10, height = 7)

#Catches
acl_gg <- reshape2::melt(x$acl_matrix[,2:ncol(x$acl_matrix)])
colnames(acl_gg)<-c("Year", "Scenario", "Catch")
#############
acl_gg_nocap <-reshape2::melt(data = x_nocap$acl_matrix[,2:ncol(x_nocap$acl_matrix)]) #no cap run
acl_gg[1:200,] <- acl_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
acl_gg[1001:1200,] <- acl_gg_nocap[1001:1200,] #replace Tmid values with no cap run
#############
acl_gg[,"Year"] = rep(x$acl_matrix[,1], length(2:ncol(x$acl_matrix)))
find = which(acl_gg$Year > 2023 & acl_gg$Year <= (x$tmax + 3*x$mean_gen))
ggplot2::ggplot(acl_gg[find,], aes(x = Year, y = Catch, color = Scenario)) + 
  geom_line(lwd=1.5) + ylab("Catches (mt)")
ggsave(file.path(rebuild_dir, "write_up", "figures", "rebuilding_acl_forREPORT.png"), width = 10, height = 7)

#Spawning output 
#Set frac female in 2sex model to 1 so plot just SSB. Keep at 0.5 for all others
sb_gg <- reshape2::melt(x$ssb_matrix[,2:ncol(x$ssb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
#############
sb_gg_nocap <-reshape2::melt(data = x_nocap$ssb_matrix[,2:ncol(x_nocap$ssb_matrix)]) #no cap run
sb_gg[1:200,] <- sb_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
sb_gg[1001:1200,] <- sb_gg_nocap[1001:1200,] #replace Tmid values with no cap run
#############
sb_gg[,"Year"] = rep(x$ssb_matrix[,1], length(2:ncol(x$ssb_matrix)))
find = which(sb_gg$Year > 2023 & sb_gg$Year <= (x$tmax + 3*x$mean_gen))
ggplot(sb_gg[find,], aes(x = Year, y = SB*frac_fem, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Spawning output")
ggsave(file.path(rebuild_dir, "write_up", "figures", "rebuilding_ssb_forREPORT.png"), width = 10, height = 7)

#Spawning output relative to the target
sb_gg <- reshape2::melt(x$relativeb_matrix[,2:ncol(x$relativeb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
#############
sb_gg_nocap <-reshape2::melt(data = x_nocap$relativeb_matrix[,2:ncol(x_nocap$relativeb_matrix)]) #no cap run
sb_gg[1:200,] <- sb_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
sb_gg[1001:1200,] <- sb_gg_nocap[1001:1200,] #replace Tmid values with no cap run
#############
sb_gg[,"Year"] = rep(x$relativeb_matrix[,1], length(2:ncol(x$relativeb_matrix)))
find = which(sb_gg$Year > 2023 & sb_gg$Year <= (x$tmax + 3*x$mean_gen))
ggplot(sb_gg[find,], aes(x = Year, y = SB, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Spawning output relative to 40% spawning output")
ggsave(file.path(rebuild_dir, "write_up", "figures", "rebuilding_relative_sb_forREPORT.png"), width = 10, height = 7)



#####################################################################################################
######################## Post November Council Meeting Figures ######################################
#####################################################################################################


####
#Figures for post November report
#Replaced SPR500 and SPR550 scenarios with no cap runs (Tmid no longer needed)
#Added extra SPR runs (for SPR 0.55 and 0.65)
#Added ramp runs for SPR 0.6 and 0.7
####

frac_fem = 0.5

run <- c(
  "1010_postNov", #same policies as original
  "1010b_no_abc_max",
  "1011_addedSPRruns", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1011b_no_abc_max",
  "1013_ramp0.7_2", #ramp applied and ensured to be more of a ramp for 2024-2025 than 2023-2024, only use SPR 0.7 policy
  "1013_ramp0.6", #ramp applied, only use SPR 0.6 policy
  "1014_ramp0.7", #ramp applied starting above ABC, only use SPR 0.7 policy
  "1014_ramp0.6") #ramp applied starting above ABC, only use SPR 0.6 policy

reb <- list()
for (a in 1:length(run)){
  reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[a]))
}

#############
#Probability Plots
#############
probs_gg <-reshape2::melt(data = reb[[1]]$prob_matrix[,2:ncol(reb[[1]]$prob_matrix)])
colnames(probs_gg)<-c("Year", "Scenario", "Prob")
#############
probs_gg_nocap <-reshape2::melt(data = reb[[2]]$prob_matrix[,2:ncol(reb[[2]]$prob_matrix)]) #no cap run
probs_gg[1:200,] <- probs_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
probs_gg_extra <-reshape2::melt(data = reb[[3]]$prob_matrix[,2:ncol(reb[[3]]$prob_matrix)])
colnames(probs_gg_extra)<-c("Year", "Scenario", "Prob")
##############
probs_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$prob_matrix[,2:ncol(reb[[4]]$prob_matrix)]) #no cap run
probs_gg_extra[201:400,] <- probs_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Add first ramp runs
probs_gg_ramp60 <-reshape2::melt(data = reb[[6]]$prob_matrix[,2:ncol(reb[[6]]$prob_matrix)])
probs_gg_ramp60$Var2 <- paste0(probs_gg_ramp60$Var2,"ramp1")
colnames(probs_gg_ramp60)<-c("Year", "Scenario", "Prob")
probs_gg_ramp70 <-reshape2::melt(data = reb[[5]]$prob_matrix[,2:ncol(reb[[5]]$prob_matrix)])
probs_gg_ramp70$Var2 <- paste0(probs_gg_ramp70$Var2,"ramp1")
colnames(probs_gg_ramp70)<-c("Year", "Scenario", "Prob")
#Add second ramp runs
probs_gg_ramp602 <-reshape2::melt(data = reb[[8]]$prob_matrix[,2:ncol(reb[[8]]$prob_matrix)])
probs_gg_ramp602$Var2 <- paste0(probs_gg_ramp602$Var2,"ramp2")
colnames(probs_gg_ramp602)<-c("Year", "Scenario", "Prob")
probs_gg_ramp702 <-reshape2::melt(data = reb[[7]]$prob_matrix[,2:ncol(reb[[7]]$prob_matrix)])
probs_gg_ramp702$Var2 <- paste0(probs_gg_ramp702$Var2,"ramp2")
colnames(probs_gg_ramp702)<-c("Year", "Scenario", "Prob")
#Combine datasets and reorder scenarios
probs_all <- rbind(probs_gg,
                   probs_gg_extra[probs_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),],
                   probs_gg_ramp60[probs_gg_ramp60$Scenario %in% c("SPR= .600      ramp1"),],
                   probs_gg_ramp602[probs_gg_ramp602$Scenario %in% c("SPR= .600      ramp2"),],
                   probs_gg_ramp70[probs_gg_ramp70$Scenario %in% c("SPR= .700      ramp1"),],
                   probs_gg_ramp702[probs_gg_ramp702$Scenario %in% c("SPR= .700      ramp2"),])
probs_all[,"Year"] <- rep(reb[[1]]$prob_matrix[,1], nrow(probs_all)/200)
probs_all$Scenario <- factor(probs_all$Scenario, levels = c("SPR= .500      ",
                                      "SPR= .550      ",
                                      "SPR= .600      ",
                                      "SPR= .600      ramp1",
                                      "SPR= .600      ramp2",
                                      "SPR= .650      ",
                                      "SPR= .700      ",
                                      "SPR= .700      ramp1",
                                      "SPR= .700      ramp2",
                                      "SPR= .800      ",
                                      "SPR= .900      ",
                                      "Yr=Tmid        ",
                                      "F=0            ",
                                      "40-10 rule     ",
                                      "ABC Rule       "))
head(acast(probs_all, Scenario~Year, value.var = "Prob")[,1:30],10) #test to ensure ramps are different

#Plot
find = which(probs_all$Prob <=1.0 & probs_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot2::ggplot(probs_all[find,], aes(x = Year,y = Prob, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Probability Relative Spawning Output > 40% Spawning Output")
ggsave(file.path(rebuild_dir, "write_up_postNov", "figures", "rebuilding_probability_forREPORT.png"), width = 10, height = 7)


#############
#Catches
#############
acl_gg <- reshape2::melt(reb[[1]]$acl_matrix[,2:ncol(reb[[1]]$acl_matrix)])
colnames(acl_gg)<-c("Year", "Scenario", "Catch")
#############
acl_gg_nocap <-reshape2::melt(data = reb[[2]]$acl_matrix[,2:ncol(reb[[2]]$acl_matrix)]) #no cap run
acl_gg[1:200,] <- acl_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
acl_gg_extra <-reshape2::melt(data = reb[[3]]$acl_matrix[,2:ncol(reb[[3]]$acl_matrix)])
colnames(acl_gg_extra)<-c("Year", "Scenario", "Catch")
##############
acl_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$acl_matrix[,2:ncol(reb[[4]]$acl_matrix)]) #no cap run
acl_gg_extra[201:400,] <- acl_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Add first ramp runs
acl_gg_ramp60 <-reshape2::melt(data = reb[[6]]$acl_matrix[,2:ncol(reb[[6]]$acl_matrix)])
acl_gg_ramp60$Var2 <- paste0(acl_gg_ramp60$Var2,"ramp1")
colnames(acl_gg_ramp60)<-c("Year", "Scenario", "Catch")
acl_gg_ramp70 <-reshape2::melt(data = reb[[5]]$acl_matrix[,2:ncol(reb[[5]]$acl_matrix)])
acl_gg_ramp70$Var2 <- paste0(acl_gg_ramp70$Var2,"ramp1")
colnames(acl_gg_ramp70)<-c("Year", "Scenario", "Catch")
#Add second ramp runs
acl_gg_ramp602 <-reshape2::melt(data = reb[[8]]$acl_matrix[,2:ncol(reb[[8]]$acl_matrix)])
acl_gg_ramp602$Var2 <- paste0(acl_gg_ramp602$Var2,"ramp2")
colnames(acl_gg_ramp602)<-c("Year", "Scenario", "Catch")
acl_gg_ramp702 <-reshape2::melt(data = reb[[7]]$acl_matrix[,2:ncol(reb[[7]]$acl_matrix)])
acl_gg_ramp702$Var2 <- paste0(acl_gg_ramp702$Var2,"ramp2")
colnames(acl_gg_ramp702)<-c("Year", "Scenario", "Catch")
#Combine datasets and reorder scenarios
acl_all <- rbind(acl_gg,
                   acl_gg_extra[acl_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),],
                   acl_gg_ramp60[acl_gg_ramp60$Scenario %in% c("SPR= .600      ramp1"),],
                   acl_gg_ramp602[acl_gg_ramp602$Scenario %in% c("SPR= .600      ramp2"),],
                   acl_gg_ramp70[acl_gg_ramp70$Scenario %in% c("SPR= .700      ramp1"),],
                   acl_gg_ramp702[acl_gg_ramp702$Scenario %in% c("SPR= .700      ramp2"),])
acl_all[,"Year"] = rep(reb[[1]]$acl_matrix[,1], nrow(acl_all)/200)
acl_all$Scenario <- factor(acl_all$Scenario, levels = c("SPR= .500      ",
                                                            "SPR= .550      ",
                                                            "SPR= .600      ",
                                                            "SPR= .600      ramp1",
                                                            "SPR= .600      ramp2",
                                                            "SPR= .650      ",
                                                            "SPR= .700      ",
                                                            "SPR= .700      ramp1",
                                                            "SPR= .700      ramp2",
                                                            "SPR= .800      ",
                                                            "SPR= .900      ",
                                                            "Yr=Tmid        ",
                                                            "F=0            ",
                                                            "40-10 rule     ",
                                                            "ABC Rule       "))
head(acast(acl_all, Scenario~Year, value.var = "Catch")[,1:10],10) #test to ensure ramps are different

#Plot
find = which(acl_all$Year > 2022 & acl_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot2::ggplot(acl_all[find,], aes(x = Year, y = Catch, color = Scenario)) + 
  geom_line(lwd=1.5) + ylab("Catches (mt)")
ggsave(file.path(rebuild_dir, "write_up_postNov", "figures", "rebuilding_acl_forREPORT.png"), width = 10, height = 7)


#############
#Spawning output
#############
#Set frac female in 2sex model to 1 so plot just SSB. Keep at 0.5 for all others
sb_gg <- reshape2::melt(reb[[1]]$ssb_matrix[,2:ncol(reb[[1]]$ssb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
#############
sb_gg_nocap <-reshape2::melt(data = reb[[2]]$ssb_matrix[,2:ncol(reb[[2]]$ssb_matrix)]) #no cap run
sb_gg[1:200,] <- sb_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
sb_gg_extra <-reshape2::melt(data = reb[[3]]$ssb_matrix[,2:ncol(reb[[3]]$ssb_matrix)])
colnames(sb_gg_extra)<-c("Year", "Scenario", "SB")
##############
sb_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$ssb_matrix[,2:ncol(reb[[4]]$ssb_matrix)]) #no cap run
sb_gg_extra[201:400,] <- sb_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Add first ramp runs
sb_gg_ramp60 <-reshape2::melt(data = reb[[6]]$ssb_matrix[,2:ncol(reb[[6]]$ssb_matrix)])
sb_gg_ramp60$Var2 <- paste0(sb_gg_ramp60$Var2,"ramp1")
colnames(sb_gg_ramp60)<-c("Year", "Scenario", "SB")
sb_gg_ramp70 <-reshape2::melt(data = reb[[5]]$ssb_matrix[,2:ncol(reb[[5]]$ssb_matrix)])
sb_gg_ramp70$Var2 <- paste0(sb_gg_ramp70$Var2,"ramp1")
colnames(sb_gg_ramp70)<-c("Year", "Scenario", "SB")
#Add second ramp runs
sb_gg_ramp602 <-reshape2::melt(data = reb[[8]]$ssb_matrix[,2:ncol(reb[[8]]$ssb_matrix)])
sb_gg_ramp602$Var2 <- paste0(sb_gg_ramp602$Var2,"ramp2")
colnames(sb_gg_ramp602)<-c("Year", "Scenario", "SB")
sb_gg_ramp702 <-reshape2::melt(data = reb[[7]]$ssb_matrix[,2:ncol(reb[[7]]$ssb_matrix)])
sb_gg_ramp702$Var2 <- paste0(sb_gg_ramp702$Var2,"ramp2")
colnames(sb_gg_ramp702)<-c("Year", "Scenario", "SB")
#Combine datasets and reorder scenarios
sb_all <- rbind(sb_gg,
                 sb_gg_extra[sb_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),],
                 sb_gg_ramp60[sb_gg_ramp60$Scenario %in% c("SPR= .600      ramp1"),],
                 sb_gg_ramp602[sb_gg_ramp602$Scenario %in% c("SPR= .600      ramp2"),],
                 sb_gg_ramp70[sb_gg_ramp70$Scenario %in% c("SPR= .700      ramp1"),],
                 sb_gg_ramp702[sb_gg_ramp702$Scenario %in% c("SPR= .700      ramp2"),])
sb_all[,"Year"] = rep(reb[[1]]$ssb_matrix[,1], nrow(sb_all)/200)
sb_all$Scenario <- factor(sb_all$Scenario, levels = c("SPR= .500      ",
                                                        "SPR= .550      ",
                                                        "SPR= .600      ",
                                                        "SPR= .600      ramp1",
                                                        "SPR= .600      ramp2",
                                                        "SPR= .650      ",
                                                        "SPR= .700      ",
                                                        "SPR= .700      ramp1",
                                                        "SPR= .700      ramp2",
                                                        "SPR= .800      ",
                                                        "SPR= .900      ",
                                                        "Yr=Tmid        ",
                                                        "F=0            ",
                                                        "40-10 rule     ",
                                                        "ABC Rule       "))
head(acast(sb_all, Scenario~Year, value.var = "SB")[,1:10],10) #test to ensure ramps are different

#Plot
find = which(sb_all$Year > 2022 & sb_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot(sb_all[find,], aes(x = Year, y = SB*frac_fem, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Spawning output")
ggsave(file.path(rebuild_dir, "write_up_postNov", "figures", "rebuilding_ssb_forREPORT.png"), width = 10, height = 7)


#############
#Spawning output relative to the target
#############
sb_gg <- reshape2::melt(reb[[1]]$relativeb_matrix[,2:ncol(reb[[1]]$relativeb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
#############
sb_gg_nocap <-reshape2::melt(data = reb[[2]]$relativeb_matrix[,2:ncol(reb[[2]]$relativeb_matrix)]) #no cap run
sb_gg[1:200,] <- sb_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
sb_gg_extra <-reshape2::melt(data = reb[[3]]$relativeb_matrix[,2:ncol(reb[[3]]$relativeb_matrix)])
colnames(sb_gg_extra)<-c("Year", "Scenario", "SB")
##############
sb_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$relativeb_matrix[,2:ncol(reb[[4]]$relativeb_matrix)]) #no cap run
sb_gg_extra[201:400,] <- sb_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Add first ramp runs
sb_gg_ramp60 <-reshape2::melt(data = reb[[6]]$relativeb_matrix[,2:ncol(reb[[6]]$relativeb_matrix)])
sb_gg_ramp60$Var2 <- paste0(sb_gg_ramp60$Var2,"ramp1")
colnames(sb_gg_ramp60)<-c("Year", "Scenario", "SB")
sb_gg_ramp70 <-reshape2::melt(data = reb[[5]]$relativeb_matrix[,2:ncol(reb[[5]]$relativeb_matrix)])
sb_gg_ramp70$Var2 <- paste0(sb_gg_ramp70$Var2,"ramp1")
colnames(sb_gg_ramp70)<-c("Year", "Scenario", "SB")
#Add second ramp runs
sb_gg_ramp602 <-reshape2::melt(data = reb[[8]]$relativeb_matrix[,2:ncol(reb[[8]]$relativeb_matrix)])
sb_gg_ramp602$Var2 <- paste0(sb_gg_ramp602$Var2,"ramp2")
colnames(sb_gg_ramp602)<-c("Year", "Scenario", "SB")
sb_gg_ramp702 <-reshape2::melt(data = reb[[7]]$relativeb_matrix[,2:ncol(reb[[7]]$relativeb_matrix)])
sb_gg_ramp702$Var2 <- paste0(sb_gg_ramp702$Var2,"ramp2")
colnames(sb_gg_ramp702)<-c("Year", "Scenario", "SB")
#Combine datasets and reorder scenarios
sb_all <- rbind(sb_gg,
                sb_gg_extra[sb_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),],
                sb_gg_ramp60[sb_gg_ramp60$Scenario %in% c("SPR= .600      ramp1"),],
                sb_gg_ramp602[sb_gg_ramp602$Scenario %in% c("SPR= .600      ramp2"),],
                sb_gg_ramp70[sb_gg_ramp70$Scenario %in% c("SPR= .700      ramp1"),],
                sb_gg_ramp702[sb_gg_ramp702$Scenario %in% c("SPR= .700      ramp2"),])
sb_all[,"Year"] = rep(reb[[1]]$relativeb_matrix[,1], nrow(sb_all)/200)
sb_all$Scenario <- factor(sb_all$Scenario, levels = c("SPR= .500      ",
                                                      "SPR= .550      ",
                                                      "SPR= .600      ",
                                                      "SPR= .600      ramp1",
                                                      "SPR= .600      ramp2",
                                                      "SPR= .650      ",
                                                      "SPR= .700      ",
                                                      "SPR= .700      ramp1",
                                                      "SPR= .700      ramp2",
                                                      "SPR= .800      ",
                                                      "SPR= .900      ",
                                                      "Yr=Tmid        ",
                                                      "F=0            ",
                                                      "40-10 rule     ",
                                                      "ABC Rule       "))
head(acast(sb_all, Scenario~Year, value.var = "SB")[,1:10],10) #test to ensure ramps are different

#Plot
find = which(sb_all$Year > 2022 & sb_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot(sb_all[find,], aes(x = Year, y = SB, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Spawning output relative to 40% spawning output")
ggsave(file.path(rebuild_dir, "write_up_postNov", "figures", "rebuilding_relative_sb_forREPORT.png"), width = 10, height = 7)



#####################################################################################################
######################## 2023 Rebuilding Analysis Figures ######################################
#####################################################################################################


####
#Figures for 2023 rebuilding
#Replaced SPR500 and SPR550 scenarios with no cap runs
#Added extra SPR runs (for SPR 0.55 and 0.65)
####

#Copy the write_up_postNov directory to write_up_2023rebuild and remove unneeded files
if(!dir.exists(file.path(wd, 'rebuilder', "write_up_2023rebuild"))){
  dir.create(file.path(wd, "rebuilder", "write_up_2023rebuild"))
  
  my_files <- list.files(file.path(wd, "rebuilder", "write_up_postNov"))
  my_files <- my_files[-grep(".docx|.pdf",my_files)]
  file.copy(from = file.path(wd, "rebuilder", "write_up_postNov", my_files), 
            to = file.path(wd, "rebuilder", "write_up_2023rebuild", my_files))
  
  #the figure subdirectory doesn't copy over as a folder so remove and recreate
  file.remove(file.path(wd, "rebuilder", "write_up_2023rebuild", "figures"))
  dir.create(file.path(wd, "rebuilder", "write_up_2023rebuild", "figures"))
}

frac_fem = 0.5

run <- c(
  "1100_2023", #same policies as original
  "1100b_no_abc_max",
  "1101_addedSPRruns", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1101b_no_abc_max")

#If want the alternative catch runs use these (rename figures "ALT")
run <- c(
  "1200_2023altCatch", #same policies as original
  "1200b_no_abc_max",
  "1201_addedSPRruns", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1201b_no_abc_max")

#If want the original GMT catch runs but relative Fs set to approximate fleet specific catch use these (rename figures "relF")
run <- c(
  "1110_2023_relF", #same policies as original
  "1110b_no_abc_max_relF",
  "1111_addedSPRruns_relF", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1111b_no_abc_max_relF")

#If want the alternative catch runs but relative Fs set to approximate fleet specific catch use these (rename figures "ALTrelF")
run <- c(
  "1210_2023altCatch_relF", #same policies as original
  "1210b_no_abc_max_relF",
  "1211_addedSPRruns_relF", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1211b_no_abc_max_relF")


reb <- list()
for (a in 1:length(run)){
  reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[a]))
}

#############
#Probability Plots
#############
probs_gg <-reshape2::melt(data = reb[[1]]$prob_matrix[,2:ncol(reb[[1]]$prob_matrix)])
colnames(probs_gg)<-c("Year", "Scenario", "Prob")
#############
probs_gg_nocap <-reshape2::melt(data = reb[[2]]$prob_matrix[,2:ncol(reb[[2]]$prob_matrix)]) #no cap run
probs_gg[1:200,] <- probs_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
probs_gg_extra <-reshape2::melt(data = reb[[3]]$prob_matrix[,2:ncol(reb[[3]]$prob_matrix)])
colnames(probs_gg_extra)<-c("Year", "Scenario", "Prob")
##############
probs_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$prob_matrix[,2:ncol(reb[[4]]$prob_matrix)]) #no cap run
probs_gg_extra[201:400,] <- probs_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Combine datasets and reorder scenarios
probs_all <- rbind(probs_gg,
                   probs_gg_extra[probs_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),])
probs_all[,"Year"] <- rep(reb[[1]]$prob_matrix[,1], nrow(probs_all)/200)
probs_all$Scenario <- factor(probs_all$Scenario, levels = c("SPR= .500      ",
                                                            "SPR= .550      ",
                                                            "SPR= .600      ",
                                                            "SPR= .650      ",
                                                            "SPR= .700      ",
                                                            "SPR= .800      ",
                                                            "SPR= .900      ",
                                                            "Yr=Tmid        ",
                                                            "F=0            ",
                                                            "40-10 rule     ",
                                                            "ABC Rule       "))
head(acast(probs_all, Scenario~Year, value.var = "Prob")[,1:30],10) #test to ensure ramps are different

#Plot
find = which(probs_all$Prob <=1.0 & probs_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot2::ggplot(probs_all[find,], aes(x = Year,y = Prob, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Probability Relative Spawning Output > 40% Spawning Output") +
  geom_point(aes(shape = Scenario), size = 3, data = subset(probs_all[find,], Year %% 10 == 1)) + #only plot every 10th label
  scale_color_manual(values = RColorBrewer::brewer.pal(length(unique(probs_all$Scenario)), "RdYlBu")) +
  scale_shape_manual(values = c(0,1,2,3,4,5,6,8,15,16,17))
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_probability_forREPORT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_probability_forREPORT_ALT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_probability_forREPORT_relF.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_probability_forREPORT_ALTrelF.png"), width = 10, height = 7)


#############
#Catches
#############
acl_gg <- reshape2::melt(reb[[1]]$acl_matrix[,2:ncol(reb[[1]]$acl_matrix)])
colnames(acl_gg)<-c("Year", "Scenario", "Catch")
#############
acl_gg_nocap <-reshape2::melt(data = reb[[2]]$acl_matrix[,2:ncol(reb[[2]]$acl_matrix)]) #no cap run
acl_gg[1:200,] <- acl_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
acl_gg_extra <-reshape2::melt(data = reb[[3]]$acl_matrix[,2:ncol(reb[[3]]$acl_matrix)])
colnames(acl_gg_extra)<-c("Year", "Scenario", "Catch")
##############
acl_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$acl_matrix[,2:ncol(reb[[4]]$acl_matrix)]) #no cap run
acl_gg_extra[201:400,] <- acl_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Combine datasets and reorder scenarios
acl_all <- rbind(acl_gg,
                 acl_gg_extra[acl_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),])
acl_all[,"Year"] = rep(reb[[1]]$acl_matrix[,1], nrow(acl_all)/200)
acl_all$Scenario <- factor(acl_all$Scenario, levels = c("SPR= .500      ",
                                                        "SPR= .550      ",
                                                        "SPR= .600      ",
                                                        "SPR= .650      ",
                                                        "SPR= .700      ",
                                                        "SPR= .800      ",
                                                        "SPR= .900      ",
                                                        "Yr=Tmid        ",
                                                        "F=0            ",
                                                        "40-10 rule     ",
                                                        "ABC Rule       "))
head(acast(acl_all, Scenario~Year, value.var = "Catch")[,1:10],10) #test to ensure ramps are different

#Plot
find = which(acl_all$Year > 2024 & acl_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot2::ggplot(acl_all[find,], aes(x = Year, y = Catch, color = Scenario)) + 
  geom_line(lwd=1.5) + ylab("Catches (mt)") +
  geom_point(aes(shape = Scenario), size = 3, data = subset(acl_all[find,], Year %% 10 == 1)) + #only plot every 10th label
  scale_color_manual(values = RColorBrewer::brewer.pal(length(unique(acl_all$Scenario)), "RdYlBu")) +
  scale_shape_manual(values = c(0,1,2,3,4,5,6,8,15,16,17))
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_acl_forREPORT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_acl_forREPORT_ALT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_acl_forREPORT_relF.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_acl_forREPORT_ALTrelF.png"), width = 10, height = 7)


#############
#Spawning output
#############
#Set frac female in 2sex model to 1 so plot just SSB. Keep at 0.5 for all others
sb_gg <- reshape2::melt(reb[[1]]$ssb_matrix[,2:ncol(reb[[1]]$ssb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
#############
sb_gg_nocap <-reshape2::melt(data = reb[[2]]$ssb_matrix[,2:ncol(reb[[2]]$ssb_matrix)]) #no cap run
sb_gg[1:200,] <- sb_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
sb_gg_extra <-reshape2::melt(data = reb[[3]]$ssb_matrix[,2:ncol(reb[[3]]$ssb_matrix)])
colnames(sb_gg_extra)<-c("Year", "Scenario", "SB")
##############
sb_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$ssb_matrix[,2:ncol(reb[[4]]$ssb_matrix)]) #no cap run
sb_gg_extra[201:400,] <- sb_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Combine datasets and reorder scenarios
sb_all <- rbind(sb_gg,
                sb_gg_extra[sb_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),])
sb_all[,"Year"] = rep(reb[[1]]$ssb_matrix[,1], nrow(sb_all)/200)
sb_all$Scenario <- factor(sb_all$Scenario, levels = c("SPR= .500      ",
                                                      "SPR= .550      ",
                                                      "SPR= .600      ",
                                                      "SPR= .650      ",
                                                      "SPR= .700      ",
                                                      "SPR= .800      ",
                                                      "SPR= .900      ",
                                                      "Yr=Tmid        ",
                                                      "F=0            ",
                                                      "40-10 rule     ",
                                                      "ABC Rule       "))
head(acast(sb_all, Scenario~Year, value.var = "SB")[,1:10],10) #test to ensure ramps are different

#Plot
find = which(sb_all$Year > 2024 & sb_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot(sb_all[find,], aes(x = Year, y = SB*frac_fem, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Spawning output") +
  geom_point(aes(shape = Scenario), size = 3, data = subset(sb_all[find,], Year %% 10 == 1)) + #only plot every 10th label
  scale_color_manual(values = RColorBrewer::brewer.pal(length(unique(sb_all$Scenario)), "RdYlBu")) +
  scale_shape_manual(values = c(0,1,2,3,4,5,6,8,15,16,17))
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_ssb_forREPORT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_ssb_forREPORT_ALT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_ssb_forREPORT_relF.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_ssb_forREPORT_ALTrelF.png"), width = 10, height = 7)


#############
#Spawning output relative to the target
#############
sb_gg <- reshape2::melt(reb[[1]]$relativeb_matrix[,2:ncol(reb[[1]]$relativeb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
#############
sb_gg_nocap <-reshape2::melt(data = reb[[2]]$relativeb_matrix[,2:ncol(reb[[2]]$relativeb_matrix)]) #no cap run
sb_gg[1:200,] <- sb_gg_nocap[1:200,] #replace SPR = 0.500 values with no cap run
#############
#Add SPR 0.55 and 0.65 runs
sb_gg_extra <-reshape2::melt(data = reb[[3]]$relativeb_matrix[,2:ncol(reb[[3]]$relativeb_matrix)])
colnames(sb_gg_extra)<-c("Year", "Scenario", "SB")
##############
sb_gg_extra_nocap <-reshape2::melt(data = reb[[4]]$relativeb_matrix[,2:ncol(reb[[4]]$relativeb_matrix)]) #no cap run
sb_gg_extra[201:400,] <- sb_gg_extra_nocap[201:400,] #replace SPR = 0.550 values with no cap run
#############
#Combine datasets and reorder scenarios
sb_all <- rbind(sb_gg,
                sb_gg_extra[sb_gg_extra$Scenario %in% c("SPR= .550      ", "SPR= .650      "),])
sb_all[,"Year"] = rep(reb[[1]]$relativeb_matrix[,1], nrow(sb_all)/200)
sb_all$Scenario <- factor(sb_all$Scenario, levels = c("SPR= .500      ",
                                                      "SPR= .550      ",
                                                      "SPR= .600      ",
                                                      "SPR= .650      ",
                                                      "SPR= .700      ",
                                                      "SPR= .800      ",
                                                      "SPR= .900      ",
                                                      "Yr=Tmid        ",
                                                      "F=0            ",
                                                      "40-10 rule     ",
                                                      "ABC Rule       "))
head(acast(sb_all, Scenario~Year, value.var = "SB")[,1:10],10) #test to ensure ramps are different

#Plot
find = which(sb_all$Year > 2024 & sb_all$Year <= (reb[[1]]$tmax + 3*reb[[1]]$mean_gen))
ggplot(sb_all[find,], aes(x = Year, y = SB, color = Scenario)) + 
  geom_line(lwd = 1.5) + ylab("Spawning output relative to 40% spawning output") +
  geom_point(aes(shape = Scenario), size = 3, data = subset(sb_all[find,], Year %% 10 == 1)) + #only plot every 10th label
  scale_color_manual(values = RColorBrewer::brewer.pal(length(unique(sb_all$Scenario)), "RdYlBu")) +
  scale_shape_manual(values = c(0,1,2,3,4,5,6,8,15,16,17))
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_relative_sb_forREPORT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_relative_sb_forREPORT_ALT.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_relative_sb_forREPORT_relF.png"), width = 10, height = 7)
# ggsave(file.path(rebuild_dir, "write_up_2023rebuild", "figures", "rebuilding_relative_sb_forREPORT_ALTrelF.png"), width = 10, height = 7)
