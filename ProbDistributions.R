#Probability dstirbution
#22 Feb 2022
#RCS

#dnorm() = PDF of a norm distribution
#pnorm() = cumulative dist of a norm distribution (why is it not cnorm()? c'mon R!!!)
#qnorm() = inverse of pnorm
#rnorm() = what we use most often. generates random variables along that distribution

library(ggplot2)
library(MASS)

hits <- 0:10
my_vec <- dpois(x=hits,lambda = 1)
qplot(x=hits,y=my_vec, geom = 'col', color = I('black'),fill=I('goldenrod'))

hits <- 0:15
my_vec <- dpois(x=hits,lambda = 0.75)
qplot(x=hits,y=my_vec, geom = 'col', color = I('black'),fill=I('goldenrod'))

sum(my_vec)

# what is p() that a single draw will yield x = 0?

dpois(x=0,lambda=2)

#p function gives comulative values
hits <- 0:10
my_vec <- ppois(q=hits,lambda = 2)
qplot(x=hits,y=my_vec, geom = 'col', color = I('black'),fill=I('goldenrod'))

ppois(q=1, lambda = 2)

#adding up the pieces
p_0 <- dpois(x=0, lambda=2)
p_0
p_1 <- dpois(x=1, lambda = 2)
p_1
p_0+p_1 #same as ppois(q=1, lambda = 2)

#q function is inverse of p
qpois(p=0.5,lambda = 2.5)

#generate a random variable
ran_pois <- rpois(n=1000, lambda=2.5)
head(ran_pois)
qplot(x=ran_pois, color = I('black'), fille = I('goldenrod'))

quantile(x = ran_pois, probs=c(0.0250,0.975))

#binomial distribution
#p = prob of dichotomous outcome
#size = number of trials
#x = number of possible outcomes
# x is bounded by 0 + number of trials

hits <- 0:10
my_vec <- dbinom(x=hits, size=10,prob=0.5)
qplot(x=0:10,y=my_vec,geom='col',color=I('black'),fill=I('goldenrod'))
my_coins <- rbinom(n=50,size=100,prob = 0.5)
qplot(x=my_coins,color=I('black'),fill=I('goldenrod'))

#negative binomial
#number of trials until r successes
# success w/ p = p(success)
# more variable than poisson

hits <- 0:40
my_vec <- dnbinom(x = hits, size=5, prob = 0.5)
qplot(x=hits,y=my_vec,geom='col',color=I('black'),fill=I('goldenrod'))

#specify mean = mu
#dispersion parameter (small is more dispersed)
nbiran <- rnbinom(n=1000,size=3,mu=500)
qplot(x = nbiran, color = I('black'), fill = I('goldenrod'))

#continuous dist

#uniform
qplot(x=runif(n=100,min=0,max=5),xlim=c(0,5))

#normal
my_norm <- rnorm(n = 100, mean = 100, sd = 2)
qplot(x = my_norm, color = I('black'), fill = I('goldenrod'))

my_norm <- rnorm(n = 100, mean = 2, sd = 2)
qplot(x = my_norm, color = I('black'), fill = I('goldenrod'))
summary(my_norm)
toss_negs <- my_norm[my_norm > 0]
summary(toss_negs)                     
qplot(x = toss_negs, color = I('black'), fill = I('goldenrod'))

#gamma

my_gamma <- rgamma(n=100, shape =100, scale=10)
qplot(x = my_gamma, color = I('black'), fill = I('goldenrod'))

#mean = shape*scale
#variance = shape*scale^2

#beta
#bounded between 0 and 1
#Analogous to binomial, but is a distof underlying prob for trials
#2 parameters: shape 1 and shape 2
#shape 1 = # of success +1
#shape 2 =  # of failures +1
my_beta <- rbeta(n=1000,shape1=0.5,shape2=0.2)
qplot(x = my_beta, color = I('black'), fill = I('goldenrod'),xlim=c(0,1))

