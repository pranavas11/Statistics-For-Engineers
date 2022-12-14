##### Part 1 Start ##################################################################################
# Download the data set EpaFE2019data.csv from Canvas to your computer.
# Don't change anything about the dataset. 
# Simply download and save to familiar location.

# Upload Dataset using the read.csv() command below. 
# file.choose() will open a search window for you to select the file.
# Note your data is called CarData.Population

CarData.Population <- read.csv(file.choose(), header = TRUE)

# Part 1a
# Create a histogram of the variable CombCO2. Consider this the population. 
hist(CarData.Population$CombCO2, main = "Population Vehicles Sold in US", 
     xlab = "Combined Carbon Dioxide Emissions", col = "lightgreen")

# What is the size of the population. In other words, how many vehicles are represented in the dataset? 
# USe the command length() to find, N = ? 
N <- length(CarData.Population$CombCO2)
N

# Calculate the population mean mu
mu <- mean(CarData.Population$CombCO2)
mu

# Calculate the population standard deviation sigma. 
# Note sd() gives sample standard deviation. To remedy this we need to multply by sqrt((N-1)/N).
# Makes nearly no difference. 
sigma <- sd(CarData.Population$CombCO2)*sqrt((N-1)/N)
sigma

# Part 1b
# Take a sample of size 45 from the dataset. 
n <- 45
CarData.Sample <- CarData.Population[sample(1:N,n),]
CarData.Sample

#Create a histogram of the variable CombCO2 for your sampled data.
hist(CarData.Sample$CombCO2, main = "Random Sample of 45 Vehicles Sold in US", 
     xlab = "Combined Carbon Dioxide Emissions", col = "lightblue")
# Calculate the sample mean for CombCO2.
x.bar <- mean(CarData.Sample$CombCO2)
x.bar

# Calculate the sample standard deviation for CombCO2.
s <- sd(CarData.Sample$CombCO2)
s

##### Part 1 End ##################################################################################


##### Part 2 Start ##################################################################

# Define the population parameter
p <- 0.101

# Define the sample size 
n <- 40

# Simulate a single random sample of size n=40 when the population 
# proportion is p=0.101
# The rbinom() function generates a value from the Binomial distribution
# with given sample size (n) and proportion (p).
# The following code will randomly generate 1 (first argument) value for
# the number of "successes" from the defined binomial.
# In the following code, we divide the randomly generate binomial value 
# by n to get the value as a proportion. Use the following value as p-hat in part 2a. 
rbinom(1, n, p)/n

# Question e
# The code below again uses the rbinom function, but now we are generating
# 10,000 values from the binomial distribution. Again, to report these 
# values as proportions instead of counts, each value is divided by n. 
# The 10,000 sample proportions are stored in a vector called p_hats.
p_hats <- rbinom(10000, n, p)/n

# The lines below create two additional vectors: the lower bound and 
# upper bound for each of the 10,000 confidence intervals.
CI_lower_bound <- p_hats - 2.576*sqrt((p_hats*(1-p_hats))/n)
CI_upper_bound <- p_hats + 2.576*sqrt((p_hats*(1-p_hats))/n)

# In order to determine how many of the intervals capture the true 
# population proportion p=0.101, we'll use a logical argument in combination with the mean function. 
# Inside the parentheses below, R is assigning 1 (true) or 0 (false) to
# each of the intervals. If p is between the lower and upper bounds, a
# 1 is recorded. If p is outside the lower or upper bound, a 0 is recorded. 
# By wrapping the mean function around this vector of 1's and 0's, R
# calculates the proportion of intervals that successfully captured the 
# population proportion p=0.101. That value is then multiplied by 100
# so that the final answer is represented as a percentage.
mean(CI_lower_bound <= p & CI_upper_bound >= p)*100