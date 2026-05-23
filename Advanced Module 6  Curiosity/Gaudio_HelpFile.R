# === Data Storage === #####
## 1. Working Directory
#  *Check* where R will save by default:
getwd()   # shows your current working directory
  #   *Change* it if needed—two simple options:
  #       a) CODE: setwd("C:/Users/YourName/Documents/R_Projects")   # edit path
  # Locate the folder in a file explorer and copy the path from the address bar.
  #C:\Users\Eva Lorraine Gaudio\OneDrive\Documents\BSU\Teaching\Data-R 155\Personal Help File
  # Then paste it in the parentheses, replacing the slashes with forward slashes. Use Quotes
setwd("C:/Users/Eva Lorraine Gaudio/OneDrive/Documents/BSU/Teaching/Data-R 155/Personal Help File")
  #       b) Graphical User Interface (GUI) refers to the visual, point-and-click 
  #         interface in RStudio (or other R environments) that allows users to 
  #         interact with the software using menus, buttons, and tabs, instead of 
  #         typing commands in the console.
  #       Find the Files/Plots/Packages/Help/Viewer pane (bottom-right):
  #       In the **Files** tab, navigate to your preferred folder,
  #          click  More ▸ Set As Working Directory.  R will run setwd() for you.
# Possible TODO: Fill out other examples about working directory



## 2. File Types
# Possible TODO: What are the different types of files you can save/load in R?



## 3. Save Data
data(mtcars)  # loads the mtcars dataset
### RData File
save.image("mtcars.RData") # saves all objects in the Environment
save(mtcars, file = "mtcars.RData")  # saves only the mtcars dataset to a file
rm(mtcars)  # removes only the mtcars dataset from the Environment
rm(list = ls())  # removes all objects from the Environment (or click the broom icon)

# Possible TODO: What are other examples about saving different types of data?



## 4. Import Data
### Template Examples
### RData File
load("mtcars.RData") # loads saved objects to the Environment

# R has built-in datasets that you can use to practice
data(mtcars)  # loads the mtcars dataset

# manually enter data
column_1 <- c(1, 2, 3)
column_2 <- c("A", "B", "C")
column_3 <- c(TRUE, FALSE, TRUE)
data_frame <- data.frame(column_1, column_2, column_3)

# Create a data frame and the columns at the same time
grocery_list <- data.frame(
  item = c("apple", "banana", "carrot", "date", "eggplant", "fig", "grape"),
  quantity = c(2, 3, 1, NA, 1, 2, 1),
  price = c(0.5, 0.3, 0.2, 0.4, 0.6, 0.7, 0.6)
)

# Possible TODO: What are other examples/methods on importing different types of data?



# === Exploring Data === #####
 ?mtcars  # shows the documentation for the mtcars dataset

# View the first 6 rows of a data frame
head(mtcars)

# dplyr::glimpse(mtcars)  # shows the structure of the data frame
library(dplyr)


glimpse(mtcars)  # shows the structure of the data frame
head(mtcars)  # shows the first 6 rows of the data frame
head(mtcars, n = 10)  # shows the first 10 rows of the data frame
head(mtcars[1:10, c("mpg", "cyl")]) # shows the first 10 rows of the mpg and cyl column 

# Print options
mtcars  # prints the entire data frame
print(mtcars)  # also prints the entire data frame
mtcars %>% select(c(mpg, cyl))  # dplyr select() function to select specific columns 
print(mtcars %>% select(c(mpg, cyl))) # nesting 
mtcars$mpg  # prints the column of the data frame as a vector

str(mtcars)  # shows the structure of the data frame
length(mtcars)  # shows the number of columns in the data frame
class(mtcars)  # shows the class of the data frame

summary(mtcars)  # shows summary statistics of the data frame
summmarize(mtcars)  # shows summary statistics of the data frame

names(mtcars)  # shows the names of the columns in the data frame
colnames(mtcars)  # shows the column names of the data frame

ncol(mtcars)  # shows the number of columns in the data frame

example_vector5 <- factor(c("A", "B", "C", "A"))
unique(example_vector5)  # shows the unique values in the factor variable

# Vectorised functions
mtcars_mpg <- mtcars %>% select(mpg)
mtcars_mpg 
sum(mtcars_mpg)  # shows summary statistics of mpg
mean(mtcars_mpg$mpg)  # shows the mean of mpg
mean(mtcars_mpg$mpg, na.rm = TRUE)  # shows the mean of mpg, removing NA values)
sd(mtcars_mpg)  # shows the standard deviation of mpg

# Which function: which() returns the index of the first TRUE value
trial_vec <- sample(x = c(1:3, NA, NA), size = 25, replace = TRUE)
which(is.na(trial_vec))  
which(!is.na(trial_vec))

# nrow() returns the number of rows in a data frame
nrow(mtcars)  # shows the number of rows in the mtcars data frame

# === Data Wrangling === #####
### 1. Base R Functions

