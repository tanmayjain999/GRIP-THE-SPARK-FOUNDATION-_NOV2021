

## loading Data 
data(iris)

#structuring Data set 
str(iris)

#loading packages 
library(cluster)
plot(iris)
head(iris)

#removing labels from given Data set 
iris_1=iris[,-5]

#fitting K means Clustering 
set.seed(200)
k.cluster=kmeans(iris_1,centers=3,nstart=20)
k.cluster

# cluster Identification 
k.cluster$cluster

# confusion matrix
cmat=table(iris$Species,k.cluster$cluster)
cmat

# model Evaluation and visualisation 
plot(iris_1[c("Sepal.Length","Sepal.Width")],
     col=k.cluster$cluster,
     main = "K means Clustering with 3 clusters")


# plotting cluster Centers 

k.cluster$centers
k.cluster$centers[,c("Sepal.Length","Sepal.Width")]
plot(iris_1[c("Sepal.Length","Sepal.Width")],
     col=k.cluster$cluster,
     main = "K means Clustering with 3 clusters")+
  points(k.cluster$centers[,c("Sepal.Length","Sepal.Width")],
         col=1:3 , pch= 10 , cex = 5)

# visualising clusters

k=k.cluster$cluster
clusplot(iris_1[,c("Sepal.Length","Sepal.Width")],
         k,
         lines= 0,
         shade=TRUE,
         color = TRUE,
         labels=2,
         plotchar=FALSE,
         span=TRUE,
         main=paste("Clusters of IRIS Data Set"),
         xlab="Sepal.Length",
         ylab="Sepal.Width")
