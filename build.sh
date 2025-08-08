# ROM Build commands for Mi 11 Lite 5G renoir

# Remove local_manifests

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs

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
git clone https://github.com/wannqn/android_device_xiaomi_renoir device/xiaomi/renoir

# Common vendor tree
git clone https://github.com/RobertGarciaa/vendor_xiaomi_sm8350-common vendor/xiaomi/sm8350-common

# Vendor tree
git clone https://github.com/RobertGarciaa/proprietary_vendor_xiaomi_renoir vendor/xiaomi/renoir

# Vendor bcr
git clone https://github.com/RobertGarciaa/vendor_bcr vendor/bcr

# Kernel Tree
git clone https://github.com/RobertGarciaa/android_kernel_xiaomi_sm8350 kernel/xiaomi/sm8350

# Hardware
git clone https://github.com/RobertGarciaa/hardware_xiaomi hardware/xiaomi

. build/envsetup.sh
lunch lineage_renoir-bp1a-user && mka bacon
