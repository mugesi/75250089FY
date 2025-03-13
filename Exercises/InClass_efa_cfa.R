# -------------------------------------------------------------------------

# Title: In-class Exercises
# Author: Müge Simsek
# Date: 2025-03-13

# -------------------------------------------------------------------------

#clean the environment
rm (list = ls())

# EFA ---------------------------------------------------------------------
#load data
library(foreign)
saq_df <- read.spss("~/Downloads/DS5 SPSS Files/SAQ.sav", to.data.frame = TRUE, use.value.labels =FALSE)

#run 4-factor pa model and store the output into an object
saq_fa4 <- psych::fa(saq_df,
                    nfactors = 4,
                    max.iter = 100,
                    fm= "pa",
                    rotate = "varimax",
                    covar = FALSE) #covar = F is the default argument

#check the output
str(saq_fa4)

#display the root mean square residual
saq_fa4$rms
#compute rmsr manually
sqrt(mean(residuals(saq_fa4,diag=FALSE)^2,na.rm=TRUE))


#plot the residuals
hist(residuals(saq_fa4, diag = FALSE))

#number of unique resds in a symmetric matrix
length(model_resd[lower.tri(model_resd)]) 

#store off-diagonal residuals into an object
model_resd <- residuals(saq_fa4, diag = FALSE)

# how many residuals are above .05
length(which(abs(model_resd)>0.05))
# OR
sum(abs(model_resd) > 0.05, na.rm = TRUE)


# CFA ---------------------------------------------------------------------
library(lavaan)
# Select only the relevant questions for the two factors
subset_saq_df <- saq_df[, c("Question_08", "Question_11", "Question_17",  # Fear of math
                            "Question_09", "Question_22", "Question_02", "Question_19", "Question_23")]  # Peer evaluation

# View the first few rows of the new dataset
head(subset_saq_df)

# Define a simple CFA model with two factors
cfa_model <- '
  # Factor 1 - Items: 08, 11, 17
  F1 =~ Question_08 + Question_11 + Question_17

  # Factor 2 - Items: 09, 22, 02, 19, 23
  F2 =~ Question_09 + Question_22 + Question_02 + Question_19 + Question_23
'
cfa_model2 <- '
  # Factor 1 - Items: 08, 11, 17
  F1 =~ Question_08 + a*Question_11 + a*Question_17

  # Factor 2 - Items: 09, 22, 02, 19, 23
  F2 =~ Question_09 + Question_22 + Question_02 + Question_19 + Question_23
'

# Fit the CFA model using Maximum Likelihood (ML)
fit_m1 <- cfa(cfa_model, 
           data = subset_saq_df, 
           estimator = "ML",
           std.lv = T)

# Print 
summary(fit_m1, fit.measures = TRUE, standardized = TRUE)

#check modification indices
modindices(fit_m1)

fitMeasures(fit_m1, c("chisq","df","pvalue"))

# Fit the CFA model using Maximum Likelihood (ML)
fit_m2 <- cfa(cfa_model2, 
              data = subset_saq_df, 
              estimator = "ML")
summary(fit_m2, fit.measures = TRUE, standardized = TRUE)

lavTestLRT(fit_m1, fit_m2) 
lavTestLRT(fit_m2, fit_m1) 
