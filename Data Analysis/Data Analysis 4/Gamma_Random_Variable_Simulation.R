# PART 3 ############################################## 

###### Enter Gamma parameter values ###################
# Alpha and Beta may be any positive values. 
alpha <- 2
beta <- 7

# Define Number of Observations
observations <-  10000

####### Simulation ####################################

# Simulates Gamma Random Variable 
# The rgamma function below will randomly generate 
# values that come from a gamma distribution with the 
# specified parameter values.
RV <- rgamma(observations,
            shape = alpha,
            scale = beta)

# Plot a histogram of the simulated values. 
# There are quite a few arguments included in the 
# function used below. You do not need to change any 
# of the code. 
hist(RV, 
     freq = FALSE, 
     col = "dodgerblue", 
     breaks = 100, 
     main = "Gamma Random Variable Values with Density Curve", 
     xlim = c(0,max(RV)+sqrt(alpha*beta^2)))

# Plot the Probability Density Curve over the 
# simulated histogram.

# The following line defines the values that will
# be evaluated for the gamma PDF. 
x.range <- seq(0, max(RV)+2*sqrt(alpha*beta^2), 0.01)

# Evaluate the gamma PDF for the values defined in
# x.range. dgamma() is the function used to evaluate 
# the gamma PDF.
pdf <- dgamma(x.range, shape = alpha, scale = beta)

# overlay the theoretical PDF on the histogram
lines(x.range, pdf, lwd = 4)

# Find the proportion of simulated values below 4
Proportion <- sum(RV<4)/observations
Proportion

##### End of Simulation ################################