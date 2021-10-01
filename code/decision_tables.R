#######################################################################################################
#
# 			Copper Rockfish 2021 Decision Table
#
#######################################################################################################

library(r4ss)
library(sa4ss)

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

#percent = c(0.265, 0.735) #percent allocation by fleet

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

####
#Generate the tex table for the report
####

tab = read.csv(file.path("C:/Users/Brian.Langseth/Desktop", "or", "decision_tables", "decision_table_OR_R0_baseABC.csv"), header = TRUE)

col_names = c("Year", 
              "Catch (mt)", 
              "Low: Spawning Output", 
              "Low: Fraction of Unfished", 
              "Base: Spawning Output", 
              "Base: Fraction of Unfished", 
              "High: Spawning Output", 
              "High: Fraction of Unfished")

table_format(x = tab,
             caption = "Decision table summary of 10 year projections for low (2.01) and high (2.28) states of nature around ln(R0). Columns range over low, base, and high states of nature, and rows range over different catch level assumptions. The current catch level assumption is the ACL from the base model where P* = 0.45.",
             label = "decision-table",
             align = 'l',
             col_names = col_names,
             landscape = FALSE)

kableExtra::save_kable(t, file = file.path("C:/Users/Brian.Langseth/Desktop/or/write_up/tex_tables", 
                                           "or_decision_table.tex"))


## CALIFORNIA decision tables----------------------------------------------------

ca  <- SS_output(file.path(loc, "ca", "9_0_0_postSSC_base"), printstats=FALSE, verbose=FALSE)
low <- SS_output(file.path(loc, "ca", "9_0_2b_lowState_M_baseABC"), printstats=FALSE, verbose=FALSE)
high <- SS_output(file.path(loc, "ca", "9_0_1b_highState_M_baseABC"), printstats=FALSE, verbose=FALSE)

modelnames <- c("Base (M = 0.057)", "Low (M = 0.0464)", "High (M = 0.0744)")
mysummary  <- SSsummarize(list(ca, low, high))
SSplotComparisons(mysummary, 
                  filenameprefix = "CA_REPORT_M_baseABC_decision_table",
                  legendlabels = modelnames, 
                  legendloc = "bottomleft",
                  plotdir = file.path(loc, "ca", "decision_tables"),
                  subplot = c(2,4),
                  pdf = FALSE,
                  png = TRUE)

#percent = c(0.239, 0.761) #percent allocation by fleet

dec_tab = data.frame("Year" = 2021:2032, 
                     "Cbase" = ca$derived_quants[grep("ForeCatch",ca$derived_quants$Label),"Value"],
                     "Clow" = low$derived_quants[grep("ForeCatch",low$derived_quants$Label),"Value"],
                     "Chigh" = high$derived_quants[grep("ForeCatch",high$derived_quants$Label),"Value"],
                     "SBlow" = low$derived_quants[which(low$derived_quants$Label == "SSB_2021"):which(low$derived_quants$Label == "SSB_2032"),"Value"],
                     "depllow" = low$derived_quants[which(low$derived_quants$Label == "Bratio_2021"):which(low$derived_quants$Label == "Bratio_2032"),"Value"],
                     "SBbase" = ca$derived_quants[which(ca$derived_quants$Label == "SSB_2021"):which(ca$derived_quants$Label == "SSB_2032"),"Value"],
                     "deplbase" = ca$derived_quants[which(ca$derived_quants$Label == "Bratio_2021"):which(ca$derived_quants$Label == "Bratio_2032"),"Value"],
                     "SBhigh" = high$derived_quants[which(high$derived_quants$Label == "SSB_2021"):which(high$derived_quants$Label == "SSB_2032"),"Value"],
                     "deplhigh" = high$derived_quants[which(high$derived_quants$Label == "Bratio_2021"):which(high$derived_quants$Label == "Bratio_2032"),"Value"])

write.csv(round(dec_tab,2), file.path(loc, "ca", "decision_tables", "decision_table_CA_M_baseABC.csv"), row.names = FALSE)


####
#Generate the tex table for the report
####

tab = read.csv(file.path("C:/Users/Brian.Langseth/Desktop", "ca", "decision_tables", "decision_table_CA_M_baseABC.csv"), header = TRUE)

col_names = c("Year", 
              "Catch (mt)", 
              "Low: Spawning Output", 
              "Low: Fraction of Unfished", 
              "Base: Spawning Output", 
              "Base: Fraction of Unfished", 
              "High: Spawning Output", 
              "High: Fraction of Unfished")

t = table_format(x = tab[,-c(3,4)],
             caption = "Decision table summary of 10 year projections for low (0.0464) and high (0.0744) states of nature around natural mortality. Columns range over low, base, and high states of nature, and rows range over different catch level assumptions. The current catch level assumption is the ACL from the base model where P* = 0.45.",
             label = "decision-table",
             align = 'l',
             col_names = col_names,
             landscape = FALSE)

kableExtra::save_kable(t, file = file.path("C:/Users/Brian.Langseth/Desktop/ca/write_up/tex_tables", 
                                           "ca_decision_table.tex"))
