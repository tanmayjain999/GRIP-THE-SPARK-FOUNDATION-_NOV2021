> data(iris)
> 
> #structuring Data set 
> str(iris)
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
> 
> #loading packages 
> library(cluster)
> plot(iris)
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> 
> #removing labels from given Data set 
> iris_1=iris[,-5]
> 
> #fitting K means Clustering 
> set.seed(200)
> k.cluster=kmeans(iris_1,centers=3,nstart=20)
> k.cluster
K-means clustering with 3 clusters of sizes 38, 50, 62

Cluster means:
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1     6.850000    3.073684     5.742105    2.071053
2     5.006000    3.428000     1.462000    0.246000
3     5.901613    2.748387     4.393548    1.433871

Clustering vector:
  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
 [33] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 1 3 3 3 3 3 3 3 3 3 3 3
 [65] 3 3 3 3 3 3 3 3 3 3 3 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
 [97] 3 3 3 3 1 3 1 1 1 1 3 1 1 1 1 1 1 3 3 1 1 1 1 3 1 3 1 3 1 1 3 3
[129] 1 1 1 1 1 3 1 1 1 1 3 1 1 1 3 1 1 1 3 1 1 3

Within cluster sum of squares by cluster:
[1] 23.87947 15.15100 39.82097
 (between_SS / total_SS =  88.4 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"    
[5] "tot.withinss" "betweenss"    "size"         "iter"        
[9] "ifault"      
> 
> # cluster Identification 
> k.cluster$cluster
  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
 [33] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 1 3 3 3 3 3 3 3 3 3 3 3
 [65] 3 3 3 3 3 3 3 3 3 3 3 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
 [97] 3 3 3 3 1 3 1 1 1 1 3 1 1 1 1 1 1 3 3 1 1 1 1 3 1 3 1 3 1 1 3 3
[129] 1 1 1 1 1 3 1 1 1 1 3 1 1 1 3 1 1 1 3 1 1 3
> 
> # confusion matrix
> cmat=table(iris$Species,k.cluster$cluster)
> cmat
            
              1  2  3
  setosa      0 50  0
  versicolor  2  0 48
  virginica  36  0 14
> 
> # model Evaluation and visualisation 
> plot(iris_1[c("Sepal.Length","Sepal.Width")],
+      col=k.cluster$cluster,
+      main = "K means Clustering with 3 clusters")
> 
> 
> # plotting cluster Centers 
> 
> k.cluster$centers
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1     6.850000    3.073684     5.742105    2.071053
2     5.006000    3.428000     1.462000    0.246000
3     5.901613    2.748387     4.393548    1.433871
> k.cluster$centers[,c("Sepal.Length","Sepal.Width")]
  Sepal.Length Sepal.Width
1     6.850000    3.073684
2     5.006000    3.428000
3     5.901613    2.748387
> plot(iris_1[c("Sepal.Length","Sepal.Width")],
+      col=k.cluster$cluster,
+      main = "K means Clustering with 3 clusters")+
+   points(k.cluster$centers[,c("Sepal.Length","Sepal.Width")],
+          col=1:3 , pch= 10 , cex = 5)
integer(0)
> 
> # visualising clusters
> 
> k=k.cluster$cluster
> clusplot(iris_1[,c("Sepal.Length","Sepal.Width")],
+          k,
+          lines= 0,
+          shade=TRUE,
+          color = TRUE,
+          labels=2,
+          plotchar=FALSE,
+          span=TRUE,
+          main=paste("Clusters of IRIS Data Set"),
+          xlab="Sepal.Length",
+          ylab="Sepal.Width")
> 
