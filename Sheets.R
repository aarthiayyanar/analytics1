library(gsheet)

url = 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco= as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)

#loyal customer
denco %>% count(custname,sort=TRUE)

#summarise by part num
df3a= aggregate(denco$revenue,by=list(denco$partnum),FUN=sum )
head(df3a)

denco %>% group_by(partnum) %>% summarise(n=n()) %>% arrange(desc(n))

#parts with highest profit
names(denco)
df4a = aggregate(margin~partnum,data=denco,FUN=sum)

head(df4a[order(df4a$margin,decreasing = T),])

