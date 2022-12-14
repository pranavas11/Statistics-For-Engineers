##########PART 1 START ############################################################################# # R code and explanation for data analysis 5 t procedures. 

# Read in the microbeersW19.csv dataset
microbeers = read.csv(file.choose(), header = TRUE)

# gives variable names.
names(microbeers) # gives variable names.

# Make an appropriate visual display for abv. 
# Recall hist() or boxplot()
# Add a title. Add color and other aesthetics if you like. 
# See week 3 lessons or the script from Data Analysis #3.
hist(microbeers$abv,
     main = "Average alcohol by volume",
     xlab = "Percent of alcohol by volume",
     ylab = "Frequency",
     col = "red")

boxplot(microbeers$abv,
        horizontal = TRUE,
        main = "Average alcohol by volume",
        xlab = "Percent of alcohol by volume for each craft beer",
        col = "red")

# Calculate the mean and standard deviation using mean() and sd()
# Again, refer to week 3 lessons or the script from Data Analysis #3. 
mean(microbeers$abv)
sd(microbeers$abv)

# Perform a t test using the t.test() command. 
# The format is t.test(data, mu = mu_0, alternative = "alt") 
# where data is a quantitative variable mu_0 is the hypothesized mean,
# and alt is either "less", "greater" or "two.sided" (default).
t.test(microbeers$abv, mu=5.0, alt="two.sided")

# After running the t.test() function, you'll be given a few lines of 
# output including: 
# the test statistic (look for t = )
# the degrees of freedom (look for df = )
# the p-value (look for p-value = or pvalue < )
# a statement describing the alternative hypothesis
# a confidence interval based on the value set in the conf.level = argument
# the point estimate for the population mean

t.test(microbeers$abv, alternative = "two.sided", mu = 5, conf.level = 0.95)