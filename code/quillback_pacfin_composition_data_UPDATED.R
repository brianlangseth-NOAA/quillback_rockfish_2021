##################################################################################################
#
#	PacFIN Data Exploration for Quillback Rockfish
# For use with updated PacFIN data (as of Feb. 2021). 
# Previous version is quillback_pacfin_composition_data.R
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
#Load PacFIN BDS data, check for any issues, and set it up for expansion - UPDATED FOR NEW PACFIN VERSION
################################
load(file.path(dir, "PacFIN BDS", "PacFIN.QLBK.bds.23.Feb.2021.RData"))
pacfin = bds.pacfin
#Set fish in WA area 4a but in state area 29 (which are included in assessments) to a PSMFC area that isn't removed
#Fish numbers provided by Kristen Hinton on 2/24/21
pacfin[pacfin$SAMPLE_NUMBER %in% c(20174101180002, 20184101180001, 20184101180002, 20184101180003), "PSMFC_CATCH_AREA_CODE"] = "wa29"

# Load in the current weight-at-length estimates by sex
fa = ma = ua = 1.963e-5
fb = mb = ub = 3.016

# Read in the PacFIN catch data to based expansion on
catch.file = read.csv(file.path(dir, "output catch", "pacfin_catch_by_area.csv"))
colnames(catch.file) = c("Year", "CA", "OR", "WA")

# Clean up length data
Pdata = cleanPacFIN(Pdata = pacfin, 
                    CLEAN = TRUE,
                    verbose = TRUE)

Pdata$fleet = Pdata$state
Pdata$stratification = Pdata$fleet

PdataAge = Pdata #set up for age comps later

#################################################################################
# Length comp expansions
#################################################################################

Pdata_exp <- getExpansion_1(Pdata = Pdata,
                            fa = fa, fb = fb, ma = ma, mb = mb, ua = ua, ub = ub)

Pdata_exp <- getExpansion_2(Pdata = Pdata_exp, 
                            Catch = catch.file, 
                            Units = "MT",
                            maxExp = 0.80)

Pdata_exp$Final_Sample_Size <- capValues(Pdata_exp$Expansion_Factor_1_L * Pdata_exp$Expansion_Factor_2, maxVal = 0.80)

# Set up lengths bins based on length sizes for all comps
myLbins = c(seq(10, 50, 2))

# Since quillback is a single sex model I am going to change all fish to be unsexed.
Pdata_exp$SEX = "U"

Lcomps = getComps(Pdata_exp, Comps = "LEN")

writeComps(inComps = Lcomps, 
		   fname = file.path(dir, "forSS", "Lcomps.QLBK.Feb.2021.csv"), 
		   lbins = myLbins, 
		   partition = 0, 
		   sum1 = TRUE,
		   digits = 4)


#################################################################################
# Age comp expansions - which are only for Oregon and Washington
#################################################################################

Adata =  getExpansion_1(Pdata = PdataAge,  
                        fa = fa, fb = fb, ma = ma, mb = mb, ua = ua, ub = ub)

Adata = getExpansion_2(Pdata = Adata, 
                       Catch = catch.file[,c("Year","OR","WA")], 
                       Units = "MT",
                       maxExp = 0.80)

Adata$Final_Sample_Size <- capValues(Adata$Expansion_Factor_1_L * Adata$Expansion_Factor_2, maxVal = 0.80)

# Set up lengths bins based on length sizes for all comps
myAbins = c(seq(5,40,1)) #New max size is 49 (but only three greater than 40)

# Since quillback is a single sex model I am going to change all fish to be unsexed.
Adata$SEX = "U"

Acomps = getComps(Adata, Comps = "AGE")

writeComps(inComps = Acomps,
           fname = file.path(dir, "forSS", "Acomps.QLBK.Feb.2021.csv"), 
           abins = myAbins, 
           partition = 0, 
           sum1 = TRUE,
           digits = 4)



##############################################################################################################
# Format and rewrite
##############################################################################################################

