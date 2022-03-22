# FUNCTION: calculate_stuff
# Purpuse:fit a OLS regression model
#input:x and y vectors of same length
#output:entire model summary from lm
#-----------------------------------------------------
calculate_stuff <- function(x_var=runif(10),
                            y_var=runif(10)) {
  reg_model <- lm(y_var ~ x_var)
  return(summary(reg_model))
}