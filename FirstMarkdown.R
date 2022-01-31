#Don't forget to start with comments!
#Preliminaries
#echo= tells R whether the underlying code should be show
#eval= tells R whether the code should be run
library(ggplot2)
pred <- 1:10 #vector of 10 integers
res <- runif(10) #random uniform values

#print the random numbers#
print(res)
qplot(x = pred, y = res)


