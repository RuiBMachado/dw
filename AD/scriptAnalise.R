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
dataset <- read.csv("/Users/xavier/Downloads/movie_metadata.csv",header =TRUE,sep = ",",na.strings = "NA")
dim(dataset)
sapply(dataset,function(x) sum(is.na(x)))
names(dataset)
summary(dataset)
#Agrupar likes em 4 ranges(ator1)
x0<-c(8)
clean0<-dataset[x0][complete.cases(dataset[x0]),]
rg1<-length(clean0[clean0>=0 & clean0<=35000])
rg2<-length(clean0[clean0>35000 & clean0<=70000])
rg3<-length(clean0[clean0>70000 & clean0<=95000])
rg4<-length(clean0[clean0>95000 & clean0<=140000])
ator1=data.frame(Distribuicao=c("0-35000","35000-70000","70000-95000","95000-140000") ,  Frequencia=c(rg1,rg2,rg3,rg4))
# Barplot

#Agrupar likes em 4 ranges(ator2)
x1<-c(25)
clean1<-dataset[x1][complete.cases(dataset[x1]),] #limpar NA
rg11<-length(clean1[clean1>=0 & clean1<=160000])
rg22<-length(clean1[clean1>160000 & clean1<=320000])
rg33<-length(clean1[clean1>320000 & clean1<=480000])
rg44<-length(clean1[clean1>480000 & clean1<=640000])

ator2=data.frame(Distribuicao=c("0-16","16-32","32-48","48-64") ,  Frequencia=c(rg11,rg22,rg33,rg44))
# Barplot


#Agrupar likes em 4 ranges(ator3)
x2<-c(6)
clean2<-dataset[x2][complete.cases(dataset[x2]),] #limpar NA
rg111<-length(clean2[clean2>=0 & clean2<=6000])
rg222<-length(clean2[clean2>6000 & clean2<=12000])
rg333<-length(clean2[clean2>12000 & clean2<=18000])
rg444<-length(clean2[clean2>18000 & clean2<=24000])
ator3=data.frame(Distribuicao=c("0-6","6-12","12-18","18-24") ,  Frequencia=c(rg11,rg22,rg33,rg44))
par(mfrow=c(2,2))
hist(dataset$imdb_score,main="Classificação dos filmes",xlab = "Score",ylab = "Frequencia",col = "orange")
ggplot(ator1, aes(x=Distribuicao, y=Frequencia)) + geom_bar(stat = "identity")
ggplot(ator2, aes(x=Distribuicao, y=Frequencia)) + geom_bar(stat = "identity")
ggplot(ator3, aes(x=name, y=value)) + geom_bar(stat = "identity")

#Correlaçao
x1<-c(5,6,8,25,26)
clust1<-dataset[x1]
correlacao=clust1[complete.cases(clust1),]
cor(correlacao, use="complete.obs", method="kendall")

#Fazer uma regressão



#Clustering1
x1<-c(5,6,8,25,26)
clust1<-dataset[x1]
clust1_clean<-clust1[complete.cases(clust1),]
scale_clust1<-scale(clust1_clean)
library(mclust)
fit<-Mclust(scale_clust1)
print(summary(fit)) # display the best model
plot(fit) # plot results 

1#Dataset sem NA
limpo<-dataset[complete.cases(dataset),]
summary(limpo)
#Vector(nomedirector,ator1,ator2,ator3,facebooktotallikes,imdbscore)
analis1<-dataset[c(2,11,7,15,14,26)]
head(analis1)
#Filmes com cotação superior a 5
maior5<-dataset[dataset$imdb.score>=5.0,]
nrow(maior5)
#Filmes com cotação inferior a 5
menor5<-dataset[dataset$imdb.score<5.0,]
nrow(menor5)
#Regreção
totalLikesFacebook<-dataset[c(4)]
imdbScore<-dataset[c(26)]
x<-as.vector(imdbScore[1])[,1]
y<-as.vector(totalLikesFacebook[1])[,1]
names(limpo)

str(limpo)
levels(limpo$genres)
qplot(data=limpo, x = limpo$imdb_score) +  scale_x_continuous(breaks = 0:10)



regre<-lm(x~y)
print(regre)
#Filmes Robert De Niro
robertDN<-dataset[dataset$actor.1.name=="Robert De Niro",]
hist(robertDN$imdb.score,main="Classificação dos filmes",xlab = "Score",ylab = "Frequency",col = "orange")
summary(robertDN)







