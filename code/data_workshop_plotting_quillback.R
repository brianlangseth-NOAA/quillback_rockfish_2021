
############################################################################################
#	Biology & Data Exploration Plotting for 2020 Data Moderate Data Workshops
# 
# Quillback rockfish
#	
#
#	Chantel Wetzel, Brian Langseth
############################################################################################


############################################################################################
#	Sum total of samples by area and source
############################################################################################

tmp = aggregate(Length~State_Areas + Source, data = out, FUN = length)
i = sort(tmp$State_Areas, index.return = TRUE)$ix
tmp[i,]
#     State_Areas       Source Length
# north_pt_concep NWFSC_WCGBTS     26
# north_pt_concep       PacFIN   2696
# north_pt_concep       RecFIN   4363
# north_pt_concep RecFIN_MRFSS    679
# north_pt_concep    Triennial      1
#              OR NWFSC_WCGBTS    102
#              OR       PacFIN   2853
#              OR       RecFIN  19168
#              OR RecFIN_MRFSS    747
#              OR    Triennial      5
#           ORage RecFIN_ORage    787
# south_pt_concep       RecFIN      4
#              WA NWFSC_WCGBTS     91
#              WA       PacFIN    148
#              WA       RecFIN   5389
#              WA    Triennial     42


############################################################################################
#	Various plotting of length by area, 
############################################################################################

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "Length_Dists_by_Area.png", w = 7, h = 7, pt = 12)
print(ggplot(out, aes(Length, fill = Source, color = Source)) +
  facet_wrap(facets = c("State_Areas")) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()


pngfun(wd = file.path(dir,"data","output biology","plots"), file = "Live_vs_Dead_OR_Prop.png", w = 7, h = 7, pt = 12)
tmp = out[which(out$Source == "PacFIN" & out$State_Areas == "OR"), ]
print(ggplot(tmp, aes(Length, fill = Fleet, color = Fleet)) +
  #facet_wrap(facets = c("State_Areas")) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "RecFIN_vs_MRFSS_Length_Dists_by_Area.png", w = 12, h = 7, pt = 12)
tmp = out[out$Source %in% c("RecFIN", "RecFIN_MRFSS"), ]
tmp$source_fleet = paste0(tmp$Source, "_", tmp$Fleet)
print(ggplot(tmp, aes(Length, fill = source_fleet, color = source_fleet)) +
  facet_wrap(facets = c("State_Areas")) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()




############################################################################################
#	Quickly look at the commercial and recreational samples by gear to see if the amount of data for each
#   and if there looks to be different selectivity by gear type
############################################################################################

hkl = c("HKL", "VHL", "OHL")
lgl = c("LGL")
other = unique(pacfin$GRID)[which(!unique(pacfin$GRID) %in% c(hkl, lgl))]
pacfin_data$gear[pacfin_data$GRID %in% hkl] = "hkl"
pacfin_data$gear[pacfin_data$GRID %in% lgl] = "lgl"
pacfin_data$gear[pacfin_data$GRID %in% other] = "other"

aggregate(Length ~ gear + State_Areas, data = pacfin_data, FUN = function(x) cbind(mean(x), length(x)))
#gear       State_Areas       Mean          N
#hkl    north_pt_concep   36.98373  627.00000
#lgl    north_pt_concep   35.10777 2059.00000
#other  north_pt_concep   34.68000   10.00000
#hkl                 OR   37.24045 1231.00000
#lgl                 OR   38.24700 1251.00000
#other               OR   39.89353  371.00000
#lgl                 WA   40.00000    6.00000
#other               WA   40.34507  142.00000

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "Gear_by_Area_PacFIN.png", w = 7, h = 7, pt = 12)
#tmp = pacfin_data_tmp[pacfin_data$gear != "other" & pacfin_data$State_Areas != "WA", ]
print(ggplot(pacfin_data, aes(Length, fill = gear, color = gear)) +
  facet_wrap(facets = c("State_Areas"), nrow = 3, ncol = 1) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()

pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_by_RecComm_Sex_WA_Prop.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source %in% c("RecFIN", "PacFIN") & out$State_Areas == "WA"),]
print(ggplot(tmp, aes(Length, fill = Source, color = Source)) +
  facet_wrap(facets = c("Sex")) + #, "Source")) +
  scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2)))+ 
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()


