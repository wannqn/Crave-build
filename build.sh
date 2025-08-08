# ROM Build commands for Mi 11 Lite 5G renoir

# Remove local_manifests

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

# Repo sync
/opt/crave/resync.sh

# Remove old device specific repos
rm -rf device/xiaomi/sm8350-common
rm -rf device/xiaomi/renoir
rm -rf vendor/xiaomi/sm8350-common
rm -rf vendor/xiaomi/renoir
rm -rf vendor/bcr;
rm -rf kernel/xiaomi/sm8350
rm -rf hardware/xiaomi

# Clone new device specific repos

# Common deivce tree
git clone https://github.com/wannqn/device_xiaomi_sm8350-common device/xiaomi/sm8350-common

# Device configuration
git clone https://github.com/wannqn/android_device_xiaomi_renoir -b 16 device/xiaomi/renoir

# Common vendor tree
git clone https://github.com/wannqn/vendor_xiaomi_sm8350-common -b 16 vendor/xiaomi/sm8350-common

# Vendor tree
git clone https://github.com/wannqn/proprietary_vendor_xiaomi_renoir -b 16 vendor/xiaomi/renoir

# Vendor bcr
git clone https://github.com/RobertGarciaa/vendor_bcr vendor/bcr

# Kernel Tree
git clone https://github.com/wannqn/android_kernel_xiaomi_sm8350 -b 16 kernel/xiaomi/sm8350

# Hardware
git clone https://github.com/WitAqua-Devices/hardware_xiaomi -b 16.0 hardware/xiaomi

. build/envsetup.sh
lunch lineage_renoir-bp2a-user && m evolution
