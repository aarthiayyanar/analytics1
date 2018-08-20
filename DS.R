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
(m1=matrix(1:24,nrow=4,ncol=6)) #column wise default
?matrix
(m1=matrix(1:24,nrow=4,byrow=TRUE)) #row wise
(m1=matrix(1:24,ncol=4,byrow=TRUE)) 
(x=trunc(runif(60,60,100))) #uniform distribution
plot(density(x))

#round,trunc,ceiling,floor
x=trunc(x)
x
(m4=matrix(x,ncol=6))
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4>67 & m4<78]
m4[10,]
m4[,6]
m4[1:6,c(1,3,5)]
rowSums(m4[1:6,c(1,3,5)])



#array----


#data.frame ----
#rollno,name,gender,course,marks1,marks2

(rollno = 1:60)
(name =paste('student',1:60,sep='-')) #paste
name[1:10]
name[c(1,3,5)] #position
name[-2]
name[-c(1:10)] # remove 1 to 10
name[-c(1:10,35:40)]
rev(name)  #reverse
name[60:1]   #reverse

(gender = sample(c('Male','Female'),size=60,replace=TRUE,prob=c(.4,.5)))
(course = sample(c('BBA','MBA','FPM'),size=60,replace=T,prob=c(.3,.3,.4)))
(marks1=ceiling(rnorm(60,mean=65,sd=7)))
(marks2=ceiling(rnorm(60,mean=65,sd=11)))
(grades = sample(c('A','B','C'),size=60,replace=TRUE))


students =data.frame(rollno,name,gender,course,marks1,marks2,grades,stringsAsFactors = F)
class(students)

summary(students)
students[,c('name')]
students[students$gender=='Male',]
students[students$gender=='Male' & students$course=='MBA',c('rollno',"gender",'course')]
students[students$gender=='Male' & students$marks1>80 | students$marks2>70,c('rollno',"gender",'course','marks1','marks2')]

t1=table(students$course)
barplot(t1,ylim=c(0,50),col=1:3)  #ylim increase the limit 
text(1:3,table(students$course)+5,table(students$course)) #to display value in graph

str(students) #column types
names(students) #column names
dim(students) # no of rows,columns
head(students,n=7)  #default first 6 rows
tail(students) #default last 6 rows

students[1:10,]
students[1:10,c(1,3,5)]


#avg marks by each gender in marks1
aggregate(students$marks1,by=list(students$gender),FUN=mean) #mean
#maximum marks scored in each course in marks2
aggregate(students$marks2,by=list(students$course),FUN=max) #maximum
#avg marks in each course by each gender in marks2
aggregate(students$marks2,by=list(students$course,students$gender,students$grades),FUN=mean) 



#dplyr----
library(dplyr)
students %>% group_by(course,gender) %>% summarise(mean(marks1),min(marks2),max(marks2))
students %>% group_by(course,gender) %>% summarise(meanmarks1=mean(marks1),min(marks2),max(marks2)) %>% arrange(desc(meanmarks1))

students %>% arrange(desc(marks1)) %>% select(name,marks1) %>% filter(gender=='Male') %>% top_n(5)

#select 10% of the students
 sample_frac(students,size=.1)
 students %>% sample_frac(.1)
 
 #select random 5 students
 
 sample_n(students,5)
 students %>% sample_n(5) %>% arrange(course) %>% select (name,gender)


 #students %>% group_by(course) %>% arrange(desc(marks1,marks2)) %>% top_n(2)
 
 #factor----
 names(students)
students$gender = factor(students$gender) 
summary(students$gender)

students$course = factor(students$course,ordered = T, levels=c('FPM','MBA','BBA'))  #levels- to specify the order to be displayed
summary(students$course) 

#C < A < B

students$grades = factor(students$grades,ordered=T,levels= c('C','A','B'))
table(students$grades)
summary(students$grades)

#CSV file operations
students
write.csv(students,'./data/students.csv')
students2= read.csv ('./data/students.csv')
students2
students3= read.csv(file.choose())
students3
students3= students3[,-1]
students3
