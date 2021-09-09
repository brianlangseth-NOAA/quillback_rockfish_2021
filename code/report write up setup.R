##
#Write up document set-up for data moderate quillback report.
#Obtained from setup pdf located at: 
#https://github.com/chantelwetzel-noaa/copper_rockfish_2021/tree/master/write_up/sa4ss_guide
##

#remotes::install_github("nwfsc-assess/sa4ss")
#remotes::install_github("r4ss/r4ss", ref = "development")
library(r4ss)
library(sa4ss)

##--------------------------------OREGON-----------------------------------##

setwd("C:/Users/Brian.Langseth/Desktop/or/write_up")

#Do once: Set up default document sections. May need to delete a few
sa4ss::draft(authors = c("Brian J. Langseth",
                         "Chantel R. Wetzel",
                         "Jason M. Cope",
                         "Alison D. Whitman"),
             species = "Quillback Rockfish",
             latin = "Sebastes maliger",
             coast = "Oregon US West",
             type = c("sa"),
             create_dir = FALSE,
             edit = FALSE)

#Read in model, assign whether to create plots function. Currently also generates tables
sa4ss::read_model(mod_loc = "C:/Users/Brian.Langseth/Desktop/or/7_1_0_base",         #review base
                  #mod_loc = "C:/Users/Brian.Langseth/Desktop/or/8_0_0_postSSC_base",  #post review base
                  create_plots = FALSE, 
                  html = FALSE,
                  save_loc = file.path(getwd(), "tex_tables"),
                  verbose = TRUE)

load("00mod.Rdata")

# Create tex files from the executive summary tables
SSexecutivesummary(replist = model, format = FALSE) #create table_labels.csv
sa4ss::es_table_tex(dir = mod_loc,
                    save_loc = file.path(getwd(), "tex_tables"),
                    csv_name = "table_labels.csv")

# Read and create tex files for tables listed in "table" folder in the doc
sa4ss::es_table_tex(dir = file.path(getwd(), 'tables'),
                    save_loc = file.path(getwd(), "tex_tables"),
                    csv_name = "all_tables.csv")

# Render call
if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
bookdown::render_book("00a.Rmd", clean = FALSE, output_dir = getwd())



##--------------------------------WASHINGTON-----------------------------------##

setwd("C:/Users/Brian.Langseth/Desktop/wa/write_up")

#Do once: Set up default document sections. May need to delete a few
sa4ss::draft(authors = c("Brian J. Langseth",
                         "Chantel R. Wetzel",
                         "Jason M. Cope",
                         "Tien-Shui Tsou",
                         "Lisa K. Hillier"),
             species = "Quillback Rockfish",
             latin = "Sebastes maliger",
             coast = "Washington US West",
             type = c("sa"),
             create_dir = FALSE,
             edit = FALSE)

#Read in model, assign whether to create plots function. Currently also generates tables
sa4ss::read_model(mod_loc = "C:/Users/Brian.Langseth/Desktop/wa/10_0_0_base",
                  #mod_loc = "C:/Users/Brian.Langseth/Desktop/wa/11_1_0_postSSC_base",  #post review base
                  create_plots = FALSE, 
                  html = FALSE,
                  save_loc = file.path(getwd(), "tex_tables"),
                  verbose = TRUE)

load("00mod.Rdata")

# Create tex files from the executive summary tables
SSexecutivesummary(replist = model, format = FALSE) #create table_labels.csv
sa4ss::es_table_tex(dir = mod_loc,
                    save_loc = file.path(getwd(), "tex_tables"),
                    csv_name = "table_labels.csv")


# Read and create tex files for tables listed in "table" folder in the doc
sa4ss::es_table_tex(dir = file.path(getwd(), 'tables'),
                    save_loc = file.path(getwd(), "tex_tables"),
                    csv_name = "all_tables.csv")

# Render call
if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
bookdown::render_book("00a.Rmd", clean = FALSE, output_dir = getwd())


##--------------------------------CALIFORNIA-----------------------------------##

setwd("C:/Users/Brian.Langseth/Desktop/ca/write_up")

#Do once: Set up default document sections. May need to delete a few
sa4ss::draft(authors = c("Brian J. Langseth",
                         "Chantel R. Wetzel",
                         "Jason M. Cope",
                         "John E. Budrick"),
             species = "Quillback Rockfish",
             latin = "Sebastes maliger",
             coast = "California US West",
             type = c("sa"),
             create_dir = FALSE,
             edit = FALSE)

#Read in model, assign whether to create plots function. Currently also generates tables and table_labels.csv
sa4ss::read_model(mod_loc = "C:/Users/Brian.Langseth/Desktop/ca/7_1_0_base", 
                  #mod_loc = "C:/Users/Brian.Langseth/Desktop/ca/9_0_0_postSSC_base",  #post review base
                  create_plots = FALSE, 
                  html = FALSE,
                  save_loc = file.path(getwd(), "tex_tables"),
                  verbose = TRUE)

load("00mod.Rdata")

# Create tex files from the executive summary tables (may need to rename allcatches table (Catches_All_Years.csv) as catch)
SSexecutivesummary(replist = model, format = FALSE) #create table_labels.csv
sa4ss::es_table_tex(dir = mod_loc,
                    save_loc = file.path(getwd(), "tex_tables"),
                    csv_name = "table_labels.csv")

# Read and create tex files for tables listed in "table" folder in the doc
sa4ss::es_table_tex(dir = file.path(getwd(), 'tables'),
                    save_loc = file.path(getwd(), "tex_tables"),
                    csv_name = "all_tables.csv")

# Render call
if(file.exists("_main.Rmd")){
  file.remove("_main.Rmd")
}
bookdown::render_book("00a.Rmd", clean = FALSE, output_dir = getwd())
