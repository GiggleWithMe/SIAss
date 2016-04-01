library(ggplot2)
setwd("~/Desktop/Coursera/SI/SIAss")
set.seed(1234567890)
#==================

##In this project you will investigate the exponential 
#distribution in R and compare it with the Central Limit 
#Theorem. The exponential distribution can be simulated in 
#R with rexp(n, lambda) where lambda is the rate parameter. 
#The mean of exponential distribution is 1/lambda and the 
#standard deviation is also 1/lambda. Set lambda = 0.2 for 
#all of the simulations. You will investigate the 
#of averages of 40 exponentials. Note that you will need to 
#do a thousand simulations.

nsims<-1000
exps<-40
lambda<-.2

sims<-matrix(rexp(nsims*exps,lambda),nsims)
simmeans<-data.frame(apply(sims,1,mean))
simmeansplot<-qplot(simmeans,geom="histogram")
simmeansplot

nsims2<-10000

sims2<-matrix(rexp(nsims2*exps2,lambda2),nsims2)
simmeans2<-data.frame(apply(sims2,1,mean))
simmeansplot2<-qplot(simmeans2,geom="histogram")
simmeansplot2

mean1000<-mean(simmeans$apply.sims..1..mean.)
mean10000<-mean(simmeans2$apply.sims2..1..mean.)
sd1000<-sd(simmeans$apply.sims..1..mean.)
sd10000<-sd(simmeans2$apply.sims2..1..mean.)
var1000<-sd1000^2
var10000<-sd10000^2

normplot<-