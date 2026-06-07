rm -rf .repo/local_manifests
repo init -u https://gitlab.com/OrangeFox/sync.git -b 12.1
/opt/crave/resync.sh

rm -rf device/xiaomi/renoir
git clone https://github.com/wannqn/twrp_device_xiaomi_renoir -b ofox-12.1 device/xiaomi/renoir

export FOX_BUILD_DEVICE=renoir
export LC_ALL="C.UTF-8"
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_VIRTUAL_AB_DEVICE=1
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
export FOX_ENABLE_APP_MANAGER=1
export FOX_DELETE_AROMAFM=0
export FOX_USE_NANO_EDITOR=1
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G

source build/envsetup.sh
lunch twrp_renoir-eng
mka adbd bootimage
