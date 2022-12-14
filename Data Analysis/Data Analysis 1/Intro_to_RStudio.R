##### Data Analysis 1 ####

#### Reading in data ####

# For this assignment, you will need the loan50.csv file (see DA 1 on canvas)
# Save this file somewhere you can easily locate it on your computer.
# We need to open the data set up in RStudio. You can do this in a couple
# of different ways. 

# Option 1: In the Files pane of RStudio, navigate to the file and click on it. 
# You should see an option to Import Data set. Select this option, then Import. 

# Option 2: Run the line of code below. A window will pop up. From here
# navigate to the file and open it. 

loan50 <- read.csv(file.choose(), header = TRUE)

# Your dataset should now be available in R. Check by looking in the Global Environment pane. 
# Click on loan50 to preview the data set. 

#### Exploring the Data ####

# The following lines of code make use of some built-in R functions that will 
# help us get familiar with the data set. Take some time to read the 
# descriptions and run the lines of code.

# List the names of the variables 
names(loan50)

# See a preview of the first 6 rows of the data set
head(loan50)

# Determine the number of observations in the data set
nrow(loan50)

#### Summarizing a Single Quantitative Variable ####

# Let's focus on the loan amount variable available in this data set.
# To reference a variable stored in a data set, we first need to list
# the data set name, followed by $ and the variable name. For example, 
# if we want to look at the first 6 values of loan_amount in the 
# loan50 data set, we can run the following line. 

head(loan50$loan_amount)

# Construct a histogram of the loan_amount data
hist(loan50$loan_amount)

# Construct the same histogram, but add some nicer labels and a title
hist(loan50$loan_amount, 
     main = "Distribution of Loan Amounts for \n50 Lending Club Loans", 
     xlab = "Loan Amount in Dollars")

# Construct a boxplot of the loan amount data
boxplot(loan50$loan_amount, 
        horizontal = TRUE, 
        main = "Distribution of Loan Amounts for \n50 Lending Club Loans", 
        xlab = "Loan Amount in Dollars")

# Calculate measures of center (mean and median) for the loan amount variable
mean(loan50$loan_amount)

median(loan50$loan_amount)

# Calculate measures of spread (standard deviation and IQR) for the 
# loan amount variable
sd(loan50$loan_amount)
IQR(loan50$loan_amount)

# Calculate the 5 number summary (and mean) for loan amount variable
summary(loan50$loan_amount)

#### Visualizing two variables ####

# We may be interested in looking at the loan amount data, but distinguishing 
# home ownership status of loan applicant (variable home ownership). To do this, we will construct 
# a side-by-side box plot. Using the boxplot function, we need to specify both
# variables in the function. First list the quantitative variable
# then categorical variable, separated by a ~
boxplot(loan50$loan_amount ~ loan50$homeownership, 
        horizontal = TRUE, 
        main = "Distribution of Loan Amounts for \n50 Lending Club Loans", 
        xlab = "Loan Amount in Dollars", 
        ylab = "Homeownership Type")

#### Summarizing a Single Categorical Variable ####

# Let's focus now only on the home ownership data. This is a 
# categorical variable containing three categories: mortgage, 
# own, and rent. 

# The following line of code will calculate the number of 
# observations in the data set that fall in the rent category. 
sum(loan50$homeownership == "rent")

# If we were to only run the code inside the parentheses, we  
# would see a list of 0's and 1's (try it!)
# A 0 represents an observation that is not a renter. A 1 represents 
# an observation that is. By wrapping the sum function around this 
# list of 0's and 1's, we are adding up the number of observations that 
# meet the criteria loan50$homeownership == "rent". 

# To calculate the proportion of renters, instead of the total 
# number, replace the sum function in the code above with the mean function.
mean(loan50$homeownership == "rent")     # 21 / 50 = 0.42

# Create a table of counts for each of the three categories
counts <- table(loan50$homeownership)

# When you run the above line of code, you won't see anything appear
# in the console. This is because you stored the table in an object 
# called counts. To see what is actually stored in the object counts,
# simply run the code counts below. 
counts

# Use the table of counts to create a table of proportions. 
prop.table <- prop.table(counts)
prop.table

# Create a barplot of the homeownership data using the prop.table object
barplot(prop.table,
        ylim = c(0,1),
        main = "Distribution of Homeownership Types for \n50 Lending Club Loans", 
        ylab = "Proportion")

hist(loan50$annual_income, 
     main = "Distribution of Annual Income Amounts for \n50 Lending Club Loans", 
     xlab = "Loan Amount in Dollars")

boxplot(loan50$annual_income, 
        horizontal = TRUE, 
        main = "Distribution of Annual Income Amounts for \n50 Lending Club Loans", 
        xlab = "Annual Income in Dollars")

mean(loan50$annual_income)
median(loan50$annual_income)

sd(loan50$annual_income)               # standard deviation

IQR(loan50$annual_income)              # interquartile range

boxplot(loan50$annual_income ~ loan50$loan_status, 
        horizontal = TRUE, 
        main = "Distribution of Annual Income Amounts based on the \n loan status for 50 Lending Club Loans", 
        xlab = "Annual Income Amount in Dollars", 
        ylab = "Loan Status")

loan_status_count <- table(loan50$loan_status)
loan_status_count

prop.table <- prop.table(loan_status_count)
prop.table

barplot(prop.table,
        ylim = c(0,1),
        main = "Distribution of Loan Status for \n50 Lending Club Loans", 
        ylab = "Proportion")