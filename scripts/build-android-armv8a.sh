#!/bin/sh
git submodule init && git submodule update
sudo apt-get update
sudo apt-get install -f -y libopenal-dev g++-multilib gcc-multilib libpng-dev libjpeg-dev libfreetype6-dev libfontconfig1-dev libcurl4-gnutls-dev libsdl2-dev zlib1g-dev libbz2-dev libedit-dev
wget https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip -nc -q    
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz -nc -q
unzip -q android-ndk-r10e-linux-x86_64.zip
tar -xf clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
export ANDROID_NDK_HOME=$PWD/android-ndk-r10e/
export PATH=$PWD/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-16.04/bin:$PATH
./waf configure -T release --android=aarch64,host,21 --togles --disable-warns -8 --prefix=./built-libs --build-game=iasw &&
./waf build
./waf install --strip
