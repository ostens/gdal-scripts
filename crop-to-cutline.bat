echo off
gdalwarp -cutline "cutline.shp" -csql "select * from cutline where location='1120-B'" -crop_to_cutline -of GTiff -srcnodata -9999 -dstnodata -9999 Karte_1120_2018-02_Geo.tif output.tif