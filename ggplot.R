#Description-----------------------------------------
#Introduction to Graphics
#  12 Apr 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(patchwork)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------


# Global Variables-------------------------------------


# Program Body------------------------------------------
#ggsave(plot=p1,filename='MyPlot','width=5,height=3,units='in',device='pdf')
d <- mpg #uses built mpg data frame
str(d) #shows d is actually a tibble, not dataframe
table(d$fl)

#use qplot for fast plotting while coding
qplot(x=d$hwy)
qplot(x=d$hwy,fill=I('khaki'),color=I('black'))
#basic scatterplot
qplot(x=d$displ,y=d$hwy,geom=c('smooth','point'))
qplot(x=d$displ,y=d$hwy,geom = c('smooth','point'),method= 'lm')
# basic boxplot
qplot(x=d$fl, y=d$cty,geom="boxplot",fill=I("green"))       
# basic barplot (long format)
qplot(x=d$fl,geom="bar",fill=I("green"))
qplot(x=d$fl,geom="bar",fill="green")

# bar plot with specified counts or meansw
x_treatment <- c("Control","Low","High")
y_response <- c(12,2.5,22.9)
qplot(x=x_treatment,y=y_response,geom="col",fill=I(c("red","green","blue")))

# basic curves and functions
my_vec <- seq(1,100,by=0.1)
my_fun <- function(x) sin(x) + 0.1*x
qplot(x=my_vec,y=sin(my_vec),geom="line") # built in functions

qplot(x=my_vec,y=dgamma(my_vec,shape=5, scale=3),geom="line")  # stats d functions
qplot(x=my_vec,y=my_fun(my_vec),geom="line") # user-defined functions

#Themes and fonts
p1 <- ggplot(data=d, mapping=aes(x=displ,y=cty)) + geom_point()
print(p1)
p1 + theme_bw() # good with grid lines
p1 + theme_classic() # no grid lines
p1 + theme_linedraw() # black frame
p1 + theme_dark() # good for brightly colored points
p1 + theme_base() # mimics base R
# use theme parameters to modify font and font size
p1 + theme_classic(base_size=40,base_family="serif")
