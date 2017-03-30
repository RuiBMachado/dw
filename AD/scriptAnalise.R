#Carregar dados do dataset
dataset <- read.csv("/Users/xavier/Downloads/movie_metadata.csv",header =TRUE,sep = ",")
#Visualizar numero de colunas
ncol(dataset) 
#Visualizar numero de linhas
nrow(dataset)
#Visualiar tipo de atributos
print(class(dataset$color))
print(class(dataset$director.name))
print(class(dataset$num.critic.for.reviews))
print(class(dataset$duration))
print(class(dataset$director.facebook.likes))
print(class(dataset$actor.3.facebook.likes))
print(class(dataset$actor.2.name))
print(class(dataset$actor.1.facebook.likes))
print(class(dataset$gross))
print(class(dataset$genres))
print(class(dataset$actor.1.name))
print(class(dataset$movie.title))
print(class(dataset$num.voted.users))
print(class(dataset$cast.total.facebook.likes))
print(class(dataset$actor.3.name))
print(class(dataset$facenumber.in.poster))
print(class(dataset$plot.keywords))
print(class(dataset$movie.imdb.link))
print(class(dataset$num.user.for.reviews))
print(class(dataset$language))
print(class(dataset$country))
print(class(dataset$content.rating))
print(class(dataset$budget))
print(class(dataset$title.year))
print(class(dataset$actor.2.facebook.likes))
print(class(dataset$imdb.score))
print(class(dataset$aspect.ratio))
print(class(dataset$movie.facebook.likes))
#Visualizar 6 primeiras linhas de dados
head(dataset)
#Visualizar os atributos
colnames(dataset)
#Visualizar substiruir atribitos  "_" por "."
colnames(dataset) <- gsub("_",".",tolower(colnames(dataset)))
colnames(dataset)
#visualizar analise de todos os dados
summary(dataset)
#Visualizar histograma de classificação dos filmes
hist(dataset$imdb.score,main="Classificação dos filmes",xlab = "Score",ylab = "Frequency",col = "orange")

