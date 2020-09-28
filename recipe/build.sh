#!/bin/bash -x

if [[ "$target_platform" == linux* ]]; then
  # set
  # pwd
  # ls -R .
  # cp ${RECIPE_DIR}/CMakeLists.txt launcher/CMakeLists.txt
  pushd launcher
  # conda info
  # conda list
  # conda env list
  # "${PYTHON}" --version
  # default python is from the activate conda environment which is not the build environment; specify python to cmake
  # sudo apt-get -y install libxfixes3
  # sudo apt-get install qtbase5-dev
  # sudo apt-get install libqt5svg5-dev
  cmake CMakeLists.txt -DPython3_EXECUTABLE="$PYTHON" -DUSE_PYTHON_QT=OFF
  cmake --build . --config Release
  # ls -R .
  # readelf -d build/NionUILauncher
  # readelf -dr build/NionUILauncher | grep QAbstractItem
  mkdir -p linux
  mv build linux/x64
  popd
  "${PYTHON}" -m pip install --no-deps --ignore-installed .
fi

if [[ "$target_platform" == "osx-64" ]]; then
  # set
  # pwd
  # ls -R .
  # cp ${RECIPE_DIR}/CMakeLists.txt launcher/CMakeLists.txt
  pushd launcher
  # conda info
  # conda list
  # conda env list
  # "${PYTHON}" --version
  # default python is from the activate conda environment which is not the build environment; specify python to cmake
  /usr/local/bin/brew install qt5
  cmake CMakeLists.txt -DPython3_EXECUTABLE="$PYTHON" -DQt5_DIR=/usr/local/opt/qt/lib/cmake/Qt5
  cmake --build . --config Release
  # ls -R .
  mkdir -p build/Release
  mv build/*.app build/Release
  popd
  # ls -R .
  "${PYTHON}" -m pip install --no-deps --ignore-installed .
fi
