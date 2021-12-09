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

# Specify the directory for the document
setwd("C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up_postNov")

# #Do once: Set up default document sections. May need to delete a few
# sa4ss::draft(authors = c("Brian J. Langseth",
#                          "Chantel R. Wetzel"),
#              species = "Quillback Rockfish",
#              latin = "Sebastes maliger",
#              coast = "California US West",
#              type = c("sa"),
#              create_dir = FALSE,
#              edit = FALSE)

source_url("https://raw.githubusercontent.com/chantelwetzel-noaa/copper_rockfish_2021/master/code/get_values_rebuilder.R")

# Specify the directory where the models are at
rebuild_dir = "C:/Users/Brian.Langseth/Desktop/ca/rebuilder"

#Report is based on these models
run <- c(
  "1010_postNov", #same policies as original
  "1010b_no_abc_max",
  "1011_addedSPRruns", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1011b_no_abc_max",
  "1013_ramp0.7_2", #ramp applied and ensured to be more of a ramp for 2024-2025 than 2023-2024, only use SPR 0.7 policy
  "1013_ramp0.6", #ramp applied, only use SPR 0.6 policy
  "1013_ramp0.55") #ramp applied, only use SPR 0.55 policy

#Now commented out because sourcing get_values_rebuilder is a different pulled now but above models (in reb) were already saved
reb <- list()
for (a in 1:length(run)){
  reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[a]))
}
save(reb, file = file.path(getwd(), "00mod.Rdata"))

if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())


