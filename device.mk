#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, vendor/pantech/ef60s/ef60s-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/pantech/ef60s/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := A900L,A900S,A900K,IM-A900L,IM-A900K,IM-A900S,ef62l,ef60s,ef61k

ifneq ($(TARGET_PREBUILT_KERNEL),)
	PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel \
    $(LOCAL_PATH)/dt.img:dt.img
endif


# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/fstab.qcom:root/fstab.qcom \
	$(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
	$(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
	$(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
	$(LOCAL_PATH)/ramdisk/init.pantech.usb.rc:root/init.pantech.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.pantech.usb.sh:root/init.pantech.usb.sh \
	$(LOCAL_PATH)/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \

# Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh 
	
	
# Charger images
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/charger/images/battery_0.png:root/res/images/charger/battery_0.png \
	$(LOCAL_PATH)/charger/images/battery_1.png:root/res/images/charger/battery_1.png \
	$(LOCAL_PATH)/charger/images/battery_2.png:root/res/images/charger/battery_2.png \
	$(LOCAL_PATH)/charger/images/battery_3.png:root/res/images/charger/battery_3.png \
	$(LOCAL_PATH)/charger/images/battery_4.png:root/res/images/charger/battery_4.png \
	$(LOCAL_PATH)/charger/images/battery_5.png:root/res/images/charger/battery_5.png \
	$(LOCAL_PATH)/charger/images/battery_charge.png:root/res/images/charger/battery_charge.png \
	$(LOCAL_PATH)/charger/images/battery_fail.png:root/res/images/charger/battery_fail.png
     
# keylayout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	$(LOCAL_PATH)/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	$(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	$(LOCAL_PATH)/keylayout/stmicro_fts_ts.kl:system/usr/keylayout/stmicro_fts_ts.kl \
	$(LOCAL_PATH)/keylayout/Vendor_0079_Product_0011.kl:system/usr/keylayout/Vendor_0079_Product_0011.kl \
	$(LOCAL_PATH)/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
	$(LOCAL_PATH)/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
	$(LOCAL_PATH)/keylayout/Vendor_046d_Product_c219.kl:system/usr/keylayout/Vendor_046d_Product_c219.kl \
	$(LOCAL_PATH)/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
	$(LOCAL_PATH)/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
	$(LOCAL_PATH)/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
	$(LOCAL_PATH)/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
	$(LOCAL_PATH)/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
	$(LOCAL_PATH)/keylayout/Vendor_0583_Product_2060.kl:system/usr/keylayout/Vendor_0583_Product_2060.kl \
	$(LOCAL_PATH)/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1038_Product_1412.kl:system/usr/keylayout/Vendor_1038_Product_1412.kl \
	$(LOCAL_PATH)/keylayout/Vendor_12bd_Product_d015.kl:system/usr/keylayout/Vendor_12bd_Product_d015.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1689_Product_fd00.kl:system/usr/keylayout/Vendor_1689_Product_fd00.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1689_Product_fd01.kl:system/usr/keylayout/Vendor_1689_Product_fd01.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1689_Product_fe00.kl:system/usr/keylayout/Vendor_1689_Product_fe00.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1bad_Product_f016.kl:system/usr/keylayout/Vendor_1bad_Product_f016.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1bad_Product_f023.kl:system/usr/keylayout/Vendor_1bad_Product_f023.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1bad_Product_f027.kl:system/usr/keylayout/Vendor_1bad_Product_f027.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1bad_Product_f036.kl:system/usr/keylayout/Vendor_1bad_Product_f036.kl \
	$(LOCAL_PATH)/keylayout/Vendor_1d79_Product_0009.kl:system/usr/keylayout/Vendor_1d79_Product_0009.kl \
	$(LOCAL_PATH)/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
	$(LOCAL_PATH)/keylayout/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl \
#	$(LOCAL_PATH)/keylayout/atmel_mxt_540s.kl:system/usr/keylayout/atmel_mxt_540s.kl \


# keychars
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
	$(LOCAL_PATH)/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
	$(LOCAL_PATH)/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
	$(LOCAL_PATH)/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# idc
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/idc/fpc1080.idc:system/usr/idc/fpc1080.idc \
	$(LOCAL_PATH)/idc/fpc1080Mouse.idc:system/usr/idc/fpc1080Mouse.idc \
	$(LOCAL_PATH)/idc/fpc1080TouchPad.idc:system/usr/idc/fpc1080TouchPad.idc \
	$(LOCAL_PATH)/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	$(LOCAL_PATH)/idc/qwerty.idc:system/usr/idc/qwerty.idc \
     
# hdic
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/hdic/en.hdb:system/usr/hdic/en.hdb \
	$(LOCAL_PATH)/hdic/IM-A900S.key:system/usr/hdic/IM-A900S.key \
	$(LOCAL_PATH)/hdic/ko.hdb:system/usr/hdic/ko.hdb \
	$(LOCAL_PATH)/hdic/zgex.hdb:system/usr/hdic/zgex.hdb \
	$(LOCAL_PATH)/hdic/znum.hdb:system/usr/hdic/znum.hdb \
	$(LOCAL_PATH)/hdic/zsym.hdb:system/usr/hdic/zsym.hdb \
     
     
# Thermald
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/thermald/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf \
	$(LOCAL_PATH)/thermald/thermald-8974.conf:system/etc/thermald-8974.conf
    
PRODUCT_PACKAGES += \
    Torch
    
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SkyQualcommUiccRIL
	#ro.telephony.ril_class=QualcommSharedRIL
    
# Recovery Options
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.forbid_format=/persist,/firmware,/boot,/sbl1,/tz,/rpm,/sdi,/aboot \
    ro.cwm.forbid_mount=/persist,/firmware

# Inherit from msm8974-common
$(call inherit-product, device/pantech/msm8974-common/msm8974.mk)