pngfun(wd = file.path(dir,"data","output biology","plots"), file = "CA_RecFIN_Ocean_Area.png", w = 12, h = 7, pt = 12)
ca_recfin_data$water_area = ca_recfin_data$Agency.Water.Area.Name
ca_recfin_data[which(ca_recfin_data$water_area %in% c("OCEAN > 3 MILES (AREAB AND P1B IMPORT)", "OCEAN > 3 MILES")), "water_area"] = "OCEAN > 3 MILES"
ca_recfin_data[which(ca_recfin_data$water_area %in% c("OCEAN <= 3 MILES (AREAB AND P1B IMPORT)", "OCEAN <= 3 MILES")), "water_area"] =  "OCEAN <= 3 MILES"
print(ggplot(ca_recfin_data, aes(Length, fill = water_area, color = water_area)) +
  facet_wrap(facets = c("State_Areas")) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "CA_MRFSS_Ocean_Area.png", w = 12, h = 7, pt = 12)
ca_mrfss_data$water_area = NA
ca_mrfss_data$water_area[which(ca_mrfss_data$DIST == 1)] = "OCEAN <= 3 MILES"
ca_mrfss_data$water_area[which(ca_mrfss_data$DIST == 2)] =  "OCEAN > 3 MILES"
ca_mrfss_data$water_area[which(!ca_mrfss_data$DIST %in% c(1,2))] =  "UNKNOWN"
tmp = ca_mrfss_data[which(ca_mrfss_data$water_area != "UNKNOWN"),]
print(ggplot(tmp, aes(Length, fill = water_area, color = water_area)) +
  facet_wrap(facets = c("State_Areas")) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()

or_mrfss_data$water_area = or_mrfss_data$Area_X_Name
or_recfin_len_data$water_area = or_recfin_len_data$Agency.Water.Area.Name
cols = c("State", "State_Areas", "Source", "Fleet", "Length", "water_area")
tmp = rbind(or_recfin_len_data[, cols], or_mrfss_data[,cols], ca_recfin_data[,cols], ca_mrfss_data[,cols])
tmp$water_area[which(tmp$water_area == "Ocean <=3 miles")] = "OCEAN <= 3 MILES"
tmp$water_area[which(tmp$water_area == "Ocean >3 miles")] = "OCEAN > 3 MILES"

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "Recreation_Ocean_Area.png", w = 12, h = 7, pt = 12)
tmp = tmp[which(!tmp$water_area %in% c(NA, "UNKNOWN", "NOT KNOWN")),]
print(ggplot(tmp, aes(Length, fill = water_area, color = water_area)) +
  facet_wrap(facets = c("State_Areas", "Source")) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()

# #NOT ABLE TO DO BECAUSE WATER_AREA IS NOT WITHIN THE CALIFORNIA DATA
# table(tmp$water_area, tmp$State_Areas)
# #                  north_pt_concep    OR south_pt_concep
# #  ESTUARY                        0    68               0
# #  Inland                         0   462               0
# #  OCEAN                       3533   275            1903
# #  OCEAN <= 3 MILES           27734 11210           17770
# #  OCEAN > 3 MILES             3782   256            3020



############################################################################################
# Create the length-at-age figure with lit growth estimates added
############################################################################################

#Ignoring the 2 unknown gender samples
line_col = c("red", 'blue')
sex_col = alpha(line_col, 0.5)
keep = which(!is.na(out$Age))
tmp = out[keep, ]
lens = 1:max(tmp$Length, na.rm = TRUE)
xmax = max(tmp$Age + 2,    na.rm = TRUE)
ymax = max(tmp$Length + 5, na.rm = TRUE)

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "Length_Age_by_Sex_with_Lit_Ests.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
plot(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length"], xlab = "Age", ylab = "Length (cm)",
     xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length"], pch = 1, col = sex_col[2])
lines(0:xmax, vb_fn(age = 0:xmax, Linf = la_ests$all_F[1], L0 = la_ests$all_F[2], k = la_ests$all_F[3]), 
      col = line_col[1], lty = 1, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, Linf = la_ests$all_M[1], L0 = la_ests$all_M[2], k = la_ests$all_M[3]), 
      col = line_col[2], lty = 1, lwd = 2)	
# West et al. 2014 SJF parameters
lines(0:xmax, 47.9 * (1 - exp(-0.108 * (0:xmax + 1.92))), col = 'red',  lty = 3, lwd = 2)
lines(0:xmax, 45.7 * (1 - exp(-0.086 * (0:xmax + 5.43))), col = 'blue', lty = 3, lwd = 2)
# Barker 1979
#lines(0:xmax, 47 * (1 - exp(-0.092 * (0:xmax + 1.5))), col = 'red',  lty = 2, lwd = 2)
#lines(0:xmax, 45 * (1 - exp(-0.1 * (0:xmax + 1.1))), col = 'blue', lty = 2, lwd = 2)
leg = c(paste0("F : Linf = ", round(la_ests$all_F[1], 1),  " L1 = ", round(la_ests$all_F[2], 1)," k = ", round(la_ests$all_F[3], 3)),
        paste0("M : Linf = ", round(la_ests$all_M[1], 1),  " L1 = ", round(la_ests$all_M[2], 1)," k = ", round(la_ests$all_M[3], 3)),
        "F: Linf = 47.9, k = 0.108 (West etal 2014)", 
        "M: Linf = 46, k = 0.086 (West etal 2014)")
legend("bottomright", bty = 'n', legend = leg, lty = c(1,1,3,3), col = c(rep(line_col,2)), lwd = 2, cex = 1)
dev.off()

#Separating out WA and OR
pngfun(wd = file.path(dir,"data","output biology","plots"), file = "Length_Age_by_Sex_State.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 1))
#WA
plot(tmp[tmp$Sex == "F" & tmp$State == "WA", "Age"], tmp[tmp$Sex == "F" & tmp$State == "WA", "Length"], xlab = "Age", ylab = "Length (cm)",
     xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1], main = "WA") 
points(tmp[tmp$Sex == "M" & tmp$State == "WA", "Age"], tmp[tmp$Sex == "M" & tmp$State == "WA", "Length"], pch = 1, col = sex_col[2])
lines(0:xmax, vb_fn(age = 0:xmax, Linf = la_ests$WA_F[1], L0 = la_ests$WA_F[2], k = la_ests$WA_F[3]), 
      col = line_col[1], lty = 1, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, Linf = la_ests$WA_M[1], L0 = la_ests$WA_M[2], k = la_ests$WA_M[3]), 
      col = line_col[2], lty = 1, lwd = 2)	
