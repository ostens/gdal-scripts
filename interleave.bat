@echo off
setlocal enabledelayedexpansion

set par1=%1
set par2=%2

set oldpath=%par1%
set newpath=%par2%

set numFiles=0
for %%x in (%oldpath%*.tif) do (
  set file[!numFiles!]=%%~nfx
  set /a numFiles+=1
)

echo Number of files to interleave: %numFiles%
 
set count=1

for /f %%i in ('dir /B %oldpath%*.tif') do (
	echo Starting !count! of %numFiles%	
	gdal_translate -q -co "INTERLEAVE=PIXEL" -co "COMPRESS=LZW" "%oldpath%%%i" "%newpath%%%i"
	echo interleaved !count! of %numFiles%
	set /a count+=1
)
echo Finished.
