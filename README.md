# gdal-scripts
Scripts for raster data using the OSGeo4W shell

## reproject
Reprojects all files in a folder to a destination EPSG, then applies LZW compression and saves tifs to a separate folder.
Reports unsuccessful attempts to the command line.

To be used in the OSGeo4W shell.

## interleave-batch
Used due to problem with FME Geotiff saving options.
Added to path and run from anywhere on network, with source and destination paths as inputs, eg "interleave.bat C:\Source\ C:\Dest\"

To be used in the OSGeo4W shell.
