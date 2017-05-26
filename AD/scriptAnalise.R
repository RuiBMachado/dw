install.packages('ggplot2')
install.packages('ggthemes', dependencies = TRUE) 
library(ggthemes) 
library(ggplot2)
#Carregar dados do dataset
dataset <- read.csv("/Users/xavier/Downloads/movie_metadata.csv",header =TRUE,sep = ",")
dim(dataset)
sapply(dataset,function(x) sum(is.na(x)))
names(dataset)
summary(dataset)
par(mfrow=c(1,4))
barplot(table(dataset$actor_1_facebook_likes), ylab='Total de likes do actor principal',col ='red')
barplot(table(dataset$actor_2_facebook_likes), ylab='Total de likes do actor secundario',col ='azure')
barplot(table(dataset$actor_3_facebook_likes), ylab='Total de likes do actor principal',col ='cyan')

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
#Visualizar histograma de classificação dos filmes
hist(dataset$imdb.score,main="Classificação dos filmes",xlab = "Score",ylab = "Frequency",col = "orange")
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







