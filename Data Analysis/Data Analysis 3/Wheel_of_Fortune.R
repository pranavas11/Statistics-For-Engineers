# Run commands by highlighting a section and clicking
# "Run" in the top right corner of the "script" window. Run commands in ORDER. 

# Create a vector of wheel outcomes and their frequency on the wheel.
# The command c() combines values into a vector. Each value must be separated by a comma. 
# The rep(x,times) repeats whatever x is however many times you want it to.

Wheel.Outcomes = c(rep(0,2),  rep(300,5),
                   rep(350,1),rep(400,2), 
                   rep(450,1),rep(500,3), 
                   rep(550,1),rep(600,3), 
                   rep(700,1),rep(800,2), 
                   rep(900,2),rep(5000,1))

barplot(table(Wheel.Outcomes)/24, main = "PMF for Spin Outcome", col = rainbow(12))

# Start simulation. 
# Part 3a. ######################################################## 
# Spin the wheel 1 time. Samples the vector 1 time.

sample(Wheel.Outcomes, 50, replace = TRUE)

# This code "Spins the wheel" 1000 times. 
# Actually, samples the Wheel.Outcomes vector 1000 times with replacement. 
# Makes a new vector of 1000 spin outcomes. 

spins.thousand = sample(Wheel.Outcomes, 1000, replace = TRUE)

# Part 3b. ########################################################
# Expected Dollar Amount.
# How does this compares to part 2d?  

mean(spins.thousand)

# The table command counts the number of spins from each amount.

table(as.factor(spins.thousand))

# Part 3c. #######################################################
# Divide the counts by 1000. 
# This is the Simulated Probability Mass Function. 
# How does it compare to the one you created in part 2a? 

table(as.factor(spins.thousand))/1000

# Check out the probability mass function in a plot. Copy and paste this plot to DA. 
# Do the simulated values see to match the theoretical ones? 

barplot(table(as.factor(spins.thousand))/1000, col = rainbow(12), main = "Simulated PMF of Wheel Spin Outcomes")

# Optional: You can run the simulation as many times as you want. # You can also increase or decrease the number of spins. 