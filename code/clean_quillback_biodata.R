#' Clean biological data for quillback
#'
#' @param data A data frame
#'
#' @return A data frame
#'
#' @author Brian Langseth
#' @export
#'

clean_quillback_biodata <- function(dir = NULL, data){
  
  library(plyr)
  
  #######################################
  #Clean data over time
  #######################################
  
  #Remove any data without valid lengths
  print(paste("Removed",sum(is.na(data$Length)), "records without any length"))
  data = data[!is.na(data$Length),]
  
  pngfun(wd = dir, file = "Length_Weight_All_Sources.png", w = 7, h = 7, pt = 12)
  par(mfrow = c(3,2))
  for(s in unique(data$Source)){
    plot(data[data$Source == s, "Length"], data[data$Source == s, "Weight"], main = s, 
         xlim = c(0, 60), ylim = c(0,10), xlab = 'Length (cm)', ylab = 'Weight (kg)')
  }
  dev.off()
  #Data seem reasonable based on valid length-weight combinations. However, what about single length or weight values
  
  ##-------------------------------------
  #Check lengths
  ##-------------------------------------
  #There are a few very large fish, no very small fish
  summary(data$Length) 
  remove = which(data$Length > 65) #Palsson et al. 2009 lists Lmax as 61cm for quillback, thus 65 is reasonable extreme
  data[remove,]
  #Year Lat Lon State     State_Areas Areas Depth Sex Length Weight Age Fleet Data_Type Source
  #2012  NA  NA    OR              OR    NA    NA   U   88.9    7.2  NA  boat  RETAINED RecFIN
  #2012  NA  NA    OR              OR    NA    NA   U   88.8    9.5  NA  boat  RETAINED RecFIN
  #2006  NA  NA    CA north_pt_concep    NA    NA   U   99.9     NA  NA  boat  RETAINED RecFIN
  #2012  NA  NA    CA north_pt_concep    NA    NA   U   80.3    4.9  NA  boat  RETAINED RecFIN  
  #Remove these data points
  print(paste("Removed",length(remove), "records with lengths > 65 cm"))
  data = data[-remove,]
  
  
  ##-------------------------------------
  #Check weights
  ##-------------------------------------
  #There are a few very small fish, no very fat fish
  summary(data$Weight) 
  remove = which(data$Weight < 0.1)
  data[remove,]
  #But these were mostly all caught in the combo survey, so keep 
  
  ##-------------------------------------
  #Check ages - all reasonable
  ##-------------------------------------
  summary(data$Age)
  #Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  # 5.00    9.00   12.00   14.28   15.00   73.00   36083 
  
  # Double check the distribution of all lengths vs. the ages
  pngfun(wd = dir, file = "Compare_Lengths_for_Aged_Unaged_Fish.png", w = 7, h = 7, pt = 12)
  par(mfrow = c(2,2))
  for(sex in c("F", "M")){
    hist(data[data$Sex == sex, "Length"], xlim = c(0, 65),  xlab = "Length (cm)", 
         col = ifelse(sex == "F", alpha('red', 0.65), alpha('blue', 0.5)), main = paste0("All Fish Lengths: ", sex))
    abline(v = median(data[data$Sex == sex, "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 1)
    mtext(side = 3, line = -1, adj = 0, paste("N =",length(data[data$Sex == sex, "Length"])))
  }
  for(sex in c("F", "M")){
    find = which(!is.na(data$Age) & data$Sex == sex)
    hist(data[find, "Length"], , xlim = c(0, 65), xlab = "Length (cm)", 
         col = ifelse(sex == "F", alpha('red', 0.65), alpha('blue', 0.5)), main = paste0("Aged Fish Lengths: ", sex))
    abline(v = median(data[find, "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 1)
    mtext(side = 3, line = -1, adj = 0, paste("N =",length(data[find, "Length"])))
  }
  dev.off()
  
  ##-------------------------------------
  #Check length-age relationship
  ##-------------------------------------
  #Double check appearance of age-length relationships
  plot(x = data[data$Sex == "F",]$Age, y = data[data$Sex == "F",]$Length, col = 2, pch = 19)
  points(x = data[data$Sex == "M",]$Age, y = data[data$Sex == "M",]$Length, col = 4, pch = 19)
  points(x = data[data$Sex == "U",]$Age, y = data[data$Sex == "U",]$Length, col = 1, pch = 19)
  
  #Remove unusually small old fish (1 males, 1 females)
  remove = which(data$Length <= 31 & data$Age > 40)
  data[remove,]
  print(paste("Removed",length(remove), "records of small (<= 35 cm) old (> 35 yrs) fish"))
  data = data[-remove,]
  
  
  #######################################
  #Trends over time
  #######################################
  
  # What is the trend in length and age across time
  # This figure includes all data -- which may be biased due to selectivity
  pngfun(wd = dir, file = "Data_Summary_Len_Age_W_by_Year.png", w = 7, h = 7, pt = 12)
  par(mfrow = c(3, 1), mar = c(4,4,2,2), oma = c(1,1,1,1))
  plot(data[is.na(data$Age),"Year"], data[is.na(data$Age),"Length"], ylab = "Length (cm)", xlab = "Year", ylim = c(0, max(data[is.na(data$Age),"Length"], na.rm = TRUE)))
  tmp = aggregate (Length ~ Year, data, FUN = median)
  lines(tmp$Year, tmp$Length, lty = 1, col = 'red', lwd = 3)
  plot(data$Year, data$Age, ylab = "Age", xlab = "Year", ylim = c(0, max(data$Age, na.rm = TRUE)))
  tmp = aggregate (Age ~ Year, data, FUN = median)
  lines(tmp$Year, tmp$Age, lty = 1, col = 'red', lwd = 3)
  plot(data$Year, data$Weight, ylab = "Weight", xlab = "Year", ylim = c(0, max(data$Weight, na.rm = TRUE)))
  tmp = aggregate (Weight ~ Year, data, FUN = median)
  lines(tmp$Year, tmp$Weight, lty = 1, col = 'red', lwd = 3)
  dev.off()
  
  
  # What area and gear are the ages coming from? 
  table(data$Fleet, data$State_Areas, !is.na(data$Age))
  #, ,  = TRUE
  #                 north_pt_concep    OR ORage south_pt_concep    WA
  #boat                           0     0   783               0   238
  #com_alive                      0     0     0               0     0
  #com_dead_unknown               0   138     0               0     0
  #shore                          0     0     0               0     0
  #survey                         0     0     0               0     0
  #unknown                        0     0     0               0     0
  
  ############################################################################################
  # Trends over space
  ############################################################################################
  
  data$lat_bin = plyr::round_any(data$Lat, 0.5)
  pngfun(wd = dir, file = "Length_by_Latitude_Survey.png", w = 7, h = 7, pt = 12)
  par(mfrow = c(2, 1), mar = c(4,4,2,2), oma = c(1,1,1,1))
  for (ss in c("F", "M")){
    find = which(data$Sex == ss & data$Source %in% unique(data[!is.na(data$Lat),"Source"]))
    col = ifelse(ss == "F", alpha('red', 0.6), alpha('blue', 0.6))
    boxplot(data$Length[find] ~ data$lat_bin[find],  col = col, ylim = c(0, 70),
            ylab = "Length (cm)", xlab = "Latitude", main = ss)
    mtext(side = 3, adj = 1, line = -1, paste("N =",length(data$Length[find])))
  }
  dev.off()
  
    
  ############################################################################################
  # What do the ages by data source look like?
  ############################################################################################
  
  data$state_source = paste0(data$Source, "_", data$State)
  pngfun(wd = dir, file = "Age_Dists_by_Source.png", w = 7, h = 7, pt = 12)
  #Need to use print here since ggplot doesn't plot within a function call
  print(ggplot(data, aes(Age, fill = state_source, color = state_source)) +
    #facet_wrap(facets = c("State")) +
    geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
  dev.off()
  
  
  #######################################
  #Examined the retained vs. released samples by state
  #######################################  
  table(data$Source,data$Data_Type)
  #             RELEASED RETAINED
  #NWFSC_WCGBTS        0      219
  #PacFIN              0     5697
  #RecFIN            143    28922
  #RecFIN_MRFSS        0        0
  #RecFIN_ORage        0        0
  #Triennial           0       48
  
  table(data[data$Data_Type == "RELEASED", "State_Areas"])
  #north_pt_concep              OR 
  #             22             121 
  
  pngfun(wd = dir, file = "Retain_vs_Released_Prop.png", w = 7, h = 7, pt = 12)
  print(ggplot(data[which(!is.na(data$Data_Type)), ], aes(Length, fill = Data_Type, color = Data_Type)) +
    facet_grid(facets = c("State")) +
    geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5))
  dev.off()
  
  #Compare released fish
  pngfun(wd = dir, file = "Retained_vs_Released_Lengths.png", w = 7, h = 7, pt = 12)
  par(mfrow = c(2,2))
  hist(data[data$Data_Type == "RELEASED" & data$State_Areas == "north_pt_concep", "Length"], xlim = c(0, 70), 
       xlab = "Length (cm)", main = "north_pt_concep: Released")
  abline(v = mean(data[data$Data_Type == "RELEASED" & data$State_Areas == "north_pt_concep", "Length"], na.rm = TRUE), lty = 2, lwd = 2)
  
  hist(data[data$Data_Type == "RELEASED" & data$State_Areas == "OR", "Length"], xlim = c(0, 70), 
       xlab = "Length (cm)", main = "OR: Released")
  abline(v = mean(data[data$Data_Type == "RELEASED" & data$State_Areas == "OR", "Length"], na.rm = TRUE), lty = 2, lwd = 2)
  
  hist(data[data$Data_Type == "RETAINED" & data$State_Areas == "north_pt_concep" & data$Source == "RecFIN", "Length"], 
       xlim = c(0, 70), xlab = "Length (cm)", main = "north_pt_concep: Retained")
  abline(v = mean(data[data$Data_Type == "RETAINED" & data$State_Areas == "north_pt_concep" & data$Source == "RecFIN", "Length"], na.rm = TRUE), lty = 2, lwd = 2)
  
  hist(data[data$Data_Type == "RETAINED" & data$State == "OR" & data$Source == "RecFIN", "Length"], 
       xlim = c(0, 70), xlab = "Length (cm)", main = "OR: Retained")
  abline(v = mean(data[data$Data_Type == "RETAINED" & data$State == "OR" & data$Source == "RecFIN", "Length"], na.rm = TRUE), lty = 2, lwd = 2)
  dev.off()
  
  # Remove the released for the rest of the summaries for now:
  print(paste("Removed",length(which(data$Data_Type=="RELEASED")), "records that were released"))
  data = data[data$Data_Type %in% c("RETAINED", NA), ]
  
  return(data)
}
    
    