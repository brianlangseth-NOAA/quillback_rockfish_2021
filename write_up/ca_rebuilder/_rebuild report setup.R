##
#Write up document set-up for quillback CA rebuilding report.
#Obtained from setup pdf located at: 
#https://github.com/chantelwetzel-noaa/copper_rockfish_2021/tree/master/write_up/sa4ss_guide
##

#detach("package:sa4ss", unload = TRUE)
#remotes::install_github("nwfsc-assess/sa4ss")
library(devtools)
library(sa4ss)
library(r4ss)
#remotes::install_github("nwfsc-assess/PEPtools")
library(PEPtools)
source_url("https://raw.githubusercontent.com/r4ss/r4ss/main/R/RebuildPlot.R")
#i SHA-1 hash of file is 741ae49399d34dc12492088ecc2d1c3c93666e56

# Specify the directory for the document
setwd("C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up")

#Do once: Set up default document sections. May need to delete a few
sa4ss::draft(authors = c("Brian J. Langseth",
                         "Chantel R. Wetzel"),
             species = "Quillback Rockfish",
             latin = "Sebastes maliger",
             coast = "California US West",
             type = c("sa"),
             create_dir = FALSE,
             edit = FALSE)

source_url("https://raw.githubusercontent.com/chantelwetzel-noaa/copper_rockfish_2021/master/code/get_values_rebuilder.R")
#i SHA-1 hash of file is 7bdea98ad6a4ef578ae93a9619973e59cc29a1c5

# Specify the directory where the models are at
rebuild_dir = "C:/Users/Brian.Langseth/Desktop/ca/rebuilder"

# #Test runs based on these models
# run <- c(
#   "930_F2017_2019_ageStruc2021",
#   "931_no_abc_max",
#   "tests/4_test_run_oneSex")
#Report is based on these models
run <- c(
  "933_StatesOfNature", #correctly applying the states of nature uncertainty
  "933b_no_abc_max",
  "940_recComBlock2001", #sensitivity rebuilder, no states of nature applied
  "940b_no_abc_max",
  "931_Tmax", #strategy to set Tmax, states of nature not applied correctly
  "931b_Tmax_no_abc_max",
  "tests/6_test_2sexSS", #test run based on SS model with Ngender = 2
  "930_F2017_2019_ageStruc2021", #original run, but states of nature not applied correctly
  "930b_no_abc_max")

reb <- list()
for (a in 1:length(run)){
  reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[a]))
}
save(reb, file = file.path(getwd(), "00mod.Rdata"))

base.920 = r4ss::SS_output(file.path(rebuild_dir, "9_2_0_RelF2017_2019"), covar = TRUE, 
                           verbose = FALSE, printstats = FALSE)
sens.940 = r4ss::SS_output(file.path(rebuild_dir, "9_4_0_recComBlock2001"), covar = TRUE, 
                           verbose = FALSE, printstats = FALSE)

if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())


