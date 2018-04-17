echo off
set "plan=BSH1120-1-2018-02.tif"
gdalwarp -cutline "cutlines.shp" -csql "select * from cutlines where location='%plan%'" -crop_to_cutline -of GTiff -srcnodata -9999 -dstnodata -9999 BSH1120-0-2018-02.tif %plan%
