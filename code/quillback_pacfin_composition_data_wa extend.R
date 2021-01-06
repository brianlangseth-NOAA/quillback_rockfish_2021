##################################################################################################
#
#	PacFIN Data Exploration for Quillback Rockfish
# Adjusting data bins for wa to 10-56 for exploring increase data bins for rec comps
# 		
#		Written by Chantel Wetzel, Brian Langseth
#
##################################################################################################

#devtools::install_github("nwfsc-assess/PacFIN.Utilities")
library(PacFIN.Utilities)
library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/data"
setwd(dir)

################################
#Load PacFIN BDS data, check for any issues, and set it up for expansion
################################
load(file.path(dir, "PacFIN BDS", "PacFIN.QLBK.bds.13.Aug.2020.RData"))
pacfin = PacFIN.QLBK.bds.13.Aug.2020

# Load in the current weight-at-length estimates by sex
combineda = 1.94e-5; combinedb = 3.02        

# Read in the PacFIN catch data to based expansion on
catch.file = read.csv(file.path(dir, "output catch", "pacfin_catch_by_area.csv"))
colnames(catch.file) = c("Year", "C.ALL", "O.ALL", "W.ALL")

###########
#The catch is only PacFIN. And is in landings. No state provided catches and no imputation?
#QUESTION: We dont cleanPacFIN for catches correct? Include samples not in INPFC areas for catches?
#CHeck research removals
#Check INPFSC
###########

# Add default age data column in order to make code work 
# Must remove once data are re-pulled!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
pacfin$FISH_AGE_YEARS_FINAL = NA

# May want to evaluate the data by state and the sample quality code to identify special projects data
table(pacfin$SOURCE_AGID, pacfin$SAMPLE_QUALITY)
table(pacfin$SAMPLE_TYPE,pacfin$SOURCE_AGID)

#Ensure fish type is as expected
table(pacfin$FISH_LENGTH_TYPE)

# Clean up length data
Pdata = cleanPacFIN(Pdata = pacfin, 
					keep_length_type = c("", "A", "F", "U", "T", NA),
					keep_missing_lengths = FALSE,
					keep_INPFC = c("VUS","CL","VN","COL","NC","SC","EU","CP","EK","MT","PS"))

# Removal Report
# 
# Records in input:                  6799 
# Records not in USINPFC             0 
# Records not in INPFC_AREA:         1013 
# Records in bad INPFC_AREA:         0 
# Records in badRecords list:        0 
# Records with bad SAMPLE_TYPE       0 
# Records with bad SAMPLE_METHOD     0 
# Records with no SAMPLE_NO          0 
# Records with no usable length      89 
# Records remaining:                 5697 


############################################################################################################
# Investigate data and create needed columns
##########################################################################################################
aggregate(lengthcm~SOURCE_AGID, data = Pdata, FUN = quantile)
# SOURCE_AGID lengthcm.0% lengthcm.25% lengthcm.50% lengthcm.75% lengthcm.100%
#           C          13           32           35           39            56
#           O          21           34           39           42            54
#           W          27           38           41           42            50

MasterPdata = Pdata

Pdata$fleet = "ALL"

Pdata$stratification = paste(Pdata$SOURCE_AGID, Pdata$fleet, sep=".")


#################################################################################
# Length comp expansions
#################################################################################

Pdata =  getExpansion_1(Pdata = Pdata, 
						maxExp = 0.95,
						Exp_WA = TRUE, 
						Indiv_Wgts = TRUE,
						plot = FALSE,
						fa = combineda, fb = combinedb, ma = combineda, mb = combinedb, ua = combineda, ub = combinedb)


# The convert input will change the catch from external file into pounds
Pdata = getExpansion_2(Pdata = Pdata, 
					   Catch = catch.file, 
					   Units = "MT",
					   maxExp = 0.80)

Pdata$Final_Sample_Size <- capValues(Pdata$Expansion_Factor_1_L * Pdata$Expansion_Factor_2, maxVal = 0.80)


# Set up lengths bins based on length sizes for all comps
myLbins = c(seq(10, 56, 2))

Lcomps = getComps(Pdata, defaults = c("fishyr", "fleet", "stratification"), Comps = "LEN")

masterLcomps = Lcomps


#Even if using a one-sex model, need to do this step. Otherwise writeComps ignores unsexed fish 
Lcomps = doSexRatio(Lcomps, findRatio = TRUE)


writeComps(inComps = Lcomps, 
		   fname = file.path(dir, "forSS", "Lcomps.QLBK.Nov.2020_10to56.csv"), 
		   lbins = myLbins, 
		   partition = 0, 
		   sum1 = TRUE,
		   digits = 4)


##############################################################################################################
# Format and rewrite
##############################################################################################################


#########################################################################################
# California, Oregon, & Washington - use the sexes combined in the model
#########################################################################################
out = read.csv(file.path(dir, "forSS", "Lcomps.QLBK.Nov.2020_10to56.csv"), skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Sexes combined ")) + 2
end   = which(as.character(out[,1]) %in% c(" Females then males ")) -1 #nrow(out)
cut_out = out[start:end,]

cut_out$fleetnum = 1
cut_out$month = 1

ind = which(colnames(cut_out) %in% "L10"):which(colnames(cut_out) %in% "L56") #If have 2 sex model then go to L50.1
format = cbind(cut_out$stratification, cut_out$fishyr, cut_out$month, cut_out$fleetnum, cut_out$sex, cut_out$partition, 
			   cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("strat", "fishyr", "month", "fleet", "sex", "part", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

wa_comps = format[format$strat == "W.ALL", -1]
wa_comps$fleet = 2
#write.csv(wa_comps, file = file.path(dir, "forSS","WA_com_Lcomps_unsexed_10_56_formatted.csv"), row.names = FALSE)

