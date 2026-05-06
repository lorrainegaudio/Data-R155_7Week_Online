#boxplot(x) automatically puts in outliers.  It looks like -2 and 2 are the limits for outliers

t() #Transpose.  Switch columns and Rows

options(scipen = n) #turns off scientific notation for anything less than n

#library(MASS)
#With stepAIC, the listed AIC's are what the final AIC would be if that variable was removed.

#mice does regression with missing data.

#Add regression line
abline(lm(y ~ x, data))

example3[is.na(example3)] <- 0 #Long form of replacing NA
#2 1 6 7 0 4 

#In dplyr, at least, n() is sample size.  Make sure it's blank.

#interaction.plot works for plotting 2-way ANOVA

#Re-ording factor variables; The months were out of order before doing this.
Safe2$Month <- factor(Safe2$Month, levels=c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))

#Using commas with filter seems to automatically assume "AND".
filter(cran, r_version <= "3.0.2", country == "IN")

#Single 'recode' or replacement
TanishaRecode2[38,29] = "Open"

#Mass Recode into same variable; replacing values
TanishaRecode2[which(str_detect(TanishaRecode2$What.is.your.racial.background, "Black")), 24] = "Black or African American"

sigma() ##Returns the standard error of the estimate for a regression equation

## Make sure to print at end of loop if needed
for(x in 1:25)
{
  y <- 1:x
  print(sum(y))
}

# Sampling within an ifelse statement to randomly generate a second match
# Need length() there at the end.
set.seed(8)
Column_1 <- sample(c(rep("Gross_Cereal", 50), rep("Marshmallow", 50)))
Column_2 <- ifelse(Column_1 == "Gross_Cereal", 
                   "Who_Cares?", sample(c("Heart", "Star", "Horseshoe", "Clover",
                                          "Blue_Moon", "Pot_of_Gold","Rainbow", 
                                          "Tasty_Red_Balloons"), 
                                           length(Column_1), T))