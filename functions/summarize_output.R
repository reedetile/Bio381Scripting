#######################################################
# FUNCTION: summarize_output
# Purpuse:
#input:
#output:
#-----------------------------------------------------
summarize_output <- function(z=NULL) {
  if(is.null(z)){
    z <- summary(lm(runif(10) ~ runif(10)))
  }
  return(z$residuals)
}

