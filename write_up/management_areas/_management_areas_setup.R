##
#Write up document set-up for quillback management areas report.
#Obtained from setup pdf located at: 
#https://github.com/chantelwetzel-noaa/copper_rockfish_2021/tree/master/write_up/sa4ss_guide
#Based on and adjusted from copper management area 
#https://github.com/chantelwetzel-noaa/copper_rockfish_2021/tree/master/write_up/mop_up_area
##

#detach("package:sa4ss", unload = TRUE)
#remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss)
library(r4ss)

# Specify the directory for the document
setwd("C:/Users/Brian.Langseth/Desktop/management_areas")

#Do once: Set up default document sections. May need to delete a few
sa4ss::draft(authors = c("Brian J. Langseth",
                         "Chantel R. Wetzel"),
             species = "Quillback Rockfish",
             latin = "Sebastes maliger",
             coast = "U.S. West",
             type = c("sa"),
             create_dir = FALSE,
             edit = FALSE)

# Specify the directory where the models are at and read in models
# model_dir = "C:/Users/Brian.Langseth/Desktop"
# 
# wa_base = r4ss::SS_output(file.path(model_dir, "wa", "11_1_0_postSSC_base"), covar = TRUE, 
#                            verbose = FALSE, printstats = FALSE)
# or_base = r4ss::SS_output(file.path(model_dir, "or", "8_1_0_postMopUp_base"), covar = TRUE, 
#                            verbose = FALSE, printstats = FALSE)
# ca_base = r4ss::SS_output(file.path(model_dir, "ca", "9_0_0_postSSC_base"), covar = TRUE, 
#                          verbose = FALSE, printstats = FALSE)

if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())