leg = c(paste0("F : Linf = ", round(la_ests$WA_F[1], 1),  " L1 = ", round(la_ests$WA_F[2], 1)," k = ", round(la_ests$WA_F[3], 3)),
        paste0("M : Linf = ", round(la_ests$WA_M[1], 1),  " L1 = ", round(la_ests$WA_M[2], 1)," k = ", round(la_ests$WA_M[3], 3)))
legend("bottomright", bty = 'n', legend = leg, lty = c(1,1), col = c(rep(line_col)), lwd = 2, cex = 1.25)
#OR - This plot was just for OR for females and all for male, but since presentation I have fixed it
plot(tmp[tmp$Sex == "F" & tmp$State %in% c("OR", "ORage"), "Age"], tmp[tmp$Sex == "F" & tmp$State %in% c("OR", "ORage"), "Length"], xlab = "Age", ylab = "Length (cm)",
     xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1], main = "OR") 
points(tmp[tmp$Sex == "M" & tmp$State %in% c("OR", "ORage"), "Age"], tmp[tmp$Sex == "M" & tmp$State %in% c("OR", "ORage"), "Length"], pch = 1, col = sex_col[2])
lines(0:xmax, vb_fn(age = 0:xmax, Linf = la_ests$OR_F[1], L0 = la_ests$OR_F[2], k = la_ests$OR_F[3]), 
      col = line_col[1], lty = 1, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, Linf = la_ests$OR_M[1], L0 = la_ests$OR_M[2], k = la_ests$OR_M[3]), 
      col = line_col[2], lty = 1, lwd = 2)		
leg = c(paste0("F : Linf = ", round(la_ests$OR_F[1], 1),  " L1 = ", round(la_ests$OR_F[2], 1)," k = ", round(la_ests$OR_F[3], 3)),
        paste0("M : Linf = ", round(la_ests$OR_M[1], 1),  " L1 = ", round(la_ests$OR_M[2], 1)," k = ", round(la_ests$OR_M[3], 3)))
legend("bottomright", bty = 'n', legend = leg, lty = c(1,1), col = c(rep(line_col)), lwd = 2, cex = 1.25)
dev.off()



############################################################################################
# Look at the length distributions within the survey and within all data
############################################################################################

pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_by_Sex_Survey.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 3), mar = c(4,4,2,2), oma = c(1,1,1,1))
area = c("north_pt_concep", "OR", "WA"); ind = 0
for (a in area){
  ind = ind + 1
  find = which(out$Source == "NWFSC_WCGBTS" & out$State_Area == a)
  boxplot(out$Length[find] ~ out$Sex[find], ylim = c(0, 65), col = c('red', 'blue', 'grey'), las = 1,
          ylab = "Length (cm)", xlab = "Fish Sex", main = paste0(area[ind],": ", a))
  legend("topleft", bty = 'n', legend = c(paste0("Female N = ", sum(out$Sex[find] == "F")), 
                                          paste0("Male N = ", sum(out$Sex[find] == "M")), paste0("Unsexed N = ", sum(out$Sex[find] == "U"))),
         cex = 1.5)
}
dev.off()

pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_by_Sex_Survey_Prop.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source %in% c("NWFSC_WCGBTS", "Triennial")),]
print(ggplot(tmp, aes(Length, fill = Sex, color = Sex)) +
  facet_wrap(facets = c("State_Areas", "Source")) + #, "Source")) +
  scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2)))+ 
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()


pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Length_by_Sex_All_Data_Prop.png", w = 12, h = 7, pt = 12)
print(ggplot(out, aes(Length, fill = Sex, color = Sex)) +
  facet_wrap(facets = c("State_Areas", "Source")) + #, "Source")) +
  #scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
dev.off()


############################################################################################
# Look at lengths by areas
############################################################################################
check = aggregate(Length~State_Areas + Sex, data = out, FUN = function(x) quantile(x, 0.99, na.rm = TRUE))
check[sort(check$State_Areas, index.return = TRUE)$ix, ]
#       State_Areas Sex Length
#  north_pt_concep   F 45.260
#  north_pt_concep   M 45.485
#  north_pt_concep   U 48.713
#               OR   F 48.664
#               OR   M 47.400
#               OR   U 49.800
#            ORage   F 47.484
#            ORage   M 46.806
#            ORage   U 45.173
#  south_pt_concep   U 34.483
#               WA   F 48.000
#               WA   M 48.000
#               WA   U 49.496


##################################################################################
# Plot fecundity at length from Dick et al 2017
#################################################################################

len = 0:65
fecund = 3.93184e-7 * len ^ 3.702

pngfun(wd = file.path(dir, "data", "output biology", "plots"), file = "Fecundity.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 1), oma = c(0, 3, 0, 0))
plot(len, fecund,  xlab = "Length (cm)",
     ylab = "", type = 'l', col = 'red', lwd = 2, las = 1,
     cex.axis = 1.5, cex.lab = 1.5, cex = 1.5, xaxs = 'i', yaxs = 'i')
mtext(side = 2, "Fecundity (millions of eggs)", line = 4, cex = 1.5)
legend('topleft', legend = "Dick et al. 2017", bty = 'n', cex = 1.5)
dev.off()


##################################################################################
# Plot charter vs. private boat lengths
#################################################################################
ca_recfin_pc = rename_recfin(data = ca_recfin,
                               area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
                               area_names = c("south_pt_concep", "north_pt_concep"),
                               area_column_name = "RECFIN_PORT_NAME",
                               mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS"), c("PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
                               mode_names = c("shore", "boat-C", "boat-P","unknown"),
                               mode_column_name = "RecFIN.Mode.Name" )
wa_recfin_pc =rename_recfin(data = wa_recfin,
                              area_grouping = list(c("WASHINGTON")),
                              area_names = c("WA"),
                              area_column_name = "STATE_NAME",
                              mode_grouping = list( c("C"), c("B"), c("\\?", "^$")), #\\? matches to "?" and "^$" matches to ""
                              mode_names = c("boat-C","boat-P","unknown"),
                              mode_column_name = "boat_mode_code"  )
or_recfin_pc = rename_recfin(data = or_recfin_len, 
                                   area_column_name = "State.Name",
                                   area_grouping = list("Oregon"), 
                                   area_names = "OR",
                                   mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS"), c("PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
                                   mode_names = c("shore", "boat-C","boat-P","unknown"),
                                   mode_column_name = "RecFIN.Mode.Name" )
recfin_pc = rbind(wa_recfin_pc[,which(names(wa_recfin_pc) %in% rec_fields)], or_recfin_pc[,which(names(or_recfin_pc) %in% rec_fields)], ca_recfin_pc[,which(names(ca_recfin_pc) %in% rec_fields)])

#Sample size for charter in calfironia per year is 10-100, otherwise a few years have low numbers but others have >100
aggregate(Length ~ Year + Fleet + State_Areas, tmp, FUN=length)

pngfun(wd = file.path(dir,"data","output biology","plots"), file = "BoatMode_by_Area_RecFIN.png", w = 7, h = 7, pt = 12)
tmp = recfin_pc[recfin_pc$State_Areas != "south_pt_concep" & recfin_pc$Fleet != "unknown",]
tmp = tmp[-which(tmp$Length>65),]
print(ggplot(tmp, aes(Length, fill = Fleet, color = Fleet)) +
  facet_wrap(facets = c("State_Areas"), nrow = 3, ncol = 1) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.75)) #if use adjust = 0.5 then really spiky
dev.off()

