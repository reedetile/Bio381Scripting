#Description-----------------------------------------
#ggplotII
#  14 Apr 2022
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
d <- mpg

# Program Body------------------------------------------

###Plotting multiple panel graphs w/ patchwork
g1 <- ggplot(data =d)+
  aes(x=displ,y=cty)+
  geom_point()+
  geom_smooth()
print(g1)

g2 <- ggplot(data=d)+
  aes(x=fl,fill=I('tomato'),color=I('black'))+
  geom_bar(stat='count')
g2

g3 <- ggplot(data=d)+
  aes(x=fl,y=cty,fill=fl)+
  geom_boxplot()+
  theme(legend.position='none')
g3

g4 <- ggplot(data=d)+
  aes(x=fl,y=cty,fill= fl)+
  geom_boxplot()+
  theme(legend.position='none')

#place two plots horizontally
g1 + g2

#place 3 plots vertically
g1+g2+g3+plot_layout(ncol=1)

#change relative area of each plot
g1+g2+plot_layout(ncol=1,heights=c(2,1))

g1+g2+plot_layout(ncol=2,nrow=1,heights=c(1,2))

#add spacer
g1+plot_spacer()+g2

#use nested layouts
g1+{
  g2+{
    g3+{
      g4}}}

#operator for subtrack placement
g1+g2-g3+plot_layout(ncol=1)

#/ and | for intuitive layout
(g1|g2|g3)/g4

(g1|g2)/(g3|g4)

#change styling of pathcwork elements
g1+g2+
  plot_annotation(title = 'This is a title',caption = 'made with patchwork',
                  theme =theme(plot.title = element_text(size=16)))

#add tags to a plot
g1/(g2|g3)+
  plot_annotation(tag_levels = 'A')

#not working for some reason. should reverse axis#
g3a <- g3 + scale_x_reverse()
g3b <- g3 + scale_y_reverse()
g3c <- g3 + scale_x_reverse()+scale_y_reverse()
(g3 | g3a)/( g3b | g3c)

g3+coord_flip()|g3a+coord_flip()

#mapping of a discrete variable to point color
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,color=class)+
  geom_point(size=3)
m1

#mapping discrete var to point shape
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,shape=class)+
  geom_point(size=3)
m1

#mapping discrete var to point size
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,color=class,size=class)+
  geom_point()
m1

#mapping a continuous var to point size
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,size=hwy)+
  geom_point()
m1

#mapping a continuous var to point color
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,color=hwy)+
  geom_point(size=5)
m1

#mapping variables to different aesthetics#
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,color=hwy,shape=class,color=hwy)+
  geom_point(size=5)
m1

#use all 3(size shape + color) simultaneously
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,shape = drv, color=fl, size = hwy)+
  geom_point(size=5)
m1

#mapping variable to same aesthetic w/ 2 diff geoms
m1 <- ggplot(data = mpg)+
  aes(x=displ,y=cty,color=drv)+
  geom_point(size=2)+
  geom_smooth(method='lm')
m1

#basic faceting w/ variables split by row, colum, or both
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty)+
  geom_point()
m1 + facet_grid(class~fl)
m1 + facet_grid(class~fl,scales='free_y') #allows for diffetent scaling of y variable
m1 + facet_grid(class~fl,scales='free') #allows for diffetent scaling of x and y variable
m1 + facet_grid(.~class)
m1 + facet_grid(class~.)

#use facet wrap when variables are not crossed
m1 + facet_wrap(~class)
m1+facet_wrap(~class+fl)
m1+facet_wrap(~class+fl,drop=F)
m1+facet_grid(class~fl)

#use facet with other aesthetic mapping within rows or columns
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,color=drv)+
  geom_point()
m1 + facet_grid(.~class)

#easy to switch to other geoms
m1 <- ggplot(data=mpg)+
  aes(x=displ,y=cty,color=drv)+
  geom_smooth(method='lm',se=F)
m1 + facet_grid(class~.)

#fitting w/ boxplots over a continuous variable
m1 <- ggplot(data = mpg)+
  aes(x=displ,y=cty)+
  geom_boxplot()
m1+facet_grid(.~class)

#mapping aesthetics within geoms
d <- mpg
#standard plot w/ all data
p1 <- ggplot(data=d)+
  aes(x=displ,y=hwy)+
  geom_point()+
  geom_smooth()
p1
#break out drive types
p1 <- ggplot(data=d,aes(x=displ,y=hwy,group=drv))+
  geom_point()+geom_smooth()
p1

#break out drive types + assign colors
p1 <- ggplot(data=d,aes(x=displ,y=hwy,color=drv))+
  geom_point()+geom_smooth()
p1
