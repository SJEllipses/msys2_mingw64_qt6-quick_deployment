#!/usr/bin/bash

set -e

EXE_NAME="demo.exe"

rm -rf cmake_build

mkdir -p cmake_build
cd cmake_build

cmake -G "MinGW Makefiles" .. && echo "[SUCCESS] cmake configured."
echo
mingw32-make && echo "[SUCCESS] make done."
echo

mkdir - p deploy
cd deploy

cp "../$EXE_NAME" .

export PATH="/mingw64/share/qt6/bin:$PATH"
windeployqt6 --release --qmldir ../../qml "./$EXE_NAME" && echo "[SUCCESS] windeployqt6 done."
echo

set +e

SRC="/mingw64/bin"

DLLS=(
    libb2-1.dll
    libbrotlicommon.dll
    libbrotlidec.dll
    libbz2-1.dll
    libdouble-conversion.dll
    libfreetype-6.dll
    libgcc_s_seh-1.dll
    libglib-2.0-0.dll
    libgraphite2.dll
    libharfbuzz-0.dll
    libicudt78.dll
    libicuin78.dll
    libicuuc78.dll
    libiconv-2.dll
    libintl-8.dll
    libmd4c.dll
    libpcre2-16-0.dll
    libpcre2-8-0.dll
    libpng16-16.dll
    libstdc++-6.dll
    libwinpthread-1.dll
    libzstd.dll
    zlib1.dll
)

for dll in "${DLLS[@]}"; do
    if cp "$SRC/$dll" "./" 2>/dev/null; then
        echo "[SUCCESS] Copied: $dll"
    else
        echo "[ERROR] Failed to copy: $dll"
        exit 1
    fi
done

echo
cat > qt.conf <<EOF
[Paths]
QmlImports=./qml
Plugins=./
EOF
echo "[SUCCESS] qt.conf created."

echo
echo "[SUCCESS] Deployment of '$EXE_NAME' done."