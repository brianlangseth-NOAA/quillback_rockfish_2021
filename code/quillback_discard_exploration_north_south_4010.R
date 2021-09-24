##############################################################################################################
#
# 	Purpose: Evaluate quillback rockfish discarding
# 		by source, fishery, and across time.
#
#   To break down numbers of dead discards broken down by north and south of 4010 for california
#     Primarily this script is a copy of "quillback_discard_exploration.R"
#     Used in determining allocation of catches to north and south of 4010 for california
#
#			  by Brian Langseth 
#
##############################################################################################################

library(dplyr)
options(stringsAsFactors = FALSE)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data/PacFIN Catch"

#-----------------------------------------------------------------------------------
# Load the GEMM - the GEMM includes information for commercial 
#-----------------------------------------------------------------------------------
# The gemm splits data north and south of 40 10
gemm_all = read.csv(file.path(dir, "GEMM_2019_8_15_2020.csv"))

#---------------------------------------------------------------------------------------------
# Quillback rockfish in the GEMM data
#---------------------------------------------------------------------------------------------
gemm = gemm_all[gemm_all$Species == "Quillback Rockfish", ]

# Remove the research removals -- 
# Research removals are generally not included with commercial landings (although this does not need to be the case)
# however, removing them here allows you to correctly calculate the discard rate based on commercial data only
#gemm = gemm[!gemm$Sector %in% "Research", ] 

aggregate(Landings~Sector, data = gemm, FUN = sum)
aggregate(Discards~Sector, data = gemm, FUN = sum)
aggregate(Discard.Mortality~Sector, data = gemm, FUN = sum)

gemm$grouped_sector = NA
gemm$grouped_sector[gemm$Sector == "Washington Recreational"] = "wa_rec"
gemm$grouped_sector[gemm$Sector == "California Recreational"] = "ca_rec"
gemm$grouped_sector[gemm$Sector == "Oregon Recreational"] = "or_rec"
gemm$grouped_sector[is.na(gemm$grouped_sector)] = "commercial"

