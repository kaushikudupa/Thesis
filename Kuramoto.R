Kuramoto <- function(n = 2, kappa, omega, max_length, phase_diff,noise) {
  
  # Initialise the data frame to store the output
  output <- data.frame(matrix(nrow = max_length,ncol = 2))
  output[1,1] <- sample(seq(0,2*pi,0.0001),1)
  output[1,2] <- output[1,1] + phase_diff
  print(output[1,])
  
  t <- 2
  while (t <= max_length) {
    
    if (t %% 500 == 0) cat('Getting theta for t = ',t,'\n')
    
    # Calculate the rate of change for both theta values and add it to the current theta value
    for (i in 1:n) {
      
      # Since we have n = 2, we do not need to initialise j separately
      # Calculate the rate of change
      theta_hat <- omega[i] + kappa/n * (sin (output[t-1,-i] - output[t-1,i]))
      
      # Update theta at t
      output[t,i] <- output[t-1,i] + theta_hat
      
      # Mainitaining the value between 0 and 2*pi
      if (output[t,i] > 2*pi) output[t,i] <- output[t,i] - 2*pi
      if (output[t,i] < 0) output[t,i] <- 2*pi - output[t,i]
      
      # If we need to add noise
      output[t,i] <- output[t,i] + rnorm(1,0,noise)
    }
    t <- t + 1
  }
  return(output)
}

