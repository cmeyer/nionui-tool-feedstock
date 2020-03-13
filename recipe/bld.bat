set QT_BASE_X64="C:\Qt\5.14\msvc2017_64"
set PYTHON3_BASE_X64="C:\Miniconda36-x64"
dir
msbuild nionui-tool-0.4.0\launcher\NionUILauncher.vcxproj
REM ps: Get-ChildItem -Include *.pdb -Recurse | foreach { $_.Delete() }  # [win]
REM ps: Get-ChildItem launcher\x64\Release\imageformats -Include *d.dll -Recurse | foreach { $_.Delete() }  # [win]
%PYTHON3_BASE_X64%\python.exe setup.py bdist_wheel
%PYTHON3_BASE_X64%\python.exe -m pip install --no-deps  --ignore-installed dist\\{{ fn }} -vv
