---
title: "IRIS"
author: "Karan Singh Aulakh"
date: "15 January 2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. 

## R Packages

R is an open-source programming language, meaning that users can contribute
packages that make our lives easier, and we can use them for free. For this lab,
and many others in the future, we will use the following R packages:


- `dplyr`: for data wrangling
- `ggplot2`: for data visualization

```{r load-packages, message = FALSE}
library(datasets)
library(dplyr)
library(ggplot2)
library(scatterplot3d) 
library(rgl)
library(lattice)
```
You should have already installed these packages using commands like 
`install.packages` and `install_github`.

To load dataset Iris, we import package datasets which consists of Iris dataset for our experiments 

```{r load dataset iris from the datasets package }
data(iris)
```

We first of all investigate the dimensions of our dataset Iris
```{r dimensions of the dataset}
dim(iris)
```
The name of variables are returned by names().
```{r}
names(iris)
```


Function str() return the structure

```{r}
str(iris)
```

Function attributes() return the  attributes of data.
```{r}
attributes(iris)
```

we can examine the first n rows of data.Here we'll have a look at the first 10 rows of the data 

```{r}
iris[1:10, ]
```

In general, we can see the starting elements of the data sets using head() 
```{r}
head(iris,5)
```
In general, we can see the starting elements of the data sets using tail()
```{r}
tail(iris,10)
```
A random sample of the data can be retrieved with function sample() 
```{r}
samp<- sample(1:nrow(iris),8)
samp
iris[samp, ]
```

We can also retrieve the values of a single column. For example, the first 10 values of
Sepal.Length can be obtained in three different ways below.
```{r}
iris[1:10, "Sepal.Length"]
iris[1:10, 1]
iris$Sepal.Length[1:10]

```
Distribution of every numeric variable can be checked with function summary(), which returns
the minimum, maximum, mean, median, and the first (25%) and third (75%) quartiles.
```{r}
summary(iris)
```
For factors (or categorical variables), it shows the frequency of every level. In the result
below, we can see that each one of the three Species,setosa, versicolor and virginica, has 50
observations.

The mean, median and range can also be obtained respectively with functions with mean(),
median() and range(). Quartiles and percentiles are supported by function quantile() 
```{r}
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, c(0.1, 0.3, 0.65))

```

we check the variance of Sepal.Length with var()
```{r}
var(iris$Sepal.Length)
```

We can also check its distribution with histogram and density using functions hist() and density().
```{r}
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
density(iris$Sepal.Length)
plot(density(iris$Sepal.Length))

```
The frequency of a factor variable can be calculated with function table()
```{r}
table(iris$Species)
table(iris$Petal.Length)
```
The tables can be represented as a pie chart with pie() or a bar chart with barplot().

```{r}
pie(table(iris$Species))
barplot(table(iris$Species))
```
we calculate covariance and correlation between variables with cov()
and cor()
```{r}
cov(iris$Sepal.Length,iris$Sepal.Width)
cov(iris[1:4],)
cor(iris$Sepal.Length,iris$Sepal.Width)
cor(iris[1:4],)
```
We can use the aggregate function to compute the statistics of the different species of the dataset as well
```{r}
aggregate(Sepal.Length~Species, summary, data=iris)
aggregate(Petal.Length~Species, summary, data=iris)

```
We use function boxplot() to plot a box plot, also known as box-and-whisker plot, to show the median, first and third quartile of a distribution (i.e., the 50%, 25% and 75% points in cumulative distribution), and outliers. The bar in the middle is the median. The box shows the interquartile range (IQR), which is the range between the 75% and 25% observation.
```{r}

boxplot(Sepal.Length ~ Species, data=iris, xlab="Species", ylab="Sepal.Length")

boxplot(Sepal.Width ~ Species, data=iris, xlab="Species", ylab="Sepal.Width")

```
A scatter plot can be drawn for two numeric variables with plot() and with() as well.
```{r}
 with(iris, plot(Sepal.Length, Sepal.Width, col=Species, pch=as.numeric(Species)))
 ## same function as above
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species, pch=as.numeric(iris$Species))

```
When there are many points, some of them may overlap. We can use jitter() to add a small
amount of noise to the data before plotting.

```{r}
plot(jitter(iris$Sepal.Length), jitter(iris$Sepal.Width))
```

A smooth scatter plot can be plotted with function smoothScatter(), which a smoothed color
density representation of the scatterplot, obtained through a kernel density estimate.

```{r}
smoothScatter(iris$Sepal.Length, iris$Sepal.Width)
```
A matrix of scatter plots can be produced with function pairs(), where each sub figure is the
scatter plot of a pair of variables.
```{r}

pairs(iris)
```

A 3D scatterplot to assess the relation between multiple variables
```{r}
scatterplot3d(iris$Petal.Width, iris$Sepal.Length, iris$Sepal.Width)

```
```{r}
plot3d(iris$Petal.Width, iris$Sepal.Length, iris$Sepal.Width)
```
A heat map presents a 2D display of a data matrix, which can be generated with heatmap().We calculate the similarity between different flowers in the iris data with dist() and then plot it with a heat map.
```{r}
distMatrix <- as.matrix(dist(iris[,1:4]))
heatmap(distMatrix)
```
A level plot can be produced with function levelplot() in package lattice.
Function grey.colors() creates a vector of gamma-corrected gray colors.
```{r}
library(lattice)
levelplot(Petal.Width~Sepal.Length*Sepal.Width, iris,cuts=20,col.regions=grey.colors(10)[10:1]) 
                  

```

Contour plots can be plotted with contour() and filled.contour() in package graphics, and with contourplot() in package lattice.

```{r}
library(lattice)

filled.contour(volcano, color=terrain.colors, asp=1,plot.axes=contour(volcano, add=T))

```
Parallel plots with the relation among different species's charactertistics can be represented as below: 
```{r}
library(lattice)

parallelplot(~iris[1:4] | Species, data=iris)

```

The scatterplot that determines the relation between the sepal length and sepal width ordered by the different species of the dataset 
```{r}
library(ggplot2)
qplot(Sepal.Length, Sepal.Width, data=iris, facets=Species ~.)
## We could also apply this code for the required scatterplot
ggplot(aes(x=Sepal.Length,y=Sepal.Width),data=iris)+geom_point(color='Blue')+facet_wrap(~Species,ncol=1)
```

To build a decision tree for the iris data we use function ctree() in package
party.
In the package, function ctree() builds a decision tree, and predict() makes prediction for new data.

Before modeling, the iris data is split below into two subsets: training (70%) and test (30%).

The random seed is set to a fixed value below to make the results reproducible.


```{r}
str(iris)


set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

library(party)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)
# check the prediction
table(predict(iris_ctree), trainData$Species)
print(iris_ctree)

#plot for the iris tree
plot(iris_ctree)


```
