# setwd("~/Documents/Masters documents/Semester 4/Internship + thesis/4. Thesis/Simulation/Kuramoto")
# results <- read.csv('Simulated data/z1. results_data_effect.csv')
# time_taken <- read.csv('Simulated data/z1. time_data_effect.csv')

# # Get the respective datasets
# datasets <- list()
# for (dataset in 1:n_datasets) {
#  datasets[[dataset]] <- read.csv(paste0('Simulated data/',list.files('Simulated data')[dataset]))
#  if (dataset %% 100 == 0) cat('Getting dataset',dataset,'\n')
# }
# rm(dataset)

# ----------------------------------PLOTTING THE EXAMPLE DATA----------------------------------
# Plot different values of K for omega = 1, noise = 0.1

par(mfrow=c(3,1))
# For K = 0.3
plot(datasets[[1]][1:100,1],type='l',col=1,main='K = 0.3',xlab = 'Time',ylab='')
lines(datasets[[1]][1:100,2],type='l',col='red')

# For K = 0.6
plot(datasets[[271]][1:100,1],type='l',col=1,main='K = 0.6',xlab = 'Time',ylab='')
lines(datasets[[271]][1:100,2],type='l',col='red')

# For K = 0.9
plot(datasets[[541]][1:100,1],type='l',col=1,main='K = 0.9',xlab = 'Time',ylab='')
lines(datasets[[541]][1:100,2],type='l',col='red')

# ----------------------------------OMEGA----------------------------------

par(mfrow=c(3,1))
# For K = 0.3
plot(datasets[[1]][1:100,1],type='l',col=1,main='Omega = 1, 1',xlab = 'Time',ylab='')
lines(datasets[[1]][1:100,2],type='l',col='red')

# For K = 0.6
plot(datasets[[91]][1:100,1],type='l',col=1,main='Omega = 1.2, 0.8',xlab = 'Time',ylab='')
lines(datasets[[91]][1:100,2],type='l',col='red')

# For K = 0.9
plot(datasets[[181]][1:100,1],type='l',col=1,main='Omega = 1.4, 0.6',xlab = 'Time',ylab='')
lines(datasets[[181]][1:100,2],type='l',col='red')

# ----------------------------------Noise level----------------------------------

par(mfrow=c(3,1))
# For K = 0.3
plot(datasets[[1]][1:100,1],type='l',col=1,main='Noise = 0.1',xlab = 'Time',ylab='')
lines(datasets[[1]][1:100,2],type='l',col='red')

# For K = 0.6
plot(datasets[[11]][1:100,1],type='l',col=1,main='Noise = 0.2',xlab = 'Time',ylab='')
lines(datasets[[11]][1:100,2],type='l',col='red')

# For K = 0.9
plot(datasets[[21]][1:100,1],type='l',col=1,main='Noise = 0.3',xlab = 'Time',ylab='')
lines(datasets[[21]][1:100,2],type='l',col='red')

# ----------------------------------PLOTTING THE RESULTS----------------------------------

# par(mfrow=c(1,1))

plot(results[,1],type='l',col='black',main='WCLC_S',xlab='Datasets',ylab='Synchrony',ylim=c(0,1))
abline(v=c(270,540), col="red",lty=2)
plot(results[,2],type='l',col='black',main='WCLC_F',xlab='Datasets',ylab='Synchrony',ylim=c(0,1))
abline(v=c(270,540), col="red",lty=2)
plot(results[,3],type='l',col='black',main='WCLR',xlab='Datasets',ylab='Synchrony',ylim=c(0,1))
abline(v=c(270,540), col="red",lty=2)
plot(results[,4],type='l',col='black',main='AMI',xlab='Datasets',ylab='Synchrony',ylim=c(0,1))
abline(v=c(270,540), col="red",lty=2)
plot(results[,5],type='l',col='black',main='CSE',xlab='Datasets',ylab='Asynchrony',ylim=c(0,3))
abline(v=c(270,540), col="red",lty=2)
plot(results[,6],type='l',col='black',main='CRQA',xlab='Datasets',ylab='Synchrony',ylim=c(0,20))
abline(v=c(270,540), col="red",lty=2)

# Plot the time taken for each method

mean(time_taken[w1,5])
time_eff <- matrix(nrow = 6,ncol = 3)
row.names(time_eff) <- colnames(results)[1:6]
colnames(time_eff) <- c('10^3','10^4','10^5')

w <- seq(0,80,9)*10
w3 <- NULL
for (i in 1:length(w)) {
  w3 <- c(w3,seq(w[i]+1,w[i]+30))
}
time_eff[1,3] <- round(mean(time_taken[w1,1]),2)
time_eff[2,3] <- round(mean(time_taken[w1,2]),2)
time_eff[3,3] <- round(mean(time_taken[w1,3]),2)
time_eff[4,3] <- round(mean(time_taken[w1,4]),2)
time_eff[5,3] <- round(mean(time_taken[w1,5]),2)
time_eff[6,3] <- 0

