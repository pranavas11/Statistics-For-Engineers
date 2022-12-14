# Find the probability that the random 
# variable takes on a value less than 40
# when it comes from a Normal distribution
# with mean 58 and standard deviation 10
pnorm(40, 58, 10)

# Find the probability that the random 
# variable takes on a value between 65 and
# 40 when it comes from a Normal distribution
# with mean 58 and standard deviation 10
pnorm(65, 58, 10) - pnorm(40, 58, 10)

# Find the 90th percentile value on a Normal
# distribution with a mean of 58 and standard
# deviation 10
qnorm(0.9, 58, 10)