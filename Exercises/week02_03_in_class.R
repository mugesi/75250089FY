
# -------------------------------------------------------------------------

# Title: In-class Exercises
# Author: Müge Simsek
# Date: 2026-02-17

# -------------------------------------------------------------------------


# %in% operator  ----------------------------------------------------------

# Define two vectors
x <- c("1", "2", "3", "4", "6")
y <- c("2", "4", "6")

# Check which elements of x are in y
x %in% y

# Check which elements of y are in x
y %in% x

# Filter elements of x that are in y
x[x %in% y]

# == operator -------------------------------------------------------------

a <- 5
b <- 5
c <- 10

a == b  # TRUE
a == c  # FALSE

# Vector example
x <- c(1, 2, 3, 4)
y <- c(1, 3, 2, 4)

x == y  # Compares element-wise

x <- c(10, 20, 30, 40)
y <- c(5, 20, 25, 40)

x <- c("blueberry", "strawberry", "apple")
grep("berry", x)

x <-gsub("berry", "fruit", x)

(x == 10) & (y == 5)  # Element-wise AND
(x == 10) | (y == 20)  # Element-wise OR

# Week02 Exercises --------------------------------------------------------------

# Load package to read stata data file
library(haven)

# Read the Stata file into R
oxis_data <- read_dta("/Users/msimsek/Desktop/UvA/Teaching/Data_and_Measurement_RMSS/2025/W2/oxis2013ukda.dta")

#Check the class of the dataset
class(oxis_data) 

# Convert the tibble to data.frame using the as.data.frame() function.
oxis_df <- as.data.frame(oxis_data)

#Check the var dg4
str(oxis_df$dg4)
table(oxis_df$dg4, useNA = "always")
unique(oxis_df$dg4)
is.na(oxis_df$dg4)
which(is.na(oxis_df$dg4))
sum(is.na(oxis_df$dg4))

is.na(oxis_df$dg4)

# Convert the var dg4 to a factor
oxis_df$education <- factor(oxis_df$dg4, levels = c(0, 1, 2, 3), 
                            labels = c("No diploma", "Secondary education", 
                                       "Further education college",
                                       "Higher education"))

#Check the factor str
str(oxis_df$education)

#Check whether the levels correspond to correct values in original variable
table(oxis_df$education,oxis_df$dg4, useNA = "ifany")

table(oxis_df$dg4)
table(oxis_df$education)

#Sapply function
# Apply mean function with na.rm = TRUE to each variable
vars <- c("trmost","trgov", "accmo")
sapply(oxis_df[ , vars], function(x) mean(x, na.rm = TRUE))

sapply(oxis_df[, vars], function(x) mean(x, na.rm = TRUE))
