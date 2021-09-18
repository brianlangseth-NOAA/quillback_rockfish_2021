
#' Simulation to draw lengths from a larger dataset for ages from a smaller dataset
#' to compare whether a substantial differences exists between the data
#' Output: a list of three elements, 
#' 1) vector of ages from smaller dataset, 
#' 2) matrix with columns equal each age and rows equal to each length draw for that age
#' 3) dataframe of estimated vonB parameters (1: Linf, 2: K, 3: L0)
#' Right now isn't separated by sex
#' @param many_data dataframe for the larger dataset with fields, Age, Length. Length must be in cm
#' @param few_data dataframe for the smaller dataset with fields, Age, Length. Length must be in cm
#' @param nsim number of times to sample with replacement
#' @param linf starting value for estimation 
#' @param l0 starting value for estimation
#' @param k starting value for estimation
#' @examples
#' growth_sim(many_data = current_data, few_data = new_data, nsim = 1000)
#' @author written by Brian Langseth
#' @export
#'

col_names <- c("Sex","Length","Age")
many_data <- out_age[out_age$State != "CA" & !is.na(out_age$Age),col_names]
many_data <- many_data[-c(142,143),]
few_data <- rbind(out_ca[,col_names],postssc[,col_names],mopup[,col_names])
nsim = 10
linf = 40
l0 = 10
k = 0.1

sim <- growth_sim(many_data,few_data,nsim = 10, linf = 40, l0 = 10, k = 0.1)


agemat = matrix(rep(sim$Ages,10),nrow = length(sim$Ages),ncol=10)
matplot(agemat,t(sim$Lengths))
plot(agemat,t(sim$Lengths),xlim=c(0,90),ylim=c(0,50))
points(few_data$Age,few_data$Length,col=2,pch=19)



growth_sim <- function(many_data, few_data, nsim, linf, l0, k){
  
  #GENERATE DATA
  sim_results <- list("Ages" = few_data$Age, 
                      "Lengths" = matrix(NA, nrow = nsim, ncol = nrow(few_data),
                                         dimnames=list(paste0("sim",1:nsim),1:nrow(few_data))),
                      "Ests" = data.frame("linf"=NA, "l0" = NA, "k" = NA))
  
  for(i in 1:nrow(few_data)){
    
    #Only if the age in few_data is among the ages in many_data
    if(few_data[i,"Age"] %in% many_data$Age){
      sim_results$Lengths[,i] <- sample(x = many_data[which(many_data$Age == few_data[i,"Age"]),"Length"], 
                                        nsim, replace = TRUE)
    }else{
      
      #If no age in manay data, and age is small (less than 10), sample lengths from ages one-year to the left and right
      if(few_data[i,"Age"] < 10){
        sim_results$Lengths[,i] <- sample(x = many_data[which(many_data$Age %in% c(few_data[i,"Age"]-1, few_data[i,"Age"], few_data[i,"Age"]+1)),"Length"], 
                                          nsim, replace = TRUE)
      }
      #If no age in manay data, and age is large (greater than 40), sample lengths from ages five-years to the left and right
      if(few_data[i,"Age"] > 40){
        sim_results$Lengths[,i] <- sample(x = many_data[which(many_data$Age %in% c((few_data[i,"Age"]-5):(few_data[i,"Age"]+5))),"Length"], 
                                          nsim, replace = TRUE)
      }
    }
  }
  
  #ESTIMATE PARAMETERS
  for(i in 1:nsim){    
    sim_results$Ests[i,] <- optim(c(linf, l0, k), vb_opt_fn, age = sim_results$Age, lengths = sim_results$Lengths[i,])$par	
  }
  
  return(sim_results)
}
  

 







