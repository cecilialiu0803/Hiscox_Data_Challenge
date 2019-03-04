install.packages('quantmod')
library('quantmod')

###********************Top companies based on our KPIs********************
#HSX.L - HISCOX
#TRV - The Travelers Companies
#AIG - American International Group
#HIG - The Hartford Financial Services Group, Inc.

#Download stock price from Yahoo finance
insurance_stock <- c('HSX.L','TRV','AIG','HIG')

getSymbols(insurance_stock, src = 'yahoo',from = '2016-06-01',to = '2017-01-01')

basket <- data.frame(as.xts(merge(HSX.L,TRV,AIG,HIG)))

head(basket,2)
View(basket)

#only keep the Close column 
basket <- basket[,names(basket)[grepl(x=names(basket), pattern='Close')]]
head(basket)
View(basket)

# remove missing values 
basket <- basket[!(rowSums(is.na(basket))),]
head(basket)
tail(basket)
class(basket)

summary(basket)

#####PLOT HSX.L & TRV & AIG &HIG 
plot(as.Date(row.names(basket)), basket$HSX.L.Close, col="red", type='l', ylab="", xlab="")
par(new=TRUE)
plot(as.Date(row.names(basket)), basket$TRV.Close, col='green', type='l', 
     xaxt="n", yaxt='n', xlab="",ylab="")
par(new=TRUE)
plot(as.Date(row.names(basket)), basket$AIG.Close, col='blue', type='l', 
     xaxt="n", yaxt='n', xlab="",ylab="")
par(new=TRUE)
plot(as.Date(row.names(basket)), basket$HIG.Close, col='purple', type='l', 
     xaxt="n", yaxt='n', xlab="",ylab="")
axis(4)
legend("topleft",col=c("red","green",'blue','purple'),lty=1,legend=c("HSX.L","TRV",'AIG','HIG'))



#chartSeries(HSX.L)
#chartSeries(HSX.L, theme=chartTheme('white'), up.col="black",
#            dn.col="black")

#HSX.L.EMA.10 <- EMA(HSX.L$HSX.L.Close, n=10) 
#head(HSX.L.EMA.10,11)
#HSX.L.EMA.50 <- EMA(HSX.L$HSX.L.Close, n=50) 
#head(HSX.L.EMA.50,51)
#HSX.L.EMA.200 <- EMA(HSX.L$HSX.L.Close, n=200)
#head(HSX.L.EMA.200,201)
#Fast.Diff <- HSX.L.EMA.10 - HSX.L.EMA.50
#Slow.Diff <- HSX.L.EMA.50 - HSX.L.EMA.200
#addTA(Fast.Diff, col='blue', type='h',legend="10-50 MA")
#addTA(Slow.Diff, col='red', type='h',legend="50-100 MA")



###********************Bottom companies based on our KPIs********************
#Ameriprise Financial, Inc. (AMP) - parent company of IDS
#The cincinnati insurance-Cincinnati Financial(CINF)
#Avatar property&casualty-Avatar Partners LP
#Citizens property-It is a government-owned, not for profit, insurer of last resort.
#Federal insurance - Chubb(CB)

#Download stock price from Yahoo finance
bottom_stock <- c('AMP','CINF','CB')

getSymbols(bottom_stock, src = 'yahoo',from = '2016-06-01',to = '2017-01-01')

bottombasket <- data.frame(as.xts(merge(AMP,CINF,CB)))
head(badbasket,2)
View(badbasket)

#only keep the Close column 
bottombasket <- bottombasket[,names(bottombasket)[grepl(x=names(bottombasket), pattern='Close')]]
head(bottombasket)

# remove missing values
bottombasket <- bottombasket[!(rowSums(is.na(bottombasket))),]
head(bottombasket)
tail(bottombasket)
class(bottombasket)

summary(bottombasket)

#####PLOT AMP,CINF,CB
plot(as.Date(row.names(bottombasket)), bottombasket$AMP.Close, col="orange", type='l', ylab="", xlab="")
par(new=TRUE)
plot(as.Date(row.names(bottombasket)), bottombasket$CINF.Close, col='pink', type='l', 
     xaxt="n", yaxt='n', xlab="",ylab="")
par(new=TRUE)
plot(as.Date(row.names(bottombasket)), bottombasket$CB.Close, col='darkgreen', type='l', 
     xaxt="n", yaxt='n', xlab="",ylab="")
axis(4)
legend("topleft",col=c("orange","pink",'darkgreen'),lty=1,legend=c("AMP","CINF",'CB'))
