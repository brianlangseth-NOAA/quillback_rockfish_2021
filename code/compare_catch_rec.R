#############
#'Function to compare catches with recruitment
#'Output is up to two figures showing comparison or comparison lagged by specified number of years
#'Can plot iether total number of age 0 recruits, or recruitment devs.
#'
#' @param model SS_output from r4ss
#' @param plots Which plots to output (options: all, 1 (no offset plot), 2 (offset plot))
#' @param offset Time lag (number of years) from catch after recruitment (default is 0)
#' @param type Either recdevs (default) or total recruits ("recruits")
#' 
#' @author Brian Langseth
#' @export
##############

compare_catch_rec <- function(model, plots, offset = 0, type = "devs"){
  
  start_yr <- model$startyr
  end_yr <- model$endyr
  
  #Extract catch - summed over fleets
  sum_catch <- aggregate(Obs ~ Yr, data = model$catch, FUN=sum) #1916-2020
  catch_yr <- sum_catch[which(sum_catch$Yr %in% c(start_yr:end_yr)), "Obs"]
  
  rec <- model$recruit[which(model$recruit$Yr %in% c(start_yr:end_yr)), "dev"] 
  #Extract predicted recruitment
  if(type == "recruits"){
    rec <- model$recruit[which(model$recruit$Yr %in% c(start_yr:end_yr)), "pred_recr"] 
  }
  
  if(plots == "all" || plots == 1) {
    #Plot 1: Plot catch and recruitment time series
    par(mar=c(5,4,2,4))
    plot(start_yr:end_yr, catch_yr, type="l", ylab = "Obs Catch", lwd = 2, xlab = "Year")
    par(new=T)
    plot(start_yr:end_yr, rec,type = "l", col = 2, xaxt = "n", yaxt = "n", xlab = "", ylab = "", lwd = 2)
    axis(4)
    mtext(side = 4, line = 2.5, "Recruits (1000s)")
    legend("topleft",lty=1,col=c(1,2),legend = c("Catch","Recruits"), bty = "n")
  }
  
  if(plots == "all" || plots == 2) {
    #Plot 2: Plot catch versus recruitment with offset of number of years
    par(mar=c(5,4,2,4))
    plot(start_yr:end_yr, catch_yr, type="l", ylab = "Obs Catch", lwd = 2, xlab = "Year")
    par(new=T)
    plot(start_yr:end_yr, c(rep(NA,offset),rec[1:(length(rec)-offset)]),type = "l", col = 2, xaxt = "n", yaxt = "n", xlab = "", ylab = "", lwd = 2)
    axis(4)
    mtext(side = 4, line = 2.5, "Recruits (1000s)")
    legend("topleft", lty=c(1,1,NA), col=c(1,2,NA), legend = c("Catch","Recruits"), title = paste("Offset =",offset,"yrs"), bty = "n")
  }
  
  
}

