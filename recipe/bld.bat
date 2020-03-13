set
set QT_BASE_X64="C:\Qt\5.14\msvc2017_64"
set PYTHON3_BASE_X64="C:\Miniconda36-x64"
dir
msbuild launcher\NionUILauncher.vcxproj
dir dist\
powershell "Get-ChildItem -Include *.pdb -Recurse | foreach { $_.Delete() }"
powershell "Get-ChildItem launcher\x64\Release\imageformats -Include *d.dll -Recurse | foreach { $_.Delete() }"
%PYTHON% setup.py bdist_wheel
dir dist\
%PYTHON% -m pip install --no-deps  --ignore-installed dist\nionswift_tool-%PKG_VERSION%-cp36.cp37.cp38-none-win_amd64.whl -vv
