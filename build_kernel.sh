#!/bin/bash

set -e

KERNEL_DIR=$(pwd)
OUT_DIR=$KERNEL_DIR/out
GCC_64=$KERNEL_DIR/../toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
GCC_32=$KERNEL_DIR/../toolchain/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
CLANG_PATH=$KERNEL_DIR/../toolchain/clang/host/linux-x86/clang-r383902/bin
export ARCH=arm64
export SUBARCH=arm64
export PATH=$CLANG_PATH:$PATH

make -j12 O=$OUT_DIR ARCH=arm64 CROSS_COMPILE=$GCC_64 CROSS_COMPILE_ARM32=$GCC_32 CC=clang CLANG_TRIPLE=aarch64-linux-gnu- gta4l_eur_open_defconfig
make -j12 O=$OUT_DIR ARCH=arm64 CROSS_COMPILE=$GCC_64 CROSS_COMPILE_ARM32=$GCC_32 CC=clang CLANG_TRIPLE=aarch64-linux-gnu-

cp $OUT_DIR/arch/arm64/boot/Image $KERNEL_DIR/arch/arm64/boot/Image
cp $OUT_DIR/arch/arm64/boot/Image $KERNEL_DIR/arch/arm64/boot/Image.gz
