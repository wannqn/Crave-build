rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

rm -rf prebuilts/clang/host/linux-x86

# Build Sync
/opt/crave/resync.sh

rm -rf device/xiaomi/renoir
rm -rf device/xiaomi/sm8350-common
rm -rf vendor/xiaomi/renoir
rm -rf vendor/xiaomi/sm8350-common
rm -rf kernel/xiaomi/sm8350
rm -rf hardware/xiaomi

# Device configuration
git clone https://github.com/wannqn/android_device_xiaomi_renoir -b EvoX device/xiaomi/renoir

# Common deivce tree
git clone https://github.com/TheMysticle/android_device_xiaomi_sm8350-common -b lineage-23.0 device/xiaomi/sm8350-common

# Vendor tree
git clone https://github.com/TheMysticle/proprietary_vendor_xiaomi_renoir -b lineage-23.0 vendor/xiaomi/renoir

# Common vendor tree
git clone https://github.com/TheMysticle/proprietary_vendor_xiaomi_sm8350-common -b lineage-23.0 vendor/xiaomi/sm8350-common

# Kernel Tree
git clone https://github.com/TheMysticle/android_kernel_xiaomi_sm8350 -b lineage-23.0 kernel/xiaomi/sm8350

# Hardware
git clone https://github.com/WitAqua-Devices/hardware_xiaomi -b 16.0 hardware/xiaomi

. build/envsetup.sh
lunch lineage_renoir-user && m evolution
