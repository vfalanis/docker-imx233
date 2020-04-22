docker-imx233
=================

## About

This repo contains an Ubuntu-based environment for building NXP i.MX233 Linux images.

## Contents

- gcc-arm-none-eabi toolchain version 4.7
- NXP elftosb2 tool
- imx-bootlets
- Linux 4.16.x kernel source
- buildroot

## Use
The container includes kernel source version 4.16.x in /root/linux-stable directory.

```
$ cd linux-stable
```

Configuring the kernel:

a) Use existing mxs_defconfig
```
$ make ARCH=arm CROSS_COMPILE=arm-none-eabi mxs_defconfig
```
b) (Optional) run menuconfig to make some changes to the kernel configuration
```
$ make ARCH=arm CROSS_COMPILE=arm-none-eabi menuconfig
```

Compiling kernel and modules:
```
$ make ARCH=arm CROSS_COMPILE=arm-none-eabi zImage modules
```

Compiling olinuxino device tree:
```
$ make ARCH=arm CROSS_COMPILE=arm-none-eabiimx23-olinuxino.dtb
```

Join zImage and DTB:
```
$ cat arch/arm/boot/zImage arch/arm/boot/imx23-olinuxino.dtb > arch/arm/boot/zImage_dtb
```

Build the bootlets:
```
$ cd /root/imx-bootlets
```

First do a clean
```
$ make CROSS_COMPILE=armnone-eabi- clean
```

Then, build the bootlets:
```
$ ln -s ../linux-stable /arch/arm/boot/zImage_dtb ./zImage
 
$ make CROSS_COMPILE=arm-none-eabi
```

To flash to SD card:
```
$ sudo dd if=sd_mmc_bootstream.raw of=/dev/sdXY 
```
where X is the  letter for your sd or mmc device (to check, do a ls /dev/sd*) and Y is the partition number for the bootstream

Adding a RootFS:

TBC

## To Do
- Add yocto build environment