# In R, *everything* is an object. Use  <-  to assign a value to a name.
result <- 3 + 4       # store the arithmetic output
number <- 42          # store a simple number
ratio  <- number / result   # reuse objects to calculate 
# Strings live inside quotation marks.  paste()  joins them with spaces by default.
greeting  <- "Welcome to R."
statement <- "Productive code is clear and reproducible."
message   <- paste(greeting, statement)  # combine the two sentences


# naming the object the either direction ->
Movie_Night <- movielens %>%
  filter(rating >= 4.5) %>%
  select(title) %>%
  unique()

movielens %>%
  filter(rating >= 4.5) %>%
  select(title) %>%
  unique() -> Movie_Night


# Creating vectors: c() creates a vector of values
# The different types of classes are numeric, integer, complex, character, logical, and factor
example_vector <- c(1, 2, 3, 4, 5, NA)  # numeric vector
example_vector1 <- c(1L, 2L, 3L)  # integer vector
example_vector2 <- c(1 + 2i, 3 + 4i)  # complex vector
example_vector3 <- c("a", "b", "c")  # character vector
example_vector4 <- c(TRUE, FALSE, TRUE)  # logical vector
example_vector5 <- factor(c("A", "B", "C", "A"))  # categorical (factor) variable
# Creating a series using :
example_vector6 <- 1:10  # creates a vector from 1 to 10
# Creating a step series using seq()
example_vector7 <- seq(from = 1, to = 10, by = 2)  # creates a vector from 1 to 10 with a step of 2
# Coercing: as.numeric(), as.character(), as.logical(), as.factor()
# character → numeric: text converts to NA
as.numeric(example_vector3)  # converts character vector to numeric
# numeric → character: numbers convert to text
as.character(example_vector)  # converts numeric vector to character
# integer → numeric: integers convert to numeric
as.numeric(example_vector1)  # converts integer vector to numeric
# numeric → integer: numbers convert to integers
as.integer(example_vector)  # converts numeric vector to integer
# logical → numeric: TRUE converts to 1, FALSE converts to 0
as.numeric(example_vector4)  # converts logical vector to numeric
# numeric → logical: 0 converts to FALSE, non-zero converts to TRUE
as.logical(example_vector)  # converts numeric vector to logical
# logical → character: TRUE converts to "TRUE", FALSE converts to "FALSE"
as.character(example_vector4)  # converts logical vector to character
# Reflection: To change the class of a vector, use  <-  to reassign a name.

# subsetting: [ ] selects elements from a vector
example_vector[1]  # selects the first element of the vector
example_vector[c(1, 3)]  # selects the first and third elements of the vector
example_vector[example_vector > 3]  # keeps only values > 3

# x[rows , cols] selects rows and columns from a data frame (x)
# Leave blank to mean ‘all’.  x[ , ] returns the whole object.
mtcars[1:5, ]  # selects the first 5 rows of the data frame
mtcars[, c("mpg", "cyl")]  # selects the mpg and cyl columns of the data frame
# x[ , -cols] removes columns you list after the minus sign.
mtcars[, -c(1, 3)]  # removes the first and third columns of the data frame
# WHAT  == asks “is exactly equal to?”   != asks “is NOT equal to?”.
# Both return a logical vector.
mtcars$cyl == 6        # ➡ TRUE where cylinders equal 6
mtcars$gear != 4       # ➡ TRUE where gears are NOT 4

# Using [ ] to subset a data frame
# logical subsetting: returns a logical vector
grocery_list$item == "banana" # returns a logical vector
# keeps only rows that satisfy the test.
grocery_list[grocery_list$item == "banana", ]  # selects rows where item is "banana"


# random sampling: sample() randomly selects elements from a vector
set.seed(42)  # sets the seed for reproducibility
sample(example_vector)  # randomly sorts the vector
# sample() is a base R function that randomly selects elements from a vector
# sample(x, size, replace = FALSE, prob = NULL)
example_vector8 <- sample(example_vector, 3)  # randomly selects 3 elements from the vector
# sample_n is a dplyr function that randomly selects rows from a data frame
sample_n(mtcars, 5)  # Sample 5 rows from mtcars data frame
mtcars %>% sample_n(10)  # Using with pipe


# Missing values: 
# NA represents missing values; is not equal to anything, including itself
# NaN represents undefined values (e.g., 0/0)
# NULL represents an empty object
# Detecting missing values: is.na() checks for NA values
is.na(example_vector)  # checks for NA values in the vector
# Replacing missing values: 
# !is.na() replaces NA values with a specified value
example_zero <- example_vector[is.na(example_vector)] <- 0  # replaces NA values with 0
# The <- operator is not just for assigning a value to a variable name.
example_mean <- example_vector[is.na(example_vector)] <- mean(example_vector, na.rm = TRUE)  # replaces NA values with the mean of the vector

# na.omit() removes NA values from a vector
example_vector9 <- na.omit(example_vector)  # removes NA values from the vector
#Using which() for extraction
rows_without_na <- which(grocery_list$quantity == 1:3)  
which_subset <- grocery_list[rows_without_na, ]  # selects rows without NA values
which_subset

