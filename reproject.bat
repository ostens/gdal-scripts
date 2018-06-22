@echo off

REM Variables expanded at execution time rather than parse time
setlocal enabledelayedexpansion

REM Source and destination folders
set oldpath=C:\
set newpath=C:\

REM count files
set numFiles=0
for %%x in (%oldpath%*.tif) do (
  set file[!numFiles!]=%%~nfx
  set /a numFiles+=1
)

echo Number of files to reproject: %numFiles%
 
set count=1

REM Reproject
REM gdal_translate switches : -q suppress output : LZW compression
for /f %%i in ('dir /B %oldpath%*.tif') do (
	echo Starting !count! of %numFiles%	
	gdalwarp -t_srs EPSG:3857 -q "%oldpath%%%i" "%newpath%temp%%i"	
	if errorlevel 1 (
		echo The file %oldpath%%%i is not georeferenced and therefore cannot be reprojected
	) else (
		gdal_translate -q -co "COMPRESS=LZW" "%newpath%temp%%i" "%newpath%%%i"
		gdalmanage delete "%newpath%temp%%i"	
		echo Reprojected !count! of %numFiles%
	) 
	set /a count+=1
)
echo Finished.
