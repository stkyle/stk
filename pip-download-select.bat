@ECHO OFF
:: 
::

SET VERBOSE=
SET DEST=-d C:\Users\skyle\Downloads\
SET FLAGS=--only-binary=:all:
SET LOG=--log C:\Users\skyle\Downloads\pip.log
SET /a DOWNLOAD_LIMIT=0
set requirements=%1
echo Processing %requirements%



setlocal enableextensions enabledelayedexpansion
set /a count = 1
for /F "eol=# tokens=*" %%A in (%requirements%) do (
if !count!==%DOWNLOAD_LIMIT% (
    echo "The download limt has been reached. Aborting." 
    goto :eof
)
echo  !count! package: %%A
set /a count+=1
CALL :pipdownload %%A
)
endlocal


:pipdownload
SETLOCAL
SET _package=%1
pip download %VERBOSE% %DEST% %FLAGS% --python-version=2 --platform=manylinux1_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=manylinux1_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=manylinux1_x86_64 %_package%
:: 
pip download %VERBOSE% %DEST% %FLAGS% --python-version=2  --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3  --platform=macosx-10_10_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=macosx-10_10_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=macosx-10_10_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=macosx-10_10_x86_64 %_package%
:: 
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=2  --platform=win32 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=win32 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3  --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=win32 %_package%
:: 
pip download %VERBOSE% %DEST% %FLAGS% --python-version=2  --platform=win_amd64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=win_amd64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3  --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=win_amd64 %_package%
:: 
pip download %VERBOSE% %DEST% %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%

ENDLOCAL & SET _result=0

:exit
EXIT /B 0



EXIT /B 0


    --only-binary=:all: \
    --platform macosx-10_10_x86_64 \
    --python-version 27 \
    --implementation cp \
    SomePackage
# The wheel filename is {distribution}-{version}(-{build tag})?-{python tag}-{abi tag}-{platform tag}.whl.
# Platforms:
# - win32
# - linux_i386
# - linux_x86_64
# - macosx-10_9_x86_64
# - macosx-10_8_x86_64
# - macosx-10_8_intel
# - any
# - linux_x86_64