#########################################################################################
# California, Oregon, & Washington - use the sexes combined in the model
#########################################################################################
out = read.csv(file.path(dir, "forSS", "Lcomps.QLBK.Nov.2020.csv"), skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Sexes combined ")) + 2
end   = which(as.character(out[,1]) %in% c(" Females then males ")) -1 #nrow(out)
cut_out = out[start:end,]

cut_out$fleetnum = 1
cut_out$month = 1

ind = which(colnames(cut_out) %in% "L10"):which(colnames(cut_out) %in% "L50") #If have 2 sex model then go to L50.1
format = cbind(cut_out$stratification, cut_out$fishyr, cut_out$month, cut_out$fleetnum, cut_out$sex, cut_out$partition, 
			   cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("strat", "fishyr", "month", "fleet", "sex", "part", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

ca_comps = format[format$strat == "C.ALL", -1]
or_comps = format[format$strat == "O.ALL", -1]
wa_comps = format[format$strat == "W.ALL", -1]
wa_comps$fleet = 2
#write.csv(ca_comps, file = file.path(dir, "forSS","CA_com_Lcomps_unsexed_10_50_formatted.csv"), row.names = FALSE)
#write.csv(or_comps, file = file.path(dir, "forSS","OR_com_Lcomps_unsexed_10_50_formatted.csv"), row.names = FALSE)
#write.csv(wa_comps, file = file.path(dir, "forSS","WA_com_Lcomps_unsexed_10_50_formatted.csv"), row.names = FALSE)


##############
# Oregon age comps - Only state with commercial ages
##############
out = read.csv(file.path(dir, "forSS", "Acomps.QLBK.Jan.2021.csv"), skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Sexes combined ")) + 2
end   = which(as.character(out[,1]) %in% c(" Females then males ")) -1 #nrow(out)
cut_out = out[start:end,]

cut_out$ageerr = 1
cut_out$Lbin_lo = -1
cut_out$Lbin_hi = -1
cut_out$fleetnum = 1
cut_out$month = 1

ind = which(colnames(cut_out) %in% "A5"):which(colnames(cut_out) %in% "A40") #If have 2 sex model then go to A40.1
format = cbind(cut_out$stratification, cut_out$fishyr, cut_out$month, cut_out$fleetnum, cut_out$sex, cut_out$partition,
               cut_out$ageerr, cut_out$Lbin_lo, cut_out$Lbin_hi,
               cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("strat", "fishyr", "month", "fleet", "sex", "part", "ageerr", "Lbin_lo", "Lbin_hi", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

or_comps = format[format$strat == "O.ALL", -1]
#write.csv(or_comps, file = file.path(dir, "forSS","OR_com_Acomps_unsexed_5_40_formatted.csv"), row.names = FALSE)


#########################################################################################
# Calculate the number of trips (tows), and the number of fish
# Only for lengths
#########################################################################################
temp = Pdata[!is.na(Pdata$lengthcm) & Pdata$SAMPLE_YEAR < 2021,]

Nfish = table(temp$SAMPLE_YEAR, temp$SEX, temp$stratification)

aa = unique(temp$stratification)
yy = sort(unique(temp$SAMPLE_YEAR))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
  for(a in 1:length(aa)){
    ind = which(temp$SAMPLE_YEAR == yy[y] & temp$stratification == aa[a])
    if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
  }
}
colnames(Ntows) = aa
rownames(Ntows) = yy

keep = Ntows[,"W.ALL"] != 0
wa_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"W.ALL"], Nfish[keep,,"W.ALL"])
keep = Ntows[,"O.ALL"] != 0
or_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"O.ALL"], Nfish[keep,,"O.ALL"])
keep = Ntows[,"C.ALL"] != 0
ca_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"C.ALL"], Nfish[keep,,"C.ALL"])

colnames(wa_samps) = colnames(or_samps) = colnames(ca_samps) = 
  c("Year", "N_Trips", "N_Fish_Females", "N_Fish_Males", "N_Fish_Unsexed")

#write.csv(wa_samps, file = file.path(dir, "forSS","WA_Samples.csv"), row.names = FALSE)
#write.csv(or_samps, file = file.path(dir, "forSS","OR_Samples.csv"), row.names = FALSE)
#write.csv(ca_samps, file = file.path(dir, "forSS","CA_Samples.csv"), row.names = FALSE)

