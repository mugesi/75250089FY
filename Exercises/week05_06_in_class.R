# -------------------------------------------------------------------------

# Title: In-class Exercises
# Date: 2026-03-12

# -------------------------------------------------------------------------

#clean the environment
rm (list = ls())

# EFA ---------------------------------------------------------------------
saq_df <- foreign::read.spss("~/Downloads/DS5 SPSS Files/SAQ.sav", to.data.frame = TRUE, use.value.labels =FALSE)


psych::cortest.bartlett(saq_df)
psych::KMO(saq_df)

library(psych)
#run 4-factor pa model and store the output into an object
saq_fa4 <- fa(saq_df,
                     nfactors = 4,
                     max.iter = 100,
                     fm= "pa",
                     rotate = "varimax",
                     covar = FALSE) #covar = F is the default argument
#plot the residuals
residual_object <- residuals(saq_fa4, diag = F)
hist(residual_object[lower.tri(residual_object)], xlim = range(-0.10,0.10), breaks=15, xlab="Non-redundant residuals",
     main="Histogram of off-diagonal residuals")
#count number of residuals that are above 0.05
large_resd <- sum(abs(residual_object[lower.tri(residual_object)]) > 0.05, na.rm = TRUE)
#how many residuals in total?
total_resd <- length(residual_object[lower.tri(residual_object)])
#what is thepercentage of large residuals
large_resd*100/total_resd

# run the model with no rotation
saq_fa4_no_rotation <- fa(saq_df,
                          nfactors = 4,
                          max.iter = 100,
                          fm= "pa",
                          rotate = "none",
                          covar = FALSE)

#run 3-factor pa model and store the output into an object
saq_fa3 <- fa(saq_df,
              nfactors = 3,
              max.iter = 100,
              fm= "pa",
              rotate = "varimax",
              covar = FALSE) #covar = F is the default argument

# Check the communality values per item
# Find where cumulative values are stored in the results
str(saq_fa4)
saq_fa4$communality # this is h2 per item
#check the total communality
saq_fa4$communalities

# Check the variances of individual items in the dataset
# Note: 
# - When using covar = FALSE (default), the factor analysis is run on the correlation matrix,
#   which effectively standardizes items to have variance = 1.
# - When using covar = TRUE, the factor analysis is run on the covariance matrix,
#   so it is important to check the actual variances of the items.
sapply(saq_df, function(x) var(x))  # Variance of each item
diag(cov(saq_df))                   # Extract variances from the covariance matrix


# compute the percent explained variance
saq_fa4$communalities/ncol(saq_df)
#check if the output matches our calculated exp.variance value
saq_fa4$Vaccounted

#display the diagram
fa.diagram(saq_fa4)
fa.diagram(saq_fa4_no_rotation)


#run 4-factor pa model and store the output into an object
saq_fa4_oblique <- psych::fa(saq_df,
              nfactors = 4,
              max.iter = 100,
              fm= "pa",
              rotate = "promax",
              covar = FALSE) #covar = F is the default argument


psych::fa.diagram(saq_fa4_oblique, digits = 2, cut = 0.3, rsize = 3)
 