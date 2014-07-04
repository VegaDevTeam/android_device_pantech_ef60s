#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



-include device/pantech/msm8974-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/pantech/ef60s/BoardConfigVendor.mk

TARGET_BOOTLOADER_NAME		 := ef60s
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

TARGET_BOARD_INFO_FILE := device/pantech/ef60s/board-info.txt

BOARD_KERNEL_CMDLINE 	:= console=NULL,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=260M loglevel=0

BOARD_KERNEL_BASE 		:= 0x00000000
BOARD_KERNEL_PAGESIZE 	:= 2048
BOARD_MKBOOTIMG_ARGS 	:= --ramdisk_offset 0x1000000 --tags_offset 0x00000100 


BOARD_BOOTIMAGE_PARTITION_SIZE 		:= 33554432		#32M  boot
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 33554432		#32M  recovery
BOARD_SYSTEMIMAGE_PARTITION_SIZE 	:= 2566914048	#2.5G system
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 11757140992	#11G data
BOARD_FLASH_BLOCK_SIZE 				:= 131072

#TARGET_PREBUILT_KERNEL := device/pantech/ef60s/kernel

BOARD_KERNEL_SEPARATED_DT := true

ifneq ($(TARGET_PREBUILT_KERNEL),)
BOARD_CUSTOM_BOOTIMG_MK := device/pantech/ef60s/mkbootimg_twrp.mk
else
TARGET_KERNEL_SOURCE := kernel/pantech/ef60s
TARGET_KERNEL_CONFIG := cm_ef60s_tp20_user_defconfig

PANTECH_BOARD_VERSION := tp20

BOARD_CUSTOM_BOOTIMG_MK := device/pantech/ef60s/mkbootimg.mk

endif

#TARGET_KERNEL_CUSTOM_TOOLCHAIN:= linaro-4.8

#RIL
BOARD_RIL_CLASS := ../../../device/pantech/ef60s/ril/

# Init
TARGET_NO_INITLOGO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/ef60s/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/pantech/ef60s/bluetooth/libbt_vndcfg.txt

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/pantech/ef60s/init/init_ef60s.c

#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 27

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/msm_dwc3/f9200000.dwc3/gadget/lun%d/file

#USE_SET_METADATA := false

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Revcovery
BOARD_HAS_NO_SELECT_BUTTON 		:= true
BOARD_SUPPRESS_EMMC_WIPE 		:= true
BOARD_HAS_LARGE_FILESYSTEM 		:= true
TARGET_USERIMAGES_USE_EXT4 		:= true
BOARD_RECOVERY_ALWAYS_WIPES 	:= true
BOARD_RECOVERY_HANDLES_MOUNT 	:= true
BOARD_USES_MMCUTILS := true


BOARD_RECOVERY_SWIPE 				:= true
RECOVERY_FSTAB_VERSION 				:= 2
TARGET_RECOVERY_FSTAB 				:= device/pantech/ef60s/ramdisk/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT 		:= "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT 		:= \"roboto_23x41.h\"
#TARGET_RECOVERY_INITRC 				:= device/pantech/ef60s/recovery/init.twrp.rc

TW_CUSTOM_THEME 					:= device/pantech/ef60s/recovery/res


DEVICE_RESOLUTION 					:= 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH 	:= true
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
TW_FLASH_FROM_STORAGE 				:= true
RECOVERY_SDCARD_ON_DATA 			:= true
#TW_HAS_NO_RECOVERY_PARTITION 		:= true
TW_FLASH_FROM_STORAGE 				:= true
TW_EXTERNAL_STORAGE_PATH 			:= "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT 	:= "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE 		:= true
# TW_INCLUDE_CRYPTO 				:= true
TW_INCLUDE_JB_CRYPTO 				:= true
TW_CRYPTO_FS_TYPE 					:= "ext4"
TW_CRYPTO_REAL_BLKDEV 				:= "/dev/block/platform/msm_sdcc.1/by-name/userdata"
TW_CRYPTO_MNT_POINT 				:= "/data"
TW_CRYPTO_FS_OPTIONS 				:= "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_KEY_LOC 					:= "/persist/metadata"
TW_INCLUDE_FUSE_EXFAT 				:= true
#TW_BOARD_CUSTOM_GRAPHICS 			:= ../../../device/pantech/ef60s/recovery/twrpgraphics.c
TW_BRIGHTNESS_PATH 					:= /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS 					:= 100

TW_NO_SCREEN_TIMEOUT 				:= true

TARGET_RECOVERY_QCOM_RTC_FIX 		:= true
BOARD_SUPPRESS_SECURE_ERASE 		:= true
#TW_TARGET_USES_QCOM_BSP				:= true

