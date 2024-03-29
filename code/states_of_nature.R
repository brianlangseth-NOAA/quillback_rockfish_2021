####
#Script to generate high and low states of natures for all models
#Function copied from Chantel Wetzel: https://github.com/chantelwetzel-noaa/dover_sole_2021/blob/master/code/dover_decision_table_solver.R
#Use115 modified to true to use lognormal distribution
#on August 11, 2021
####

library(r4ss)

##################
##Oregon models
##################

wd = "C:/Users/Brian.Langseth/Desktop/or/decision_tables"
dir = file.path(wd, "8_0_0_postSSC_base")

#M
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[1]"), quant = c(0.875), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "NatM_p_1_Fem_GP_1", 
          est = FALSE,
          sigma = 0.33,
          use_115 = TRUE,
          slope = "pos")
#0.0752

find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[1]"), quant = c(0.125), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "NatM_p_1_Fem_GP_1", 
          est = FALSE,
          sigma = 0.33,
          use_115 = TRUE,
          slope = "pos")
#0.044

#R0
#Need to update the base to have another parameter with phase 1 (select comm selex parm1)
#Do so in "8_0_0_postSSC_base_forR0"
find_para(dir = paste0(dir,"_forR0"), 
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.875), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 0.33,
          use_115 = TRUE,
          slope = "pos")
#2.28

find_para(dir = paste0(dir,"_forR0"),  
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.125), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 0.33,
          use_115 = TRUE,
          slope = "pos")
#2.01

#Repeat but use SIGMA = 1.0
find_para(dir = paste0(dir,"_forR0"), 
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.875), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 1.0,
          use_115 = TRUE,
          slope = "pos")
#2.585 for target of 29.077

find_para(dir = paste0(dir,"_forR0"),  
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.125), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 1.0,
          use_115 = TRUE,
          slope = "pos")
#1.715 for target of 2.915

#Lmax
#Adjust the largest step size for this run from 0.04 to 0.5, and both finer
#step sizes from 0.005 to 0.005 (first) and 0.001 to 0.01 (second) to speed up search
#And adjust bounds from 0.05, and 0.02 from target to 0.1 and 0.02
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[3]"), quant = c(0.875), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "L_at_Amax_Fem_GP_1", 
          est = FALSE,
          sigma = 0.33,
          use_115 = TRUE,
          slope = "neg")
#40.51

#Adjust the largest step size for this run from 0.04 to 0.5, and both finer
#step sizes from 0.005 to 0.01 (first) and 0.001 to 0.05 (second) to speed up search
#And adjust bounds from 0.05, and 0.02 from target to 0.1 and 0.02
find_para(dir = dir,  
          yr = 2021, 
          parm = c("MGparm[3]"), quant = c(0.125), 
          ctl_name = "2021_or_quillback.ctl", 
          parm_string = "L_at_Amax_Fem_GP_1", 
          est = FALSE,
          sigma = 0.33,
          use_115 = TRUE,
          slope = "neg")
#43.89


##################
##Washington models
##################

wd = "C:/Users/Brian.Langseth/Desktop/wa/decision_tables"
dir = file.path(wd, "11_0_0_postSSC_base")

#M
#This doesn't work for this model because of instability in profile
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[1]"), quant = c(0.875), 
          ctl_name = "2021_wa_quillback.ctl", 
          parm_string = "NatM_p_1_Fem_GP_1", 
          est = FALSE,
          sigma = 0.58,
          use_115 = TRUE,
          slope = "neg")
#0.028

find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[1]"), quant = c(0.125), 
          ctl_name = "2021_wa_quillback.ctl", 
          parm_string = "NatM_p_1_Fem_GP_1", 
          est = FALSE,
          sigma = 0.58,
          use_115 = TRUE,
          slope = "neg")
#0.098

#R0
#Need to update the base to have another parameter with phase 1 (select comm selex parm1)
#Do so in "11_0_0_postSSC_base_forR0"
find_para(dir = paste0(dir,"_forR0"), 
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.875), 
          ctl_name = "2021_wa_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 0.58,
          use_115 = TRUE,
          slope = "pos")
#2.3

#Needed to adjust the largest step size for this run from 0.04 to 0.02, and both finer
#step sizes from 0.005 to 0.001 (first) and 0.01 to 0.001 (second) because never reached minimum
find_para(dir = paste0(dir,"_forR0"), 
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.125), 
          ctl_name = "2021_wa_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 0.58,
          use_115 = TRUE,
          slope = "pos")
#1.83

#Lmax
#Adjust the largest step size for this run from 0.04 to 0.5, and both finer
#step sizes from 0.005 to 0.005 (first) and 0.001 to 0.01 (second) to speed up search
#And adjust bounds from 0.05, and 0.02 from target to 0.1 and 0.02
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[3]"), quant = c(0.875), 
          ctl_name = "2021_wa_quillback.ctl", 
          parm_string = "L_at_Amax_Fem_GP_1", 
          est = FALSE,
          sigma = 0.58,
          use_115 = TRUE,
          slope = "neg")
