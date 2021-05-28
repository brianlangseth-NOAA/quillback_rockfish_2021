#################################################################################################
#  Code to do Plots and Diagnostics for Retrospective Runs
#  Grab all the results 
#################################################################################################

library(r4ss)

#Washington
state = "wa"
base_name = "10_0_0_base"
xstart = 1958

#Oregon
state = "or"
base_name = "7_1_0_base"
xstart = 1892

#California
state = "ca"
base_name = "7_1_0_base"
xstart = 1916




dir = file.path("C:/Users/Brian.Langseth/Desktop", state)
retro.folder = file.path(dir, paste0(base_name, "Profile_retro"))

base   = SS_output(file.path(dir, base_name), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro1 = SS_output(file.path(retro.folder, "retro", "retro-1"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro2 = SS_output(file.path(retro.folder, "retro", "retro-2"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro3 = SS_output(file.path(retro.folder, "retro", "retro-3"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro4 = SS_output(file.path(retro.folder, "retro", "retro-4"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro5 = SS_output(file.path(retro.folder, "retro", "retro-5"), printstats = FALSE, verbose = FALSE, covar = FALSE)
#retro6 = SS_output(file.path(retro.folder, "retro", "retro-6"), printstats = FALSE, verbose = FALSE, covar = FALSE)
#retro7 = SS_output(file.path(retro.folder, "retro", "retro-7"), printstats = FALSE, verbose = FALSE, covar = FALSE)
#retro8 = SS_output(file.path(retro.folder, "retro", "retro-8"), printstats = FALSE, verbose = FALSE, covar = FALSE)
#retro9 = SS_output(file.path(retro.folder, "retro", "retro-9"), printstats = FALSE, verbose = FALSE, covar = FALSE)
#retro10 = SS_output(file.path(retro.folder, "retro", "retro-10"), printstats = FALSE, verbose = FALSE, covar = FALSE)


modelnames <- c("Base Model", paste0("retro -", 1:5))

# Summarize the results across models
mysummary <- SSsummarize(list(base, retro1, retro2, retro3, retro4, retro5))#,
                              #retro6, retro7, retro8, retro9, retro10))
# Create plots and save as png files
SSplotComparisons(mysummary, endyrvec = rev(2015:2020), legendlabels = modelnames, 
    plotdir = retro.folder, subplot = seq(2, 12, 2), legendloc = "topright", print = TRUE, pdf = FALSE)
SSplotComparisons(mysummary, endyrvec = rev(2015:2020), legendlabels = modelnames, 
    plotdir = retro.folder, legendloc = "bottomleft", subplot = c(10), print = TRUE, pdf = FALSE)

mohns = SSmohnsrho(summaryoutput = mysummary,
           endyrvec = rev(2015:2020),
           startyr = 2015,
           verbose = TRUE)
write.csv(mohns, file = file.path(dir, paste0(base_name, "Profile_retro"), "mohns.csv"))


sb = mysummary$SpawnBio
depl = mysummary$Bratio
recr = mysummary$recruits

pngfun <- function(wd, file, w=7,h=7,pt=12){
  file <- file.path(wd, file)
  cat('writing PNG to',file,'\n')
  png(filename=file,
      width=w,height=h,
      units='in',res=300,pointsize=pt)
}

n = 6
sb.rho = (sb[,1:n] - sb[,1]) / sb[,1]
sb.rho = cbind(sb$Yr, sb.rho)
colnames(sb.rho) = c("Yr", colnames(sb.rho)[2:(n+1)])

depl.rho = (depl[,1:n] - depl[,1]) / depl[,1]
depl.rho = cbind(depl$Yr, depl.rho)
colnames(depl.rho) = c("Yr", colnames(depl.rho)[2:(n+1)])

recr.rho = (recr[,1:n] - recr[,1]) / recr[,1]
recr.rho = cbind(recr$Yr, recr.rho)
colnames(recr.rho) = c("Yr", colnames(recr.rho)[2:(n+1)])


#cols = c('pink', "yellow", "orange",  "red","green", "blue")
cols = rich.colors.short(6)
ymax = 0.75
ymin = -0.75
endyr = rev(2015:2020)



pngfun(wd = retro.folder, file = "Mohs.png", h = 12, w = 7)
  par(mfrow = c(3, 1))
  find = which(sb.rho$Yr ==xstart | sb.rho$Yr == endyr[1])
  plot(sb.rho[find[1]:find[2],1], sb.rho[find[1]:find[2],1], ylim = c(ymin, ymax), col = cols[1], ylab = "SB Relative Error", xlab = "Year", lwd = 2, cex.lab = 1.5, cex.axis = 1.5)
  abline(h = 0, lty = 2)
  for(a in 2:length(endyr)){
    find = which(sb.rho$Yr ==xstart | sb.rho$Yr == endyr[a])
    lines(sb.rho[find[1]:find[2], 1], sb.rho[find[1]:find[2], a+1], col = cols[a], lwd = 2)
  }
  mtext(side = 3, paste0("Mohn's Rho = ", round(mohns$AFSC_Hurtado_SSB,3)) ) 
  #legend("topleft", legend = c("Retro -1", "Retro -2", "Retro -3", "Retro -4", "Retro -5"), col = cols[2:length(endyr)], lty =1, lwd =2, bty = 'n')
  
  find = which(depl.rho$Yr == (xstart+1) | depl.rho$Yr == (endyr[1]+1))
  plot(depl.rho[find[1]:find[2],1], depl.rho[find[1]:find[2],1], ylim = c(ymin, ymax), col = cols[1], ylab = "Relative Unfished Relative Error", xlab = "Year", lwd = 2, cex.lab = 1.5, cex.axis = 1.5)
  abline(h = 0, lty = 2)
  for(a in 2:length(endyr)){
    find = which(depl.rho$Yr == (xstart+1) | depl.rho$Yr == (endyr[1]+1))
    lines(depl.rho[find[1]:find[2], 1], depl.rho[find[1]:find[2], a+1], col = cols[a], lwd = 2)
  }
  mtext(side = 3, paste0("Mohn's Rho = ", round(mohns$AFSC_Hurtado_Bratio,3)) ) 
  #legend("topleft", legend = c("Retro -1", "Retro -2", "Retro -3", "Retro -4", "Retro -5"), col = cols[2:length(endyr)], lty =1, lwd =2, bty = 'n')
  
  ymax = 0.75
  ymin = -0.75
  find = which(recr.rho$Yr ==xstart | recr.rho$Yr == endyr[1])
  plot(recr.rho[find[1]:find[2],1], recr.rho[find[1]:find[2],1], ylim = c(ymin, ymax), col = cols[1], ylab = "Relative Recruitment Error", xlab = "Year", lwd = 2, cex.lab = 1.5, cex.axis = 1.5)
  abline(h = 0, lty = 2)
  for(a in 2:length(endyr)){
    find = which(recr.rho$Yr ==xstart | recr.rho$Yr == endyr[a])
    lines(recr.rho[find[1]:find[2], 1], recr.rho[find[1]:find[2], a+1], col = cols[a], lwd = 2)
  }
  mtext(side = 3, paste0("Mohn's Rho = ", round(mohns$AFSC_Hurtado_Rec,3)) ) 
  #legend("topleft", legend = c("Retro -1", "Retro -2", "Retro -3", "Retro -4", "Retro -5"), col = cols[2:length(endyr)], lty =1, lwd =2, bty = 'n')

dev.off()


##################################################################
# Squid Plot - need to run longer retro
##################################################################

pngfun(wd = retro.folder, file = "Squid_RecDevs.png", h = 7, w = 7)
SSplotRetroRecruits(retroSummary = mysummary,
                    endyrvec = rev(2009:2020),
                    cohorts = 2005:2019,
                    ylim=NULL,uncertainty=FALSE,
                    labels=c('Recruitment deviation', 'Recruitment (billions)', 'relative to recent estimate', 'Age'),
                    main="",
                    mcmcVec=FALSE,devs=TRUE,
                    relative=FALSE,labelyears=TRUE,legend=FALSE,leg.ncols=4)
dev.off()