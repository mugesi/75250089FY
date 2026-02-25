
# -------------------------------------------------------------------------

# Title: In-class Exercises
# Author: Müge Simsek
# Date: 2026-02-24

# -------------------------------------------------------------------------
#clean the environment
rm(list=ls())

#refresher on rnorm
hist(rnorm(100,5,sd=5))

set.seed(1234567)
#set the number of observations
nobs <- 6000

#set the variance of true political trust scores
var_T <- 80

#set the variance of observed scores
var_X <- 100


#Generate true scores
T <- rnorm(n = nobs, mean = 0, sd = sqrt(var_T))

hist(T, freq = F, col = "lightblue")
lines(density(T)) 

#what to do in base R if I only want the density plot
plot(density(T))

#ggplot density
library(ggplot2)

df <- data.frame(T)
ggplot(df, aes (x = T)) + geom_density(fill = "lightblue")


#Generate observed scores
X <- rnorm(n = nobs, mean = 0, sd = sqrt(var_X))

df_X <- data.frame(X)
ggplot(df_X, aes (x = X)) + geom_density(fill = "lightblue")


E <- X - T

# Combine into a data frame
df_combined <- data.frame(
  score = c(T, X),
  type = rep(c("True", "Observed"), each = nobs)
)

#plot
ggplot(df_combined, aes(x = score, color = type)) +
  geom_density() 


#define reliability
reliability <- var(T)/var(X)
reliability
