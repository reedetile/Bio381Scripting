#######################################################
# FUNCTION: get_data
# Purpuse: read a CSV file
#input:csv file w/ path name
#output:data frame
#-----------------------------------------------------
get_data <- function(file_name = NULL) {
  if(is.null(file_name)){
    d_frame <- data.frame(ID=101:110,
                          var_a=runif(10),
                          var_b=runif(10))
  } else {
    d_frame <- read.table(file = file_name, 
                          header = TRUE,
                          sep=',')
  }
  return(d_frame)
}

