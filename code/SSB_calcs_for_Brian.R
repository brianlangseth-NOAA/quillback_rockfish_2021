mod <- SS_output(...)

### lingcod-specific calcs used to test this
# devtools::load_all()
# get_mod('n', 2, yr=2021)
# mod <- mod.2021.n.002.001

wd = "C:/Users/Brian.Langseth/Desktop/wa"
model = "10_0_0_base"
base.1000 = SS_output(file.path(wd, model),covar=TRUE)
mod = base.1000

model = "10_4_0_fecund"
base.1040 = SS_output(file.path(wd, model),covar=TRUE)
mod = base.1040

dir = "C:/Users/Brian.Langseth/Desktop/WA_SSS" #where model files are located
load(file.path(dir, paste0("WA_Quillback_SSS_biocatch_40dep_5_18"), "SSSoutput.DMP"))
mod = SSS.output.list[[1]]

model = "test"
test = SS_output(file.path(dir, model),covar=TRUE)
mod = test

natage_2021 <- mod$natage[mod$natage$"Beg/Mid" == "B" &
                     mod$natage$Sex == 1 &
                     mod$natage$Yr==2021,paste(0:mod$accuage)]

fecundity_2021 <- mod$endgrowth$"Mat*Fecund"[mod$endgrowth$Sex == 1]

sum(natage_2021 * fecundity_2021)
# [1] 47459.05 # resulting value for lingcod mod.2021.n.002.001

mod$timeseries$SSB[mod$timeseries$Yr == 2021]
# [1] 47459.1 # resulting value for lingcod mod.2021.n.002.001



#If fecundity is set to weight
fecundity_2021 = mod$wtatage[mod$wtatage$Fleet == -2 &
             mod$wtatage$Sex == 1 &
             mod$wtatage$Yr==2021,paste(0:mod$accuage)]
