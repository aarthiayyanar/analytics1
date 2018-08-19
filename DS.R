#data structures
#vectors----
v1=1:100   #create vector from 1 to 100
v2=c(1,4,7,9,213,34534,24325)
class(v1) #datatype
v3=c('dsd','dssd','ds') #character vector
v4 = c(TRUE,T,FALSE,F) #logical vector
class(v4)

mean(v1)
median(v1)
sd(v1) #standard distribution
var(v1) #variance
hist(women$height) # histogram
v2
v2[v2>=10]
x = rnorm(60,mean=60,sd=10) #normal distribution
x
plot(x)  #graph
hist(x)  #histogram
plot(density(x))  #normal distribution
abline(v=60) #middle line in graph

#merge bars and curve - rectangle and density together
hist(x,freq=F)
lines(density(x))
hist(x,breaks=10,col=1:10)

length(x)  #length of vector
sd(x)
?sample
x1= LETTERS[5:20]  #alphabets from E to T
x1
set.seed(1234) # to repeat the same data in same order - same pattern
y1=sample(x1)
y1

(y2=sample(x1,size=5)) #assign and print

(gender=sample(c('M','F'),size=60,replace=TRUE)) #replace to copy the same data toa vector of defined size

(gender=sample(c('M','F'),size=500,replace=TRUE,prob=c(.3,.7))) #probalility
(t1=table(gender)) #count
prop.table(t1) #percentage 
pie(t1) #pie chart
barplot(t1,col=1:14,horiz=T) #bar chart


#matrix----


#array----
