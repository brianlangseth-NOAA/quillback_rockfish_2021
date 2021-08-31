############################################################
# Plots for SSS runs, which were provided by Jason
############################################################

library(sa4ss)
dir = "C:/Users/Brian.Langseth/Desktop/WA_SSS" #where model files are located
dep = 40 #<-----CHANGE THIS BETWEEN 40 and 57
if(dep ==40) savedir = paste0("L:/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/models/SSS_inputs/WA_Quillback_SSS_biocatch_40dep_5_18") #where to save plots
if(dep ==40) savedir = file.path(dir,"WA_Quillback_SSS_biocatch_40dep_LWcorrect") #where to save plots
if(dep ==40) savedir = file.path(dir,"WA_Quillback_SSS_biocatchGMT_40dep_LWcorrect") #where to save plots
if(dep ==57) savedir = paste0("L:/Assessments/CurrentAssessments/DataModerate_2021/Quillback_Rockfish/models/SSS_inputs/WA_Quillback_SSS_biocatch_57dep_5_18") #where to save plots
if(dep ==57) savedir = file.path(dir,"WA_Quillback_SSS_biocatch_57dep_LWcorrect") #where to save plots
if(dep ==57) savedir = file.path(dir,"WA_Quillback_SSS_biocatchGMT_57dep_LWcorrect") #where to save plots

if(dep == 40) load(file.path(dir, paste0("WA_Quillback_SSS_biocatch_40dep_5_18"), "SSS_out.DMP"))
if(dep == 40) load(file.path(dir, paste0("WA_Quillback_SSS_biocatch_40dep_LWcorrect"), "SSS_out.DMP"))
if(dep == 40) load(file.path(dir, paste0("WA_Quillback_SSS_biocatchGMT_40dep_LWcorrect"), "SSS_out.DMP"))
if(dep == 57) load(file.path(dir, paste0("WA_Quillback_SSS_biocatch_57dep_5_18"), "SSS_out.DMP"))
if(dep == 57) load(file.path(dir, paste0("WA_Quillback_SSS_biocatch_57dep_LWcorrect"), "SSS_out.DMP"))
if(dep == 57) load(file.path(dir, paste0("WA_Quillback_SSS_biocatchGMT_57dep_LWcorrect"), "SSS_out.DMP"))

#load(file.path(dir, base, "SSSoutput.DMP"))
out = SSS.out
#reps = SSS.output.list

ssb = apply(out$SB_series, 2, quantile, c(0.025, 0.5, 0.975), na.rm=T) #18 NA values
colnames(ssb) = 1958:2034
depl = apply(out$Rel_Stock_status_series, 2, quantile, c(0.025, 0.5, 0.975), na.rm=T)
colnames(depl) = 1958:2034
m = out$Priors$M_f #Though its M for female, and males are 0 (males are given same value as females)
h   = out$Priors$h
linf = out$Priors$Linf_f
k = out$Priors$k_f
depl.prior = out$Priors$Dep
abc = apply(out$ABC, 2, quantile, c(0.025, 0.50, 0.975), na.rm=T)
ofl = apply(out$OFL, 2, quantile, c(0.025, 0.50, 0.975), na.rm=T)

png(filename = paste0(file.path(savedir, "plots", paste0("SSS_",dep, "_Priors.png"))), w = 7, h = 7, units = "in", res = 300)
par(mfrow = c(3,2))
hist(m, xlab = "Natural Mortality", main = "")
abline(v = median(m), col = 'red', lwd = 3)
hist(h, xlab = "Steepness", main = "")
abline(v = median(h), col = 'red', lwd = 3)
hist(linf, xlab = "Length at Maximum Size", main = "")
abline(v = median(linf), col = 'red', lwd = 3)
hist(k, xlab = "von Bertalanffy Growth Coefficient", main = "")
abline(v = median(k), col = 'red', lwd = 3)
hist(depl.prior, xlab = "Fraction Unfished", main = "")
abline(v = median(depl.prior), col = 'red', lwd = 3)
dev.off()

png(filename = paste0(file.path(savedir, "plots", paste0("SSS_",dep, "_quants.png"))), w = 7, h = 7, units = "in", res = 300)
par(mfrow = c(2,2))
plot(colnames(ssb)[1:64], ssb[2,1:64], ylim = c(0, max(ssb)), type = 'l', lwd = 2, 
	ylab = "Spawning output", xlab = "Year")
lines(colnames(ssb)[1:64], ssb[1,1:64], lty = 2)
lines(colnames(ssb)[1:64], ssb[3,1:64], lty = 2)
plot(colnames(depl)[1:64], depl[2,1:64], ylim = c(0, 1), type = 'l', lwd = 2,
	ylab = "Fraction unfished", xlab = "Year")
lines(colnames(depl)[1:64], depl[1,1:64], lty = 2)
lines(colnames(depl)[1:64], depl[3,1:64], lty = 2)
abline(h = 0.40, lty = 3, col = 'red')
abline(h = 0.25, lty = 3, col = 'red')
boxplot(ofl, ylab = "OFL (mt)", xlab = "Year")
boxplot(abc, ylab = "ABC (mt)", xlab = "Year")
dev.off()

final = "2021"
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
      caption = paste0('Derived quantities from SSS based on assuming fraction unfished of ', dep, ' percent in ', final, "."),
      label = paste0("SSS-", dep),
      longtable = TRUE,
      font_size = 9,
      #digits = 3,
      landscape = FALSE,
      col_names = col_names,
      format.args = list(big.mark = ','))

kableExtra::save_kable(t, file = paste0("C:/Users/Brian.Langseth/Desktop/wa/11_1_0_postSSC_base/tex_tables/sss_", dep,".tex"))

#The SSS runs are based on the ABC control rule, not the constant catch control rule. Given these are not going
#to be used I am ok with this. 