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

echo Number of files to interleave: %numFiles%
 
set count=1

REM gdal_translate switches : -q suppress output : LZW compression : INTERLEAVE pixel
for /f %%i in ('dir /B %oldpath%*.tif') do (
	echo Starting !count! of %numFiles%	
	gdal_translate -co "INTERLEAVE=PIXEL" -co "COMPRESS=LZW" "%oldpath%%%i" "%newpath%%%i"
	echo interleaved !count! of %numFiles%
	set /a count+=1
)
echo Finished.