#42.08

#Adjust the largest step size for this run from 0.04 to 0.5, and both finer
#step sizes from 0.005 to 0.01 (first) and 0.001 to 0.05 (second) to speed up search
#And adjust bounds from 0.05, and 0.02 from target to 0.1 and 0.02
find_para(dir = dir,  
          yr = 2021, 
          parm = c("MGparm[3]"), quant = c(0.125), 
          ctl_name = "2021_wa_quillback.ctl", 
          parm_string = "L_at_Amax_Fem_GP_1", 
          est = FALSE,
          sigma = 0.58,
          use_115 = TRUE,
          slope = "neg")
#44.53



##################
##California models
##################

wd = "C:/Users/Brian.Langseth/Desktop/ca/decision_tables"
dir = file.path(wd, "9_0_0_postSSC_base")

#M
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[1]"), quant = c(0.875), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "NatM_p_1_Fem_GP_1", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "pos")
#0.0744 for target of 12.13

find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[1]"), quant = c(0.125), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "NatM_p_1_Fem_GP_1", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "pos")
#0.0464 for target of 4.946

#R0
#Need to update the base to have another parameter with phase 1 (select comm selex parm1)
#Do so in "9_0_0_postSSC_base_forR0"
find_para(dir = paste0(dir,"_forR0"), 
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.875), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "pos")
#3.323 for target of 12.13

find_para(dir = paste0(dir,"_forR0"),  
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.125), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "pos")
#3.003 for target of 4.946 

#Repeat but use SIGMA = 1.0 
find_para(dir = paste0(dir,"_forR0"), 
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.875), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 1.0,
          use_115 = TRUE,
          slope = "pos")
#3.553 for target of 24.46

#Need to adjust smallest step size from 0.005 to 0.0025
find_para(dir = paste0(dir,"_forR0"),
          yr = 2021, 
          parm = c("SR_parm[1]"), quant = c(0.125), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "SR_LN(R0)", 
          est = FALSE,
          sigma = 1.0,
          use_115 = TRUE,
          slope = "pos")
#2.731 for target of 2.452

#Lmax
#Adjust the largest step size for this run from 0.04 to 0.5, and both finer
#step sizes from 0.005 to 0.01 (first) and 0.01 to 0.05 (second) to speed up search
#And adjust bounds from 0.05 from target to 0.1
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[3]"), quant = c(0.875), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "L_at_Amax_Fem_GP_1", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "neg")
#41.86 for target of 12.13

#Adjust the largest step size for this run from 0.04 to 0.5, and both finer
#step sizes from 0.005 to 0.01 (first) and 0.01 to 0.05 (second) to speed up search
#And adjust bounds from 0.05 from target to 0.1
find_para(dir = dir,  
          yr = 2021, 
          parm = c("MGparm[3]"), quant = c(0.125), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "L_at_Amax_Fem_GP_1", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "neg")
#44.05 for target of 4.946


#K
find_para(dir = dir, 
          yr = 2021, 
          parm = c("MGparm[4]"), quant = c(0.875), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "VonBert_K_Fem_GP_1", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "neg")
#0.152 for target of 12.13

#K
find_para(dir = dir,  
          yr = 2021, 
          parm = c("MGparm[4]"), quant = c(0.125), 
          ctl_name = "2021_ca_quillback.ctl", 
          parm_string = "VonBert_K_Fem_GP_1", 
          est = FALSE,
          sigma = 0.39,
          use_115 = TRUE,
          slope = "neg")
#0.245 for target of 4.946


############ This is the function ##############


#' @param dir the directory pointing to the model
#' @param base object created by SS_output. If left blank the model located in the dir
#' location will be defined as the base object
#' @param yr the year to calculate the 12.5 and 87.5 percentiles around
#' @param parm the par.ss file parameter name
#' @param quant the quantiles to use - not directly used in the current code
#' @param ctl_name if you need to turn off a parameter (R0) this will be done in the named
#' control file
#' @param parm_string parameter name from the control file for the parameter to turn off
#' @param est turns off the parameter in the control file default value is FALSE
#' @param sigma sigma value to use, options are 0.50, 1.0, or if left blank will use the Pstar_sigma
#' @param slope vector of length parm. Indicates if SB increases as values go up (pos) or down (neg)

