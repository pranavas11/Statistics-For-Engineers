################# DATA ANALYSIS 8 #################
######## ANOVA and SIMPLE LINEAR REGRESSION #######

######## PART 2 - SIMPLE LINEAR REGRESSION ########

## Import the mlb.csv data set
mlb <- read.csv(file.choose(), header = TRUE)

## Create a scatter plot of the bivariate data using the plot function
## The first argument (runs) defines the y-axis variable
## The second argumeNT (at_bats) defines the x-axis variable
plot(mlb$runs ~ mlb$at_bats, 
     xlab = "At-bats",
     ylab = "Runs")

## Calculate the correlation coefficient between the two variables
## using the corr() function
cor(mlb$at_bats, mlb$runs)

## Fit the simple linear regression model using the lm() function
## Store the model in the object mod
mod <- lm(mlb$runs ~ mlb$at_bats)

## To view the model output, wrap the summary function around the
## stored model object, mod
summary(mod)

## Overlay the least squares regression line on the scatterplot
## using the abline function. This function will plot the line 
## with the y-intercept and slope stored in the mod object.
abline(mod)

## Construct a residual plot. The residuals for the least squares
## regression model are stored in mod$residuals. Again, use the plot()
## function to construct a plot where at-bats is on the x-axis and 
## the corresponding residuals are plotted on the y-axis.
plot(mod$residuals ~ mlb$at_bats, 
     xlab = "At-bats", 
     ylab = "Residuals")