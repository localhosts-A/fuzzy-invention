#!/bin/bash

args="-j$(nproc --all) \
	O=out \
	ARCH=arm64 \
	CLANG_TRIPLE=aarch64-linux-gnu- \
	CROSS_COMPILE=~/clang/bin/aarch64-linux-gnu- \
	CC=~/clang/bin/clang \
	CROSS_COMPILE_ARM32=~/clang/bin/arm-linux-gnueabi- "
	make ${args} polaris_defconfig
	make ${args}

echo "桜 已经编译完成啦!"
echo "Sakura kernel has been compiled successfully! "
echo "                                              "

echo "打包内核ing "
echo "Packing the kernel..."

rm -rf anykernel3/Image.gz-dtb
cp out/arch/arm64/boot/Image.gz-dtb anykernel3
cd anykernel3
rm *.zip
zip -q -r Sakura.zip *

echo "                          "
echo "打包完成啦！快刷入试试吧！"
echo "Packing done "