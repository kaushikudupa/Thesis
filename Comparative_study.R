# setwd("~/Documents/Masters documents/Semester 4/Internship + thesis/4. Thesis/Simulation/Kuramoto")
dest <- '/Users/kaushikudupa/Documents/Masters documents/Semester 4/Internship + thesis/3. Internship/R implementations/'
techniques <- c('WCLC_S.R','WCLC_F.R','WCLR.R','AMI.R','cross_sampen.R','CRQA_R.R')
n_datasets <- 810

# To store the datasets and the respective results
datasets <- list()
results <- data.frame(matrix(nrow=n_datasets,ncol=length(techniques)))
names(results) <- techniques

time_taken <- data.frame(matrix(nrow=n_datasets,ncol=length(techniques)))
names(time_taken) <- techniques

# Importing the techniques
for (technique in 1:length(techniques)) {
  
  source(paste0(dest,techniques[technique]))
}
rm(technique,dest)

# Get the respective datasets
for (dataset in 1:n_datasets) {
  datasets[[dataset]] <- read.csv(paste0('Simulated data/',list.files('Simulated data')[dataset]))
  if (dataset %% 100 == 0) cat('Getting dataset',dataset,'\n')
}
rm(dataset)

# Start the comparative study
for (j in 1:6) { # Changing from length(techniques) to 3 1:length(techniques)
  for (i in 1:810) {
    
    # If WCLC_S
    if (j == 1) {
      if (i %% 100 == 0) cat('Checking WCLC_S for dataset',i,'\n')
      t <- proc.time()
      results[i,j] <- mean(WCLC_S(data=datasets[[i]]),na.rm=TRUE)
      time_taken[i,j] <- (proc.time() - t)[3]
    }
    
    # If WCLC_F
    else if (j == 2) {
      if (i %% 100 == 0) cat('Checking WCLC_F for dataset',i,'\n')
      t <- proc.time()
      results[i,j] <- mean(WCLC_F(data=datasets[[i]]),na.rm=TRUE)
      time_taken[i,j] <- (proc.time() - t)[3]
    }
    
    # If WCLR
    else if (j == 3) {
      if (i %% 100 == 0) cat('Checking WCLR for dataset',i,'\n')
      t <- proc.time()
      results[i,j] <- mean(WCLR(data=datasets[[i]]),na.rm=TRUE)
      time_taken[i,j] <- (proc.time() - t)[3]
    }
    
    # If AMI
    else if (j == 4) {
      if (i %% 100 == 0) cat('Checking AMI for dataset',i,'\n')
      t <- proc.time()
      results[i,j] <- AMI(x=datasets[[i]][,1],y=datasets[[i]][,2],lag=10)
      time_taken[i,j] <- (proc.time() - t)[3]
    }
    
    # If cross_sampen
    else if (j == 5) {
      if (i %% 100 == 0) cat('Checking Cross_sampen for dataset',i,'\n')
      t <- proc.time()
      cse <- cross_sampen(x=datasets[[i]][,1],y=datasets[[i]][,2],M=1)
      results[i,j] <- mean(cse[!is.na(cse) & !is.infinite(cse)])
      print(cse)
      time_taken[i,j] <- (proc.time() - t)[3]
    }
    
    # If CRQA
    else if (j == 6) {
      if (i %% 100 == 0) cat('Checking CRQA for dataset',i,'\n')
      t <- proc.time()
      results[i,j] <- CRQA_R(datasubj1=datasets[[i]][,1],datasubj2=datasets[[i]][,2])[['RR']]
      time_taken[i,j] <- (proc.time() - t)[3]
    }
  }
}

# Write the results to a csv
# We call it results_data because this compares the effects of data properties
# Separately we will also look at the effect of variable in the technique (eg. bandwidth, step, lag, etc)
write.csv(results,'Simulated data/z1. results_data_effect.csv',row.names=FALSE)
write.csv(time_taken,'Simulated data/z1. time_data_effect.csv',row.names=FALSE)


