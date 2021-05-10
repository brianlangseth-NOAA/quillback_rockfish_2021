############################################################
# Plots for SSS runs, which were provided by Jason
############################################################

library(sa4ss)
dir = "C:/Users/Brian.Langseth/Desktop/WA_quillback_SSS" #where model files are located
savedir = "L:/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/models/WA_quillback_SSS" #where to save plots
base = "WA_10_0_0_base"
dep = 40
load(file.path(dir, "SSS_out.DMP"))
load(file.path(dir, "SSSoutput.DMP"))
out = SSS.out
reps = SSS.output.list

ssb = apply(out$SB_series[1:494,], 2, quantile, c(0.025, 0.5, 0.975))
depl = apply(out$Rel_Stock_status_series[1:494,], 2, quantile, c(0.025, 0.5, 0.975))
m.f = out$Priors$M_f[1:494]
m.m = out$Priors$M_m[1:494]
h   = out$Priors$h[1:494]
depl.prior = out$Priors$Dep[1:494]
abc = apply(out$ABC, 2, quantile, c(0.025, 0.50, 0.975))
ofl = apply(out$OFL, 2, quantile, c(0.025, 0.50, 0.975))

png(filename = paste0(file.path(savedir, "plots", paste0(base, "_Priors.png"))), w = 7, h = 7, units = "in", res = 300)
par(mfrow = c(2,2))
hist(m.f, xlab = "Natural Mortality (f)", main = "")
abline(v = median(m.f), col = 'red', lwd = 3)
hist(m.m, xlab = "Natural Mortality (m)", main = "")
abline(v = median(m.m), col = 'red', lwd = 3)
hist(h, xlab = "Steepness", main = "")
abline(v = mean(h), col = 'red', lwd = 3)
hist(depl.prior, xlab = "Fraction Unfished", main = "")
abline(v = mean(depl.prior), col = 'red', lwd = 3)
dev.off()

png(filename = paste0(file.path(savedir, "plots", paste0(base, "_quants.png"))), w = 7, h = 7, units = "in", res = 300)
par(mfrow = c(2,2))
plot(colnames(ssb), ssb[2,], ylim = c(0, max(ssb)), type = 'l', lwd = 2, 
	ylab = "Spawning output", xlab = "Year")
lines(colnames(ssb), ssb[1,], lty = 2)
lines(colnames(ssb), ssb[3,], lty = 2)
plot(colnames(depl), depl[2,], ylim = c(0, 1), type = 'l', lwd = 2,
	ylab = "Fraction unfished", xlab = "Year")
lines(colnames(depl), depl[1,], lty = 2)
lines(colnames(depl), depl[3,], lty = 2)
abline(h = 0.40, lty = 3, col = 'red')
abline(h = 0.25, lty = 3, col = 'red')
boxplot(ofl[,1:3], ylab = "OFL (mt)", xlab = "Year")
boxplot(abc[,1:3], ylab = "ABC (mt)", xlab = "Year")
dev.off()

final = "2020" #SHOULD BE 2021
fore = "2023"
df = rbind(
	 ssb_unfished = c(ssb[2,1], ssb[1,1], ssb[3,1]),
	 ssb_final = c(ssb[2,final], ssb[1,final], ssb[3,final]),
	 depl_final = c(depl[2, final], depl[1, final], depl[3,final]),
	 ofl = c(ofl[2, fore], ofl[1, fore], ofl[3, fore]),
	 abc = c(abc[2, fore], abc[1, fore], abc[3, fore]))
df = round(df,2)

col_names = c("Median", "Lower Interval", "Upper Interval")
rownames(df) = c("SSB Unfished", paste("SSB", final), 
				 paste("Fraction Unfished", final), paste("OFL", fore), paste("ABC", fore))

t = table_format(x = df,
      caption = paste('Derived quantities from SSS based on assuming fraction unfished of', dep, 'percent in', final, "."),
      label = paste0("SSS_", dep),
      longtable = TRUE,
      font_size = 9,
      #digits = 3,
      landscape = FALSE,
      col_names = col_names,
      format.args = list(big.mark = ','))

kableExtra::save_kable(t,
file = paste0("C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sss_", dep,".tex"))
