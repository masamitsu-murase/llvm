
md build
md install

cd tools
git clone https://github.com/masamitsu-murase/clang.git --depth 5 -b build_check
if ERRORLEVEL 1 exit /b 1

cd ..

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86
if ERRORLEVEL 1 exit /b 1


cd build

cmake -G "Visual Studio 14 2015" .. -DCMAKE_INSTALL_PREFIX=..\install -DCMAKE_DEBUG_POSTFIX=d -DLLVM_TARGETS_TO_BUILD=X86
if ERRORLEVEL 1 exit / b 1

cmake --build . --config Release
tree

cmake --build . --config Release --target install
if ERRORLEVEL 1 exit / b 1