find_para <- function(dir, base, yr = 2021, parm = c("MGparm[1]"), 
                      quant = c(0.125, 0.875), 
                      ctl_name, parm_string, est = FALSE, sigma, 
                      tol = 0.005, use_115 = FALSE, slope = "pos")
{
  
  for (tt in 1:length(quant)){
    
    dec_dir <- paste0(dir, "_decision_table_1.15_", sigma, "_", quant[tt])
    dir.create(dec_dir, showWarnings = FALSE)
    
    # Check for existing files and delete
    if (length(list.files(dec_dir)) != 0) { 
      remove <- list.files(dec_dir) 
      file.remove(file.path(dec_dir, remove)) 
    }
    
    all_files <- list.files(dir)
    capture.output(file.copy(from = file.path(dir, all_files), 
                             to = dec_dir, overwrite = TRUE), file = "run_diag_warning.txt")
    message(paste0( "Running search for ", parm, " solved for ", quant[tt], ".") )
    
    setwd(dec_dir)
    
    starter <- r4ss::SS_readstarter(file.path(dec_dir, 'starter.ss'))
    if(!missing(ctl_name)) {
      r4ss::SS_changepars(ctlfile = ctl_name, 
                          newctlfile = paste0("_mod_", ctl_name), 
                          strings = parm_string,  
                          estimate = est)
      starter$ctlfile = paste0("_mod_", ctl_name)
    }
    
    starter$init_values_src <- 1 # run from the par file
    r4ss::SS_writestarter(starter, dir = dec_dir, overwrite=TRUE)
    
    # This should always read the base model in the dir folder
    base = r4ss::SS_output(dir, printstats = FALSE, verbose = FALSE, covar = FALSE, ncol = 300)	
    par.name = "ss.par"
    
    sb = base$derived_quants[grep(paste0('SSB_', yr), base$derived_quants$Label), c("Value", "StdDev")]
    #target = round(qnorm(quant[tt], mean = sb[,"Value"], sd = sb[,"StdDev"]), 1)
    
    if(missing(sigma)){
      sigma = base$Pstar_sigma
    }
    
    if(quant[tt] == 0.125) {
      target = sb$Value/(exp(1.15*sigma))			
    } else {
      target = sb$Value/(exp(-1.15*sigma))
    }
    
    if (!use_115){
      target = qnorm(quant[tt], mean = sb[,"Value"], sd = sb[,"StdDev"])
    }
    
    for(a in 1:100){
      
      if(a == 1){
        find_sb = as.numeric(sb["Value"])
      }else{
        low = SS_output(dec_dir, printstats = FALSE, verbose = FALSE, covar = FALSE, ncol = 300)
        find_sb = low$derived_quants[grep(paste0('SSB_', yr), low$derived_quants$Label), "Value"]
      }
      
      print(paste0("!!!!!!!!!!!   SB = ", find_sb, " vs Target = ", target, "    !!!!!!!!!!!"))	
      if (find_sb > target - target * tol & find_sb < target + target * tol){
        print(paste0("Found solution -- parameter value = ", temp, " matches target SB in ", yr))
        write.table(paste(parm, "=", temp, "for Target SB = ", target), 
                    file = file.path(dec_dir, "_Solved_Param_Value.txt"))
        break()
      }
      
      rawpar    <- readLines(file.path(dec_dir, "ss.par"))
      which_line <- NULL
      for(pp in 1:length(parm)){
        temp = grep(parm[pp], rawpar, fixed = TRUE) + 1
        which_line = c(which_line, temp)
      }
      temp = as.numeric(rawpar[which_line])
      
      if(temp[1] < 0.40) {
        step.size = ifelse(find_sb > target - target * 0.05 & find_sb < target + target * 0.05, 
                           ifelse(find_sb > target - target* 0.02 & find_sb < target + target * 0.02,
                                  0.0002, 0.001), 0.002)
      } else {
        #step.size =ifelse(find_sb > target - target * 0.05 & find_sb < target + target * 0.05, 
        #                   ifelse(find_sb > target - target* 0.02 & find_sb < target + target * 0.02,
        #                          0.005, 0.01), 0.04)	
        step.size =ifelse(find_sb > (target - target * 0.1) & find_sb < (target + target * 0.1), 
                          ifelse(find_sb > (target - target* 0.02) & find_sb < (target + target * 0.02),
                                 0.01, 0.05), 0.5)	
      }
      
      if(slope[tt] == "pos"){
        value = ifelse( find_sb > target, temp - step.size,
                        ifelse (find_sb < target, temp + step.size, temp))
      }
      if(slope[tt] == "neg"){
        value = ifelse( find_sb > target, temp + step.size,
                       ifelse (find_sb < target, temp - step.size, temp))
      }
      print(paste0("!!!!!!!!!!!  ", value, "  !!!!!!!!!!!"))
      temp = value
      rawpar[which_line] = temp
      writeLines(rawpar, con = file.path(dec_dir, "ss.par"))
      shell("ss -nohess -maxfun 0 > output.txt 2>&1")  
      
      if (parm_string == "SR_BH_steep" & value == 1.0){
        print("Hit the upper bound for steepness")
        break()
      }
    } # end a loop
  } # end tt loop
  
} # close function