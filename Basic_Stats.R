x= ceiling(rnorm(10000,mean=2,sd=20))
mean(x)
median(x)
table(x)  #calculate frequency count
sort(table(x),decreasing = T)  #mode
library(modeest)
mlv(x,method='shorth')

quantile(x)
quantile(x,seq(.1,1,by=.1))  #decile 10 parts
quantile(x,seq(.01,1,by=.01))  #percentile 100 parts



library(e1071)
plot(density(x))
e1071::skewness(x)
kurtosis(x)
sd(x)
var(x)
cov(women$height,women$height)
cor(women$height,women$height)

stem(x)


#freq distribution table
library(fdth)
ftable1 = fdt(x)
ftable1
