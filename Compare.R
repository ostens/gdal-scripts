install.packages("raster")
install.packages("rgdal")

colfunc <- colorRampPalette(c('red','white','green'))
setwd("Q:/Erin/R")

filesnew <- list.files('./new', pattern = "\\.tif$")
filesold <- list.files('./old', pattern = "\\.tif$")
list <- intersect(filesold, filesnew)

pdf("NL1800.pdf")
for (i in (list))  {
  tryCatch({
    rast1 <- raster(paste('./old/', i, sep=""))
    rast2 <- raster(paste('./new/', i, sep=""))
    ex1 <- extent(rast1)
    ex2 <- extent(rast2)
    r1 <- crop(rast1, ex2)
    r2 <- crop(rast2, ex1)
    filename <- paste(names(rast1), ".pdf", sep="")
    diff <- r1-r2
    print(plot(diff,
               col = colfunc(100),
               main = names(rast1)))
    print(paste('created file', i, sep=""))
  }, error=function(e){cat("ERROR : ", i, " had an issue with comparison: ", conditionMessage(e), "\n")})
}
dev.off()