landings  = aggregate(Landings ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
discards  = aggregate(Discards ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
disc_mort = aggregate(Discard.Mortality ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
all_dead  = aggregate(Mortality..Landings.and.Discard.Mortality. ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)

all = data.frame(Year = landings$Year,
				 Area = landings$grouped_sector,
				 Landings = landings$Landings,
				 Discard = discards$Discards,
				 Dead_Discard = disc_mort$Discard.Mortality,
				 Tot_Dead = all_dead$Mortality..Landings.and.Discard.Mortality.)

all[is.na(all)] = 0

all$Discard_Mort_Rate = round(all[,"Dead_Discard"] / all[,"Tot_Dead"], 3)
all[is.na(all)] = 0

#write.csv(all, file = file.path(dir, "quillback_gemm_mortality_and_discard.csv"), row.names = FALSE)

#Dividing by north/south of 40`10
landings_4010  = aggregate(Landings ~ Year + grouped_sector + Grouping, data = gemm, drop = FALSE, FUN = sum)
discards_4010  = aggregate(Discards ~ Year + grouped_sector + Grouping, data = gemm, drop = FALSE, FUN = sum)
disc_mort_4010 = aggregate(Discard.Mortality ~ Year + grouped_sector + Grouping, data = gemm, drop = FALSE, FUN = sum)
all_dead_4010  = aggregate(Mortality..Landings.and.Discard.Mortality. ~ Year + grouped_sector + Grouping, data = gemm, drop = FALSE, FUN = sum)

all_4010 = data.frame(Year = landings_4010$Year,
                 Area = landings_4010$grouped_sector,
                 complex = landings_4010$Grouping,
                 Landings = landings_4010$Landings,
                 Discard = discards_4010$Discards,
                 Dead_Discard = disc_mort_4010$Discard.Mortality,
                 Tot_Dead = all_dead_4010$Mortality..Landings.and.Discard.Mortality.)

all_4010[is.na(all_4010)] = 0

all_4010$Discard_Mort_Rate = round(all_4010[,"Dead_Discard"] / all_4010[,"Tot_Dead"], 3)
all_4010[is.na(all_4010)] = 0


#-----------------------------------------------------------------------------------
# Load the WCGOP discard totals 
# Kayleigh suggested:
# multiply by proportion of catch observed in an area compared to coastwide -- 
# not the proportion discarded in a given area. To do that, I suggest calculating the 
# proportion of observed catch (D+R) within each area (compared to coastwide) in each year. 
# So, for example, for 2018 it might be 5% of observed in WA, 10% observed in OR, 
# 40% observed N of Pt Conc, and 45% observed S of Pont Conc (adding up to 100% coastwide). 
# We could then multiply the total discard from the GEMM by each of those area proportions to
# estimate the discard in each area. We could also explore using the same method but with 
# only observed discard rather than observed discard AND retained together.
#-----------------------------------------------------------------------------------

ncs = read.csv(file.path(dir, "quillback_OB_DisRatios_noboot_ncs_state_2020-10-16.csv"))
cs = read.csv(file.path(dir,  "quillback_OB_DisRatios_noboot_cs_state_2020-10-16.csv"))

ret_ncs = aggregate(Observed_RETAINED.MTS ~ ryear + State, data = ncs, drop = FALSE,FUN = sum)
dis_ncs = aggregate(Observed_DISCARD.MTS  ~ ryear + State, data = ncs, drop = FALSE,FUN = sum)
ret_cs  = aggregate(Observed_RETAINED.MTS ~ ryear + State, data = cs, drop = FALSE, FUN = sum)
dis_cs  = aggregate(Observed_DISCARD.MTS  ~ ryear + State, data = cs, drop = FALSE,FUN = sum)
ret_ncs[is.na(ret_ncs)] = dis_ncs[is.na(dis_ncs)] = ret_cs[is.na(ret_cs)] = dis_cs[is.na(dis_cs)] = 0

tot_obs = data.frame(Year = sort(unique(ret_ncs$ryear)),
					 ca = ret_ncs[which(ret_ncs$State == "CA"),3] + dis_ncs[which(dis_ncs$State == "CA"),3],
					 or = ret_ncs[which(ret_ncs$State == "OR"),3] + dis_ncs[which(dis_ncs$State == "OR"),3],
					 wa = ret_ncs[which(ret_ncs$State == "WA"),3] + dis_ncs[which(dis_ncs$State == "WA"),3])

tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "ca"] = tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "ca"] +  
					ret_cs[which(ret_cs$State == "CA"), 3] + dis_cs[which(dis_cs$State == "CA"), 3]
tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "or"] = tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "or"] +  
          ret_cs[which(ret_cs$State == "OR"), 3] + dis_cs[which(dis_cs$State == "OR"), 3]
tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "wa"] = tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "wa"] +  
					ret_cs[which(ret_cs$State == "WA"), 3] + dis_cs[which(dis_cs$State == "WA"), 3]	

#Ratio of dead discards by state
ratio = cbind(tot_obs$Year, tot_obs[,-1] / apply(tot_obs[,-1], 1, sum))

#Dead discard values (mt) by state
dead = data.frame(Year = tot_obs$Year,
				  ca = ratio$ca * all[which(all$Area == "commercial"), "Dead_Discard"],
				  or = ratio$or * all[which(all$Area == "commercial"), "Dead_Discard"],
				  wa = ratio$wa * all[which(all$Area == "commercial"), "Dead_Discard"] ) 

#write.csv(dead, file = file.path(dir, "quillback_commercial_discard.csv"), row.names = FALSE)

#Dividing by north/south of 40`10 for california only
dead_4010 = data.frame(Year = tot_obs$Year,
                  ca_north = ratio$ca * all_4010[which(all_4010$Area == "commercial" & all_4010$complex == "Minor nearshore rockfish (North of 40°10' N. lat.)"), "Dead_Discard"],
                  ca_south = ratio$ca * all_4010[which(all_4010$Area == "commercial" & all_4010$complex == "Minor nearshore rockfish (South of 40°10' N. lat.)"), "Dead_Discard"])


