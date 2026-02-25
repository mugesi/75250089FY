#-----------------------------------------------------------
#Title: IN-CLASS EXERCISES
# Author: Everyone in the class
# Date: 02-05-2026
# Description: This syntax introduces basic R data types and data structures.
# version:R version 4.4.0
#-----------------------------------------------------------

# Objects in R ------------------------------------------------------------

#clean the environment
rm(list = ls())
ls()
data("diamonds")
data("economics")

#get working directory
getwd()

#change directory
setwd("/Users/msimsek/Desktop")

#remove a specific dataset
rm(economics)

#R as a calculator
2
2+3
45*8

#Example of an object
result_multiplication <- 45*8
result_multiplication

student_name_1 <- "Hello Klara"
data("CO2")
summary(CO2)
data("BOD")

summary(CO2$Plant)
?summary

summary(student_name_1)


# Data types --------------------------------------------------------------

numeric_value <- 5.3
numeric_value_2 <- 5
integer_value <- 5L
logical_value <- FALSE
character_value <- "Lesa"

class(numeric_value)
class(numeric_value_2)

# Data Structures ---------------------------------------------------------

#create a vector
names <- c("Lesa", "Ciaran", "Lucette", "Xiyu", "Vukasin", "George")
mixed_vec <- c("Lesa", 19)
grades <- c(9.5, 9, 9, 9.5, 9, 10)

#create a matrix
my_matrix <- matrix(data = names, nrow = 3, ncol = 2)
my_matrix <- matrix(c("Lesa", "Ciaran", "Lucette", "Xiyu", "Vukasin", "George"), nrow = 2, ncol = 3)
#display the matrix
my_matrix

#create a dataframe
my_data <- data.frame(names, grades)
my_data

str(my_data)
id <- c(1:6)
my_new_data <- data.frame (my_data, id)

#index a column
my_new_data[[1]]
my_new_data[["names"]]
my_new_data$names
my_new_data[ ,"names"]

#index a row
my_new_data[4:6 ,"names"]
my_new_data$names[4]


#install a package
install.packages("ggplot2")
library(ggplot2)
ggplot2::