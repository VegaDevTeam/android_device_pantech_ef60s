# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/pantech/ef60s/full_ef60s.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

TARGET_BOOTANIMATION_NAME := 1080

# Inherit some common Mokee stuff.
$(call inherit-product, vendor/mk/config/gsm.mk)

$(call inherit-product, vendor/mk/config/cdma.mk)

# Enhanced NFC
$(call inherit-product, vendor/mk/config/nfc_enhanced.mk)

# Inherit some common Mokee stuff.
$(call inherit-product, vendor/mk/config/common_full.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ef60s
PRODUCT_NAME := mk_ef60s
PRODUCT_BRAND := VEGA
PRODUCT_MODEL := IM-A900S
PRODUCT_MANUFACTURER := pantech

PRODUCT_DEFAULT_LANGUAGE := zh
PRODUCT_DEFAULT_REGION := CN

PRODUCT_LOCALES := zh_CN zh_TW en_US

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=IM-A900S \
    TARGET_DEVICE=ef60s \
    BUILD_FINGERPRINT=VEGA/IM-A900S/ef60s:4.4.2/KVT49L/S0223215:user/release-keys \
    PRIVATE_BUILD_DESC="mk_ef60s-userdebug 4.4.2 KVT49L S0223215 release-keys"

#MK_NIGHTLY := true

