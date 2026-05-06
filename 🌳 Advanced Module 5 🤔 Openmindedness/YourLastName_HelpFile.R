# === Data Storage === #####
## 1. Working Directory
### Template Example
getwd()   # shows your current working directory

# Possible TODO: Fill out other examples about working directory



## 2. File Types
# Possible TODO: What are the different types of files you can save/load in R?



## 3. Save Data
### Template Example
### RData File
save.image("Intro_to_R_Workspace.RData") # saves all objects in the Environment


# Possible TODO: What are other examples about saving different types of data?



## 4. Import Data
### Template Examples
### RData File
load("Intro_to_R_Workspace.RData") # loads saved objects to the Environment

# R has built-in datasets that you can use to practice
data(mtcars)  # loads the mtcars dataset

# Possible TODO: What are other examples/methods on importing different types of data?



# === Exploring Data === #####
### Examples: View, Summary, Head, Print
### Template Example
# View the first 6 rows of a data frame
head(mtcars)


# Possible TODO: Fill out examples of how to explore data and their usefulness



# === Data Wrangling === #####
### 1. Base R Functions
### Template Example
# Changing names of objects or columns, Replacing NAs or character values 
example_data[is.na(example_data)] <- 0

# Example reflection: Useful tip: na.omit() removes rows with any NA values

# Possible TODO: What are other examples/methods on data wrangling in base R?



### 2. dplyr Functions

# Possible TODO: What are examples/methods on data wrangling in dplyr?



# === Data Visualization === #####
### 1. Base R Plotting


# Possible TODO: What are examples/methods for data visualization in base R?


### 2. ggplot2
### Template Example
# Scatterplots: geom_point() draws  -> for continuous variables
# Map aesthetics with aes()
# Control colors in aes() 
# geom_smooth() adds a regression line
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm", fill = NA)  # fill = NA removes shading
# Example reflection: Mistake I made: Forgot to wrap 'cyl' with factor()—coloring didn’t work!


# Possible TODO: What are other plot examples/methods for data visualization in ggplot2?



# === Loops and Functions === #####
# Example reflection: Reminder: Always use print() inside a loop if you want output!


# Possible TODO: What are examples/methods on loops and functions?



# === Common Errors === #####
# Example reflection: Error: object not found –> I forgot to run the line that creates the object
# Example reflection: Error: unexpected symbol –> I left out a comma or parentheses
