setwd("Q:/Erin/BSH-new-updated/new-addition/reprojected/georef")
install.packages("rgdal")
install.packages("sp")
install.packages("raster")
install.packages("maptools")
install.packages("gdalUtils")
install.packages("data.table")
install.packages("foreign")

P4S.latlon <- CRS("+proj=longlat +datum=WGS84")
shape <- readOGR("BSH1_NewAdditions.shp")
database <- read.dbf('BSH1_NewAdditions.dbf')

shape2 <- spTransform(shape, CRS("+init=epsg:3857"))

ext <- t(sapply(1:nrow(shape2), function(i) as.vector(extent(shape2[i,]))))
colnames(ext) <- c('xmin', 'xmax', 'ymin', 'ymax')
ext2 <- ext[,c(1,4,2,3)]

for (i in 1:nrow(database)){
  chart <- sapply(database[i,"location"], as.character)
  gdal_translate(chart, paste0("reproj",chart), of = "GTiff", a_srs = "EPSG:3857", a_ullr = c(ext2[i,]), a_nodata = "-9999")
}

