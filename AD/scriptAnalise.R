install.packages('ggplot2')
install.packages("devtools") 
install.packages("RGtk2")
install.packages('Rcmdr', dependencies = TRUE)
library(RGtk2)
install.packages('ggthemes', dependencies = TRUE) 
install.packages('rminer')
install.packages('corrplot', dependencies = TRUE)
library(corrplot)
library(rminer)
install.packages('tableplot')
library(grid)
library(ggthemes) 
library(ggplot2)

#Carregar dados do dataset
dataset <- read.csv("D:/Universidade/4 ano/BI/An?lise de Dados/dw/AD/movie_metadata.csv",header =TRUE,sep = ",",na.strings = "NA")
dim(dataset)
sapply(dataset,function(x) sum(is.na(x)))
names(dataset)
summary(dataset)
#Melhor filme
mfilme<-dataset[dataset$imdb_score==9.5,]
print(mfilme$movie_title)
#Pior filme
pfilme<-dataset[dataset$imdb_score==1.6,]
print(pfilme$movie_title)
#Distribuicao dos anos dos filmes
hist()


#Escolha de atributos candidatos para a analise
p1=c(3,4,5,6,8,9,13,14,19,23,25,26,28)
analise1=dataset[,p1]
analise1.clean=analise1[complete.cases(analise1),]

par(mfrow=c(2,2))

for(att in colnames(analise1.clean)[c(1,2,3,4)]){
  hist(analise1.clean[,att],xlab="",ylab="",main=att,col="lightgray")
}
par(mfrow=c(2,2))
for(att in colnames(analise1.clean)[c(5,6,7,8)]){
  hist(analise1.clean[,att],xlab="",ylab="",main=att,col="lightgray")
}
par(mfrow=c(2,3))
for(att in colnames(analise1.clean)[c(9,10,11,12,13)]){
  hist(analise1.clean[,att],xlab="",ylab="",main=att,col="lightgray")
}

#Correlaçao1
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}
pairs(analise1.clean, lower.panel = panel.smooth,upper.panel=panel.cor)

#Correlaçao2
corr=cor(analise1.clean)
library(gplots)
heatmap.2(corr, col = redblue(16),trace="none")






#Correlaçao pergunta 2
x1<-c(5,6,8,25,26)
clust1<-dataset[x1]
correlacao=clust1[complete.cases(clust1),]
cor(correlacao, use="complete.obs", method="pearson")

#Correlacao pergunta 1
x1<-c(14,26)
clust1<-dataset[x1]
correlacao=clust1[complete.cases(clust1),]
cor(correlacao, use="complete.obs",method="pearson")

#Correlacao pergunta 3
x1<-c(23,26)
clust1<-dataset[x1]
correlacao=clust1[complete.cases(clust1),]
cor(correlacao, use="complete.obs",method="pearson")

#correlacao pergunta 4
x1 <- c(26)
clust1<-dataset[x1]
correlacao1=clust1[complete.cases(clust1),]
IScore <- cut(correlacao1, breaks=c(0,2,4,6,8,10), labels=c("Muito fraco","Fraco","Razo?vel","Bom","Excelente"))

x2<-c(22,10)
clust2<-dataset[x2]
correlacao2=clust2[complete.cases(clust2),]

x3<-merge(correlacao1,correlacao2)
cor(correlacao2, use="complete.obs",method="pearson")


#Fazer uma regressão
















