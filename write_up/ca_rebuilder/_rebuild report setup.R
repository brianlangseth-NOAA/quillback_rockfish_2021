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
setwd("C:/Users/Brian.Langseth/Desktop/ca/rebuilder/write_up_2023rebuild")

# #Do once: Set up default document sections. May need to delete a few
# sa4ss::draft(authors = c("Brian J. Langseth"),
#              species = "Quillback Rockfish",
#              latin = "Sebastes maliger",
#              coast = "California US West",
#              type = c("sa"),
#              create_dir = FALSE,
#              edit = FALSE)

source_url("https://raw.githubusercontent.com/chantelwetzel-noaa/copper_rockfish_2021/master/code/get_values_rebuilder.R")

# Specify the directory where the models are at
rebuild_dir = "C:/Users/Brian.Langseth/Desktop/ca/rebuilder"

# #Report is based on these models
# run <- c(
#   "1100_2023", #same policies as original
#   "1100b_no_abc_max",
#   "1101_addedSPRruns", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
#   "1101b_no_abc_max",
#   "1102b_TmaxRuns_no_abc_max")
# run_alt <- c(
#   "1200_2023altCatch", #same policies as original
#   "1200b_no_abc_max",
#   "1201_addedSPRruns", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
#   "1201b_no_abc_max")

#Use these models if want relative Fs to approximate fleet specific catch for 2021-2024
run <- c(
  "1110_2023_relF", #same policies as original
  "1110b_no_abc_max_relF",
  "1111_addedSPRruns_relF", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1111b_no_abc_max_relF",
  "1112b_TmaxRuns_no_abc_max_relF")
run_alt <- c(
  "1210_2023altCatch_relF", #same policies as original
  "1210b_no_abc_max_relF",
  "1211_addedSPRruns_relF", #SPR at 0.5, 0.55, 0.6, 0.65, 0.7
  "1211b_no_abc_max_relF")

#Now commented out because sourcing get_values_rebuilder is a different pulled now but above models (in reb) were already saved
reb <- list()
reb_alt <- list()
for (a in 1:length(run)){
  reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[a]))
  if(a <= length(run_alt)){
    reb_alt[[a]] <- get_values(rebuild_dir = file.path(rebuild_dir, run_alt[a]))
  }
}
save(reb, reb_alt, file = file.path(getwd(), "00mod.Rdata"))

if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())

# #Can automate but tags are removed. Combine manually
# library(pdftools)
# pdf_combine(c("_main.pdf", "CA_quillback_rebuilder_file_2023rebuild_noTitle.pdf"), 
#             output = "CA_quillback_rebuilding_2023_MopUp_Sept11.pdf")
