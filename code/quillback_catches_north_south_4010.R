##############################################################################################################
#
# 	Purpose: Output Quillback Rockfish Landings for California North and South of 40'10 Degrees Latitude
#
# This script is copied and adjusted from quillback_catches_for_model.R
#
#			  by Brian Langseth 
#
##############################################################################################################

library(dplyr)
library(tidyr)
options(stringsAsFactors = FALSE)
library(dataModerate2021)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"

#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Load the recreational data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################

#California - 2005-2020 Total removals
ca_rec = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Data_From_States/ca/ca_rec_catch_all_2005-2019_crfs.csv")
ca_rec = ca_rec[ca_rec$Species.Name == "QUILLBACK ROCKFISH", ]
#Update with 2020 data
ca_rec_2020 = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/RecFIN Catch/RecFIN_Quillback_CTE001-California-2020.csv")


#################################################################################################################
# Evaluate the recreational data and allocate north and south of 40-10
#################################################################################################################

#California-----------------------------------------------
#RecFIN years
# RecFIN years
ca_rec$area = recfin_areas(data = ca_rec, 
                            area_grouping = list(c("CHANNEL", "SOUTH","BAY AREA", "WINE", "CENTRAL"), ("REDWOOD")), 
                            area_names  = c("south_4010", "north_4010"), 
                            column_name = "RecFIN.Port.Name")
ca_rec_table = aggregate(Total.Mortality.MT ~ RecFIN.Year + area, data = ca_rec, FUN = sum)
names(ca_rec_table) = c("Year", "area", "tot_mort_mt")

#2020
table(ca_rec$RecFIN.Port.Name)
ca_rec_2020$area = recfin_areas(data = ca_rec_2020, 
                            area_grouping = list(c("CHANNEL", "SOUTH","BAY AREA", "WINE", "CENTRAL"), ("REDWOOD")), 
                            area_names  = c("south_4010", "north_4010"), 
                            column_name = "DISTRICT_NAME")
ca_rec_table_2020 = aggregate(SUM_TOTAL_MORTALITY_MT ~ RECFIN_YEAR + area, data = ca_rec_2020, FUN = sum)
names(ca_rec_table_2020) = c("Year", "area", "tot_mort_mt")



#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Load the commercial data
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################
# PacFIN Commercial - 1984-2020 Landings lbs
load(file.path(dir, "PacFIN Catch", "QLBK.CompFT.20.Aug.2020.RData"))
com = QLBK.CompFT.20.Aug.2020
rm(QLBK.CompFT.20.Aug.2020)
load(file.path(dir, "PacFIN Catch", "QLBK.CompFT.21.Feb.2021.RData"))
com_2020 = data
rm(data)


#################################################################################################################
# Evaluate the commercial data and allocate north and south of 40-10
#################################################################################################################

#PacFin-----------------------------------
com$round_mt = com$CATCH.LBS / 2204.62262
#remove research catches
com = com[!com$REMOVAL_TYPE %in% c("R"), ]
com_2020 = com_2020[!com_2020$REMOVAL_TYPE_CODE %in% c("R"), ]
#restrict to CA only and <2021 (for 2020 data)
com = com[com$AGID == "C",]
com_2020 = com_2020[com_2020$AGENCY_CODE == "C",]
com_2020 = com_2020[com_2020$LANDING_YEAR < 2021,]
#Calculate catch by area
# Mel Mandrup (CDFW) also suggest looking by "PORT" because records listed from 
# PACFIN_PORT_NAME (or PCID) of "O HUMBOLDT" should be broken down as a finer scale for north and south
# which the PORT field will allow you to do. The PORTS that are north of 4010 from 
# PACFIN_PORT_NAME == "O HUMBOLDT" are c("GARBERVILLE", "RUTH", "SHELTER COVER", "MIRANDA").
# There are many landing records for quillback with "O HUMBOLDT".
# The "com" data do not include the update PORT field, however because com_2020 produces more or less 
# the same catches as com (with the exception of 2020) use com_2020 only
#tmp = aggregate(com$round_mt, list(year = com$YEAR, area = com$AGID), FUN = sum, drop = FALSE)
#tmp_2020 = aggregate(com_2020$ROUND_WEIGHT_MTONS, list(year = com_2020$LANDING_YEAR, area = com_2020$AGENCY_CODE), FUN = sum, drop = FALSE)
#tmp[tmp$year %in% c(1984:2020),"x"] - tmp_2020[tmp_2020$year %in% c(1984:2020),"x"]
com_2020$area = "south_4010"
com_2020[com_2020$PACFIN_PORT_NAME %in% c("EUREKA", "CRESCENT", "FIELDS LDG", "TRINIDAD"), 'area'] = 'north_4010'
com_2020[com_2020$PORT_NAME %in% c("GARBERVILLE", "RUTH", "SHELTER COVER", "MIRANDA"), 'area'] = 'north_4010'

