# install libraries
install.packages("rgdal")
install.packages("raster")

#load libraries
library(raster)
library(rgdal)

#set wd
setwd("Q:/Erin/BSH-new-updated/new-addition")

#load raster into R
x <- raster("BSH1110-0-2018-02.tif")

#View structure
x

#plot raster
plot(x,
     main="BSH plot")

#extract crs from raster
crs(x)