# Extract specific columns values based on a filtering condition
quantity_1 <- grocery_list[grocery_list$quantity == 1, ]  # selects rows where quantity is 1
# Two conditions column subset 
grocery_rowindex_price <- which(grocery_list$price == 0.6)  # gets the row index of price 0.6
two_conditions <- quantity_1[grocery_rowindex_price, ]  # selects rows where quantity is 1 and price is 0.6
# Two conditions Using &
grocery_list[grocery_list$quantity == 1 & grocery_list$item == "banana", c("item", "quantity")]  # selects rows where quantity is 1 and item is "banana"

# Change the value inside cells
# The <- operator is not just for assigning a value to a variable name.
# Make a copy of a data frame before modifying it
grocery_list_copy <- grocery_list  # creates a copy of the grocery_list data frame
# Modify the copy
# x[row, column] <- value This assigns the new value to the specified row and column.
# Imagine the price of bananas changed to 0.4
index_row <- which(grocery_list_copy$item == "banana")  # gets the row index of "banana")
grocery_list_copy[index_row, "price"] <- 0.4  # changes the price of "banana" to 0.4

# mutate contents in column keep column name
movies_overwrite <- smaller_movies %>%
  mutate(rating = ifelse(rating >= 4, "Good", "Bad"))
# Change name
cars_keep <- mtcars %>%
  mutate(transmission = ifelse(am == 0, "Automatic", "Manual"))

# Change the name of a column
# The <- operator is not just for assigning a value to a variable name.
names(grocery_list_copy)[names(grocery_list_copy) == "item"] <- "food_item"  # changes the name of the item column to food_item

# Possible TODO: What are other examples/methods on data wrangling in base R?



### 2. dplyr Functions
# core dplyr verbs 
# select(), filter(), mutate(), group_by(), summarize(), arrange()  

# Possible TODO: What are examples/methods on data wrangling in dplyr?
# Selecting Columns with select() 
select(mtcars, -gear)                   # drop one column
# With a pipe:
mtcars %>% 
  select(mpg, cyl, hp)     

# Filtering Rows with filter()
filter(mtcars, mpg >= 25)
filter(mtcars, cyl %in% c(4, 6))
# Piping version:
mtcars %>% filter(cyl != 4)
# two conditions (AND)
mtcars %>% filter(mpg >= 25, cyl == 4)
# three conditions (AND)
mtcars %>% filter(mpg >= 25, cyl == 4, hp > 100)
# Combining filter() and select()
mtcars %>% 
  filter(mpg ==21) %>%         # rows
  select(mpg, cyl, disp)       # columns
  head()

# Removing duplicates
movielens %>%
  filter(rating >= 4.5) %>% # filters rows
  select(title) %>% # selects columns
  unique()  # removes duplicates of the title column
  
# === Data Visualization === #####
### 1. Base R Plotting


# Possible TODO: What are examples/methods for data visualization in base R?


### 2. ggplot2
# library(ggplot2)  # loads the ggplot2 package
library(ggplot2)  # loads the ggplot2 package
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
# Nesting Functions: Feed the output of one function straight into another.
mean(sample(numbers, size = 5, replace = TRUE))  # sample then average



# ifelse: ifelse() is a vectorized function that returns values based on a condition
# SYNTAX  ifelse(test, yes, no)
# • *test*  – logical vector (TRUE/FALSE/NA)
# • *yes*   – value to insert where test is TRUE
# • *no*    – value to insert where test is FALSE or NA
ifelse(test = c(1, 2, 3, 4, 5) > 3, yes = "Big", no = "Small")
trial_vec2 <- ifelse(trial_vec == 2, "two", "not two")

# ifelse() multi-level recoding
object2 <- c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5)
ifelse(object2 == 1, "One",
       ifelse(object2 == 2, "Two",
              ifelse(object2 == 3, "Three",
                     ifelse(object2 == 4, "Four", "Five"))))


# Binary operators: +, -, *, /, ^, %%, %/%
# Logical operators: ==, !=, <, >, <=, >=
# Logical operators: & (and), | (or), ! (not)

# Equality & Inequality Operators
mtcars$cyl == 6        # ➡ TRUE where cylinders equal 6
mtcars$gear != 4       # ➡ TRUE where gears are NOT 4
mtcars$hp  >= 150       # TRUE where hp ≥ 150
mtcars[mtcars$mpg > 22, ]
# Combining Conditions with &  (AND)
mtcars[mtcars$am == 0 & mtcars$mpg >= 22, ]
# Combining Conditions with |  (OR)
mtcars[mtcars$cyl == 4 | mtcars$cyl == 8, ]
# Membership with %in% 
mtcars[mtcars$cyl %in% c(4, 8), ]

# Example reflection: Reminder: Always use print() inside a loop if you want output!


# Possible TODO: What are examples/methods on loops and functions?



# === Common Errors === #####
# Example reflection: Error: object not found –> I forgot to run the line that creates the object
# Example reflection: Error: unexpected symbol –> I left out a comma or parentheses