#Aggregate by area north and south of 4010
com_agg_byarea = aggregate(com_2020$ROUND_WEIGHT_MTONS, list(year = com_2020$LANDING_YEAR, state = com_2020$AGENCY_CODE, area = com_2020$area), FUN = sum, drop = FALSE, na.rm = TRUE)


#Now add discard rates to commercial data------------
#Take mean of 2002 to 2018 (since 2019 showed increases due to changes in regulation).
#source("U:/Stock assessments/quillback_rockfish_2021/code/quillback_discard_exploration.R") #This changes dir
source("U:/Stock assessments/quillback_rockfish_2021/code/quillback_discard_exploration_north_south_4010.R") #This changes dir
#Need to aggregate over areas to calculate discard rate
com_agg = aggregate(com_2020$ROUND_WEIGHT_MTONS, list(year = com_2020$LANDING_YEAR, state = com_2020$AGENCY_CODE), FUN = sum, drop = FALSE, na.rm = TRUE)
ca_com_discard_rate = 1 + mean(dead[dead$Year %in% c(2002:2018), "ca"] / 
  (dead[dead$Year %in% c(2002:2018), "ca"] + com_agg[com_agg$year %in% c(2002:2018),"x"]))
#Im keeping the overall CA discard rate (it only applies to 2020)

#Add discards to landings - Right now applying historical discard rate to 2020
com_mort_byarea = com_agg_byarea
com_mort_byarea[!com_mort_byarea$year %in% dead_4010$Year, "x"] = com_mort_byarea[!com_mort_byarea$year %in% dead_4010$Year,"x"] * ca_com_discard_rate
com_mort_byarea[com_mort_byarea$year %in% dead_4010$Year & com_mort_byarea$area == "north_4010" , "x"] = com_mort_byarea[com_mort_byarea$year %in% dead_4010$Year & com_mort_byarea$area == "north_4010" , "x"] + dead_4010$ca_north
com_mort_byarea[com_mort_byarea$year %in% dead_4010$Year & com_mort_byarea$area == "south_4010" , "x"] = com_mort_byarea[com_mort_byarea$year %in% dead_4010$Year & com_mort_byarea$area == "south_4010" , "x"] + dead_4010$ca_south


#################################################################################################################
#---------------------------------------------------------------------------------------------------------------#
# Calculate the proportions
#---------------------------------------------------------------------------------------------------------------#
#################################################################################################################


rec_agg_byarea = rbind(ca_rec_table, ca_rec_table_2020)
rec_agg_byarea$type = "rec"
com_agg_byarea$type = "com" 
com_mort_byarea$type = "com_mort" 

full_all = cbind(rec_agg_byarea[rec_agg_byarea$area == "north_4010",],
      rec_agg_byarea[rec_agg_byarea$area == "south_4010",],
      com_agg_byarea[com_agg_byarea$year %in% c(2005:2020) & com_agg_byarea$area == "north_4010",],
      com_agg_byarea[com_agg_byarea$year %in% c(2005:2020) & com_agg_byarea$area == "south_4010",],
      com_mort_byarea[com_mort_byarea$year %in% c(2005:2020) & com_mort_byarea$area == "north_4010",],
      com_mort_byarea[com_mort_byarea$year %in% c(2005:2020) & com_mort_byarea$area == "south_4010",])
full = full_all[,c(1,3,7,12,17,22,27)]
names(full) = c("Year","recN","recS","comN","comS","comN_mort","comS_mort")

#From 2005-2020 including commercial discard estimates
sum(full[,"recN"] + full[,"comN_mort"]) / sum(full[,"recS"] + full[,"comS_mort"] + full[,"recN"] + full[,"comN_mort"]) #49.59% of catches are from north
#From 2010-2020 including commercial discard estimates
sum(full[6:16,"recN"] + full[6:16,"comN_mort"]) / sum(full[6:16,"recS"] + full[6:16,"comS_mort"] + full[6:16,"recN"] + full[6:16,"comN_mort"]) #49.48% of catches are from north
#From 2015-2020 including commercial discard estimates
sum(full[11:16,"recN"] + full[11:16,"comN_mort"]) / sum(full[11:16,"recS"] + full[11:16,"comS_mort"] + full[11:16,"recN"] + full[11:16,"comN_mort"]) #45.8% of catches are from north

#From 2005-2020 if excluding commercial discards makes very little difference
sum(full[,"recN"] + full[,"comN"]) / sum(full[,"recS"] + full[,"comS"] + full[,"recN"] + full[,"comN"]) #49.13% 

#Adding plot of rates by year (using mortality)
byyear = (full[,"recN"] + full[,"comN_mort"])/(full[,"recS"] + full[,"comS_mort"] + full[,"recN"] + full[,"comN_mort"])
png(file = file.path("C:/Users/Brian.Langseth/Desktop/ca", "write_up", "figures", "catch_allocation_4010.png"), 
    width = 8, height = 5, units = "in", res = 300)
plot(byyear, x = 2005:2020, xlab = "Year", ylab = "Proportion North of 40`10", ylim = c(0,1), pch = 19)
abline(h = 0.496, lty = 2)
dev.off()      

