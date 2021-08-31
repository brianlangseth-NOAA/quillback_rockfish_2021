#######################################################################################################
#
# 			Copper Rockfish 2021 Decision Table
#
#######################################################################################################

library(r4ss)

# Load in each of the models ------------------------------------------------
loc = "C:/Users/Brian.Langseth/Desktop"


## OREGON decision tables----------------------------------------------------

or  <- SS_output(file.path(loc, "or", "8_0_0_postSSC_base"), printstats=FALSE, verbose=FALSE)
low <- SS_output(file.path(loc, "or", "8_0_5b_lowState_R0_baseABC"), printstats=FALSE, verbose=FALSE)
high <- SS_output(file.path(loc, "or", "8_0_4b_highState_R0_baseABC"), printstats=FALSE, verbose=FALSE)

modelnames <- c("Base (ln(R0) = 2.14)", "Low (ln(R0) = 2.01)", "High (ln(R0) = 2.28)")
mysummary  <- SSsummarize(list(or, low, high))
SSplotComparisons(mysummary, 
                  filenameprefix = "OR_REPORT_R0_baseABC_decision_table",
                  legendlabels = modelnames, 
                  legendloc = "bottomleft",
                  plotdir = file.path(loc, "or", "decision_tables"),
                  subplot = c(2,4),
                  pdf = FALSE,
                  png = TRUE)

percent = c(0.265, 0.735) #percent allocation by fleet

dec_tab = data.frame("Year" = 2021:2032, 
                     "Cbase" = or$derived_quants[grep("ForeCatch",or$derived_quants$Label),"Value"],
                     #"Clow" = low$derived_quants[grep("ForeCatch",low$derived_quants$Label),"Value"],
                     #"Chigh" = high$derived_quants[grep("ForeCatch",high$derived_quants$Label),"Value"],
                     "SBlow" = low$derived_quants[which(low$derived_quants$Label == "SSB_2021"):which(low$derived_quants$Label == "SSB_2032"),"Value"],
                     "depllow" = low$derived_quants[which(low$derived_quants$Label == "Bratio_2021"):which(low$derived_quants$Label == "Bratio_2032"),"Value"],
                     "SBbase" = or$derived_quants[which(or$derived_quants$Label == "SSB_2021"):which(or$derived_quants$Label == "SSB_2032"),"Value"],
                     "deplbase" = or$derived_quants[which(or$derived_quants$Label == "Bratio_2021"):which(or$derived_quants$Label == "Bratio_2032"),"Value"],
                     "SBhigh" = high$derived_quants[which(high$derived_quants$Label == "SSB_2021"):which(high$derived_quants$Label == "SSB_2032"),"Value"],
                     "deplhigh" = high$derived_quants[which(high$derived_quants$Label == "Bratio_2021"):which(high$derived_quants$Label == "Bratio_2032"),"Value"])

write.csv(round(dec_tab,2), file.path(loc, "or", "decision_tables", "decision_table_OR_R0_baseABC.csv"), row.names = FALSE)

col_names = c("Year", "Catch (mt)", "Spawning Output", "Fraction Unfished", "Spawning Output", "Fraction Unfished", "Spawning Output", "Fraction Unfished")
