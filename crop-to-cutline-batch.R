setwd("Q:/Erin/BSH-new-updated/new-addition/Reprojected")
install.packages("gdalUtils")
install.packages("raster")
install.packages("rgdal")
install.packages("sf")
install.packages("dplyr")
install.packages("foreign")

shape <- st_read('cutlines.shp')
database <- read.dbf('cutlines.dbf')

for (i in 1:nrow(database)){
  chart <- sapply(database[i,"chart"], as.character)
  plan <- sapply(database[i,"plan"], as.character)
  gdalwarp(srcfile=chart, dstfile=plan, srcnodata = "-9999", dstnodata = "-9999", of = "GTiff", csql = paste0("select * from cutlines where plan='",plan,"'"), cutline = "cutlines.shp", crop_to_cutline = TRUE, overwrite=TRUE, verbose=TRUE)
}




