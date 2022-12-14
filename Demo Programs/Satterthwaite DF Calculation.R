## Calculate the Satterthwaite degrees of freedom for two independent populations

## Enter the sample standard deviation for each sample
s1 = 36.5
s2 = 44.3

## Enter the sample sizes for each sample
n1 = 16
n2 = 26

## Once you've defined the above values, you can simply run the 
## following lines to determine the Satterthwaite degrees of freedom  
v = (((s1^2/n1)+(s2^2/n2))^2)/((((s1^2/n1)^2)/(n1-1))+(((s2^2/n2)^2)/(n2-1)))
v