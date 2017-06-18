install.packages('ggplot2')
install.packages('MatrixModels')
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
library(car)
library(RColorBrewer) 
library(corrplot)
library(ggplot2)

#Carregar dados do dataset
#dataset <- read.csv("D:/Universidade/4 ano/BI/An?lise de Dados/dw/AD/movie_metadata.csv",header =TRUE,sep = ",",na.strings = "NA")
dataset=read.csv("/Users/xavier/Downloads/movie_metadata.csv")
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
#Distribuicao dos anos dos filmes e score
scatterplot(x=dataset$title_year,y=dataset$imdb_score)


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
corrplot(corr,method ='ellipse')

#Regresssão1
lm.imdb=lm(analise1.clean$imdb_score~.,data = analise1.clean)
confint(lm.imdb)
summary(lm.imdb)
#Regressão2
lm.imdb.1=lm(analise1.clean$imdb_score~analise1.clean$num_critic_for_reviews+analise1.clean$duration+
               analise1.clean$actor_3_facebook_likes+analise1.clean$actor_1_facebook_likes+
               analise1.clean$gross+analise1.clean$num_voted_users+analise1.clean$cast_total_facebook_likes+analise1.clean$num_user_for_reviews+
               analise1.clean$actor_2_facebook_likes+analise1.clean$movie_facebook_likes,data = analise1.clean)

summary(lm.imdb.1)

par(mfrow=c(1,1))

#Criar dataset para treino
set.seed(12345)
#todos atributos menos o imdb_score
treino=analise1.clean[,!(names(analise1.clean) %in% c("imdb_score"))]
#so o imdb_score
teste=analise1.clean[,(names(analise1.clean) %in% c("imdb_score"))]

pred=round(as.numeric(predict(lm.imdb.1,treino)))
previsao.expcted=as.data.frame(cbind(teste,pred))
table(previsao.expcted)
plot(table(previsao.expcted),xlab="IMDB Score", ylab = "Previsao", main="Distribuicao da Previsao",margins=c(13,12))
minimdb=min(analise1.clean$imdb_score)
maximdb=max(analise1.clean$imdb_score)
smoothScatter(previsao.expcted,xlab = "IMBD Score", ylab="Previsao",main="Distribuicao da previsao",xlim = c(minimdb,maximdb),ylim=c(minimdb,maximdb))


#Escolha dos atributos metodo 2
library(leaps)
select.atributos=regsubsets(analise1.clean$imdb_score~.,data=analise1.clean,method="backward",nvmax=(ncol(analise1.clean)-1))
summary(select.atributos)
#Nova regressao
lm.reg2=lm(analise1.clean$imdb_score~analise1.clean$num_critic_for_reviews+analise1.clean$duration+
             analise1.clean$gross+analise1.clean$num_voted_users+analise1.clean$cast_total_facebook_likes
           +analise1.clean$num_user_for_reviews)
summary(lm.reg2)

par(mfrow=c(1,1))
anova(lm.imdb,lm.imdb.1)
anova(lm.imdb,lm.reg2)
anova(lm.imdb.1,lm.reg2)
plot(lm.imdb)
plot(lm.imdb.1)
plot(lm.reg2)





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
















