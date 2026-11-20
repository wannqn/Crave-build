#!/usr/bin/env bash

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/LineageOS/android.git -b lineage-24.0 --git-lfs --depth=1 || exit 1

rm -rf prebuilts/clang/host/linux-x86

# Build Sync
/opt/crave/resync.sh || exit 1

rm -rf device/xiaomi/renoir
rm -rf device/xiaomi/sm8350-common
rm -rf vendor/xiaomi/renoir
rm -rf vendor/xiaomi/sm8350-common
rm -rf kernel/xiaomi/sm8350
rm -rf device/xiaomi/renoir-kernel-6.18
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/camera

# Device configuration
git clone --depth 1 -b renoir-6.18 https://github.com/wannqn1/android_device_xiaomi_renoir.git device/xiaomi/renoir || exit 1

# Common device tree
git clone --depth 1 -b renoir-6.18 https://github.com/wannqn1/android_device_xiaomi_sm8350-common.git device/xiaomi/sm8350-common || exit 1

# Vendor tree
git clone --depth 1 -b lineage-24.0 https://github.com/wannqn1/proprietary_vendor_xiaomi_renoir.git vendor/xiaomi/renoir || exit 1
git -C vendor/xiaomi/renoir lfs pull || exit 1
git -C vendor/xiaomi/renoir lfs fsck || exit 1

# Common vendor tree
git clone --depth 1 -b lineage-24.0 https://github.com/wannqn1/proprietary_vendor_xiaomi_sm8350-common.git vendor/xiaomi/sm8350-common || exit 1

# Kernel prebuilt
git clone --depth 1 -b renoir-6.18 https://github.com/wannqn1/android_device_xiaomi_renoir-kernel-6.18.git device/xiaomi/renoir-kernel-6.18 || exit 1

# Hardware
git clone --depth 1 -b lineage-24.0 https://github.com/wannqn1/android_hardware_xiaomi.git hardware/xiaomi || exit 1

. build/envsetup.sh || exit 1
breakfast renoir user && m bacon
