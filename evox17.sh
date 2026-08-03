#!/bin/bash
set -e

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/Evolution-X/manifest -b cnb --git-lfs --depth=1

rm -rf prebuilts/clang/host/linux-x86

# Build Sync
/opt/crave/resync.sh

rm -rf device/xiaomi/renoir
rm -rf device/xiaomi/sm8350-common
rm -rf vendor/xiaomi/renoir
rm -rf vendor/xiaomi/sm8350-common
rm -rf kernel/xiaomi/sm8350
rm -rf hardware/xiaomi

# Device tree
git clone https://github.com/wannqn1/android_device_xiaomi_renoir_2 -b EvoX device/xiaomi/renoir

# Common device tree
git clone https://github.com/wannqn1/android_device_xiaomi_sm8350-common -b lineage-24.0 device/xiaomi/sm8350-common

# Kernel
git clone https://github.com/LineageOS/android_kernel_xiaomi_sm8350 -b lineage-23.2 kernel/xiaomi/sm8350

# Hardware
git clone https://github.com/Evolution-X-Devices/hardware_xiaomi -b cnb hardware/xiaomi

# Vendor tree
git clone https://github.com/TheMuppets/proprietary_vendor_xiaomi_renoir -b lineage-23.2 vendor/xiaomi/renoir

# Common vendor tree
git clone https://github.com/TheMuppets/proprietary_vendor_xiaomi_sm8350-common -b lineage-23.2 vendor/xiaomi/sm8350-common

. build/envsetup.sh
lunch lineage_renoir-cp2a-user
m evolution
