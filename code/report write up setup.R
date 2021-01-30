##
#Write up document set-up for data moderate quillback report.
#Obtained from setup pdf located at: 
#https://github.com/chantelwetzel-noaa/copper_rockfish_2021/tree/master/write_up/sa4ss_guide
##

remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss)

setwd("U:/Stock assessments/quillback_rockfish_2021/write_up/or")
setwd("C:/Users/Brian.Langseth/Desktop/or/write_up")

#Set up default document sections. May need to delete a few
sa4ss::draft(authors = c("Brian J. Langseth",
                         "Chantel R. Wetzel",
                         "Alison D. Whitman"),
             species = "Quillback Rockfish",
             latin = "Sebastes maliger",
             coast = "Oregon US West",
             type = c("sa"),
             create_dir = FALSE,
             edit = FALSE)

#Read in model, asign whether to creat plots function. Currently also generates tables
##NOT CURRENTLY WORKING - need to follow up
sa4ss::read_model(mod_loc = "C:/Users/Brian.Langseth/Desktop/or/3_0_base", create_plots = FALSE)

bookdown::render_book("00a.Rmd", clean = FALSE, output_dir = getwd())
