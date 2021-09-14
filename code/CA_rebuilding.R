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
#i SHA-1 hash of file is 7bdea98ad6a4ef578ae93a9619973e59cc29a1c5

source_url("https://raw.githubusercontent.com/r4ss/r4ss/main/R/RebuildPlot.R")
#i SHA-1 hash of file is 741ae49399d34dc12492088ecc2d1c3c93666e56

#Rebuilding analysis folder
dir = "C:/Users/Brian.Langseth/Desktop/ca"

# Set the working directory where runs are located
rebuild_dir = file.path(dir, "rebuilder")

####
#Copy Chantel's script for running rebuilder for states of nature
#Revise to apply to mine, which are based on M, not R0
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

setwd(file.path(rebuild_dir, 'states_of_nature_910'))
dirs <- dir()
states <- r4ss::SSgetoutput(dirvec = paste(getwd(), dirs, sep = "/"), getcovar = FALSE)
summaries <- r4ss::SSsummarize(states)

# Double check that the rebuildblend file appears to have the correct values from the state of nature models
a1 <- unique(sort(as.numeric(substring(rebuildblend[grep("#mean M", rebuildblend, fixed = TRUE)], 1, 7))))

# Now run the rebuilder using the "rebuild_m_states_2021.dat" by placing in folder
# with exe file and rebuild.data file. Need to enter the name of this file into the 
# rebuild.dat file under the "# File with multiple parameter vectors " section


#Now doing it for 921

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

setwd(file.path(rebuild_dir, 'states_of_nature_921'))
dirs <- dir()
states <- r4ss::SSgetoutput(dirvec = paste(getwd(), dirs, sep = "/"), getcovar = FALSE)
summaries <- r4ss::SSsummarize(states)

# Double check that the rebuildblend file appears to have the correct values from the state of nature models
a1 <- unique(sort(as.numeric(substring(rebuildblend[grep("#mean M", rebuildblend, fixed = TRUE)], 1, 7))))





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
  "931_no_abc_max",
  "940_recComBlock2001",
  "941_no_abc_max")
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
