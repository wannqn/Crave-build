#!/bin/bash
set -e

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs --no-clone-bundle

rm -rf prebuilts/clang/host/linux-x86

# Build Sync
/opt/crave/resync.sh

rm -rf device/xiaomi/renoir
rm -rf device/xiaomi/sm8350-common
rm -rf vendor/xiaomi/renoir
rm -rf vendor/xiaomi/sm8350-common
rm -rf kernel/xiaomi/sm8350
rm -rf vendor/bcr
rm -rf hardware/dolby

# Device tree
git clone https://github.com/wannqn1/android_device_xiaomi_renoir -b sixteen device/xiaomi/renoir

# Common device tree
git clone https://github.com/wannqn1/device_xiaomi_sm8350-common -b sixteen device/xiaomi/sm8350-common

# Vendor tree
git clone https://github.com/wannqn1/proprietary_vendor_xiaomi_renoir -b sixteen vendor/xiaomi/renoir

# Common vendor tree
git clone https://github.com/wannqn1/vendor_xiaomi_sm8350-common -b sixteen vendor/xiaomi/sm8350-common

# Kernel
git clone https://github.com/wannqn1/android_kernel_xiaomi_sm8350 -b sixteen kernel/xiaomi/sm8350
chmod +x kernel/xiaomi/sm8350/ksun.sh
bash kernel/xiaomi/sm8350/ksun.sh

# BCR
git clone https://github.com/RobertGarciaa/vendor_bcr -b main vendor/bcr

# Dolby
git clone https://github.com/RobertGarciaa/hardware_dolby -b sony-1.4_xiaomi hardware/dolby

. build/envsetup.sh
brunch renoir
