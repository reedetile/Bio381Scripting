#minimal data and analysis of exp designs
#24 Feb 2022
#RCS
library(tidyverse)

#regression

#build a mock data frame
n <- 50 #number of observations (rows)
var_a <- runif(n) #independent
var_b <- runif(n) #dependent
var_c <- 5.5+var_a*10 #noisy regression
ID <- seq_len(n)
reg_data <- data.frame(ID,var_a,var_b,var_c)
head(reg_data)

#regression model
reg_model <- lm(var_b ~ var_a, data = reg_data)

#model output
reg_model
summary(reg_model)

z <- unlist(summary(reg_model))
z$coefficients8 #p-value
regSum <- list(intercept = z$coefficients1, Pintercept = z$coefficients7)
print(regSum)
