## Set up
setwd("~/Desktop/Coursera/SI/SIAss")
library(ggplot2)
library(datasets)
set.seed(0987654321)
data("ToothGrowth")

##Basic exploration
str(ToothGrowth)
head(ToothGrowth)
summary(ToothGrowth)
table(ToothGrowth$dose,ToothGrowth$supp)
plot <- ggplot(ToothGrowth,aes(dose,len))+geom_jitter(alpha=I(.5),aes(color=supp))+scale_color_manual(values=c("red","blue"))+theme(legend.position=c(.2,1),legend.justification=c(1,1))
plot

## The data so far appears that there are two suppliments - orange juice and vitamin C - as applied to tooth growth. 

OJTooth<-ToothGrowth$len[ToothGrowth$supp=="OJ"]
VCTooth<-ToothGrowth$len[ToothGrowth$supp=="VC"]

meanvc<-mean(VCTooth)
meanvc
meanoj<-mean(OJTooth)
meanoj
meanoj-meanvc

## Given that there are equal doses of 0.5, 1 and 2. The mean of oj is higher than the mean of vc, suggesting that oj is better for tooth growth.

t.test(OJTooth,VCTooth,alt="greater")

## With a Null Hypothesis that the mean of OJ is equal to the mean of VC, at the 5% confidence level we can be confident that OJ is better at promoting tooth growth.

oj05<-ToothGrowth$len[ToothGrowth$supp=="OJ"&ToothGrowth$dose==0.5]
oj10<-ToothGrowth$len[ToothGrowth$supp=="OJ"&ToothGrowth$dose==1]
oj20<-ToothGrowth$len[ToothGrowth$supp=="OJ"&ToothGrowth$dose==2]
vc05<-ToothGrowth$len[ToothGrowth$supp=="VC"&ToothGrowth$dose==0.5]
vc10<-ToothGrowth$len[ToothGrowth$supp=="VC"&ToothGrowth$dose==1]
vc20<-ToothGrowth$len[ToothGrowth$supp=="VC"&ToothGrowth$dose==2]

t.test(oj05,vc05,alt="greater")
t.test(oj10,vc10,alt="greater")
t.test(oj20,vc20,alt="greater")