time_eff[1,2] <- round(mean(time_taken[w2,1]),4)
time_eff[2,2] <- round(mean(time_taken[w2,2]),4)
time_eff[3,2] <- round(mean(time_taken[w2,3]),4)
time_eff[4,2] <- round(mean(time_taken[w2,4]),4)
time_eff[5,2] <- round(mean(time_taken[w2,5]),4)
time_eff[6,2] <- round(mean(time_taken[w2,6]),4)

time_eff[1,1] <- round(mean(time_taken[w3,1]),4)
time_eff[2,1] <- round(mean(time_taken[w3,2]),4)
time_eff[3,1] <- round(mean(time_taken[w3,3]),4)
time_eff[4,1] <- round(mean(time_taken[w3,4]),4)
time_eff[5,1] <- round(mean(time_taken[w3,5]),4)
time_eff[6,1] <- round(mean(time_taken[w3,6]),4)

# Get mean value for each synchrony level
mean_k <- mean_omega <- mean_t <- mean_noise <- matrix(nrow = 3,ncol = 6)
colnames(mean_k) <- colnames(results)[1:6]
row.names(mean_k) <- c('0.3','0.6','0.9')

colnames(mean_omega) <- colnames(results)[1:6]
row.names(mean_omega) <- c('0','0.4','0.6')

colnames(mean_t) <- colnames(results)[1:6]
row.names(mean_t) <- c('10^3','10^4','10^5')

colnames(mean_noise) <- colnames(results)[1:6]
row.names(mean_noise) <- c('0.1','0.2','0.3')

# FOR K 
k_vals <- list(1:270,271:540,541:810)

for (r in 1:3) {
  for (t in 1:6) {
    mean_k[r,t] <- round(mean(results[k_vals[[r]],t]),4)
  }
}

# FOR OMEGA 

omega_vals <- list()
# REPEAT THE FOLLOWING TO GET OMEGA VALUES
w <- seq(18,80,27)*10
w3 <- NULL
for (i in 1:length(w)) {
  w3 <- c(w3,seq(w[i]+1,w[i]+90))
}
omega_vals[[3]] <- w3


for (r in 1:3) {
  for (t in 1:6) {
    mean_omega[r,t] <- round(mean(results[omega_vals[[r]],t]),4)
  }
}

# FOR LENGTH, t
t_vals <- list()
w <- seq(6,80,9)*10
w3 <- NULL
for (i in 1:length(w)) {
  w3 <- c(w3,seq(w[i]+1,w[i]+30))
}
t_vals[[3]] <- w3

for (r in 1:3) {
  for (t in 1:6) {
    mean_t[r,t] <- round(mean(results[t_vals[[r]],t]),4)
  }
}

# FOR NOISE
noise_vals <- list()
w <- seq(2,80,3)*10
w3 <- NULL
for (i in 1:length(w)) {
  w3 <- c(w3,seq(w[i]+1,w[i]+10))
}
noise_vals[[3]] <- w3

for (r in 1:3) {
  for (t in 1:6) {
    mean_noise[r,t] <- round(mean(results[noise_vals[[r]],t]),4)
  }
}

# PLOTTING MEAN VALUES
# For K
par(mfrow=c(1,1))
matplot(mean_k[,1:4], type = "l",col = 1:6,lty=1,main='Mean synchrony comparison for K',xaxt='n',ylab='Mean synchrony',
        ylim=c(0,0.7),xlab='K',cex=0.75)
axis(1,at=c(1,2,3),row.names(mean_k))
legend('topleft', legend=c("WCLC_S", "WCLC_F", 'WCLR','AMI'),col=1:4, lty=1, cex=0.6,box.lty=0)

# For omega
matplot(mean_omega[,1:4], type = "l",col = 1:6,lty=1,main='Mean synchrony comparison for Omega',xaxt='n',ylab='Mean synchrony',
        ylim=c(0,0.7),xlab='Omega',cex=0.75)
axis(1,at=c(1,2,3),row.names(mean_omega))
legend('topright', legend=c("WCLC_S", "WCLC_F", 'WCLR','AMI'),col=1:4, lty=1, cex=0.6,box.lty=0)

# For t
matplot(mean_t[,1:4], type = "l",col = 1:6,lty=1,main='Mean synchrony comparison for length',xaxt='n',ylab='Mean synchrony',
        ylim=c(0,0.7),xlab='Length of data',cex=0.75)
axis(1,at=c(1,2,3),row.names(mean_t))
legend('topleft', legend=c("WCLC_S", "WCLC_F", 'WCLR','AMI'),col=1:4, lty=1, cex=0.6,box.lty=0)

# For noise
matplot(mean_noise[,1:4], type = "l",col = 1:6,lty=1,main='Mean synchrony comparison for noise',xaxt='n',ylab='Mean synchrony',
        ylim=c(0,0.7),xlab='Noise level',cex=0.75)
axis(1,at=c(1,2,3),row.names(mean_noise))
legend('topright', legend=c("WCLC_S", "WCLC_F", 'WCLR','AMI'),col=1:4, lty=1, cex=0.6,box.lty=0)
