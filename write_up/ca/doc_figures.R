##
#For plotting rec bias adjust without the model recommended values
#Pulled from github r4ss, SS_fitbiasramp.R
##

##California
wd = "C:/Users/Brian.Langseth/Desktop/ca"
model = "7_1_0_base"
base.710 = SS_output(file.path(wd, model),covar=TRUE)
replist = base.710

#Prep report information
parameters <- replist[["parameters"]]
startyr <- replist[["startyr"]]
recruit <- replist[["recruit"]]
sigma_R_in <- replist[["sigma_R_in"]]
rmse_table <- replist[["rmse_table"]]
plotdir <- replist[["inputs"]][["dir"]]

recdevs <- replist[["recruitpars"]][!is.na(replist[["recruitpars"]][["Parm_StDev"]]), ]
val <- recdevs[["Value"]]
std <- recdevs[["Parm_StDev"]]
yr <- recdevs[["Yr"]]

is.forecast <- yr > replist[["endyr"]]
col.vec <- ifelse(is.forecast, "gray", "black")

#Plot figure
png(
    filename = file.path(plotdir, "plots", "recruit_fit_bias_adjust_forReport.png"),
    width = 6.5, height = 5.0, units = "in", res = 300, pointsize = 10
  )

yvals <- 1 - (std / sigma_R_in)^2
plot(yr, yvals,
     xlab = "Year", ylab = "",
     ylim = range(min(yvals, 0), 1, 1.3),
     type = "b", yaxs = "i", col = col.vec
)
abline(h = 0, col = "grey")
abline(h = 1, col = "grey")
mtext(side = 2, line = 2.5, expression(1 - italic(SE(hat(r[y]))^2 / sigma[R])^2))

legendlines <- 1
lines(recruit[["Yr"]], recruit[["biasadjuster"]], col = 2, lwd = 3, lty = 2)
legend("topleft",
       col = c(2, 4)[legendlines], lwd = 3, lty = (2:1)[legendlines],
       inset = .01, cex = .9, bg = rgb(1, 1, 1, .8), box.col = NA,
       legend = c("bias adjust in model", "estimated alternative")[legendlines]
)
mtext(side = 1, line = 3, "Year")

dev.off()
  