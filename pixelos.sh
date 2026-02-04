rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs

rm -rf prebuilts/clang/host/linux-x86

# Build Sync
/opt/crave/resync.sh

rm -rf device/xiaomi/renoir
rm -rf device/xiaomi/sm8350-common
rm -rf vendor/xiaomi/renoir
rm -rf vendor/xiaomi/sm8350-common
rm -rf kernel/xiaomi/sm8350
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/camera

# Device configuration
git clone https://github.com/wannqn/android_device_xiaomi_renoirv2 -b sixteen device/xiaomi/renoir

# Common deivce tree
git clone https://github.com/RobertGarciaa/device_xiaomi_sm8350-common -b sixteen device/xiaomi/sm8350-common

# Vendor tree
git clone https://github.com/RobertGarciaa/proprietary_vendor_xiaomi_renoir -b sixteen vendor/xiaomi/renoir

# Vendor bcr
git clone https://github.com/RobertGarciaa/vendor_bcr -b main vendor/bcr

# Common vendor tree
git clone https://github.com/RobertGarciaa/vendor_xiaomi_sm8350-common -b sixteen vendor/xiaomi/sm8350-common

# Kernel Tree
git clone https://github.com/RobertGarciaa/android_kernel_xiaomi_sm8350 -b sixteen_ksunext kernel/xiaomi/sm8350

# Hardware
git clone https://github.com/RobertGarciaa/hardware_xiaomi -b sixteen hardware/xiaomi

# Miui Camera
git clone https://github.com/wannqn/vendor_xiaomi_camera -b Renoir vendor/xiaomi/camera

. build/envsetup.sh
lunch aosp_renoir-userdebug && mka bacon
