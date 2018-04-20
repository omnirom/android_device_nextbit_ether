# Boot animation
TARGET_BOOTANIMATION_SIZE := 1080p

# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit some common omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/nextbit/ether/device.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_ether
BOARD_VENDOR := nextbit
TARGET_VENDOR := nextbit
PRODUCT_DEVICE := ether

PRODUCT_BRAND := Nextbit
PRODUCT_MODEL := Robin
PRODUCT_MANUFACTURER := Nextbit

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ether-user 7.1.1 Robin_Nougat_108 00WW_Jenkins_108 release-keys"

BUILD_FINGERPRINT := Nextbit/ether/ether:7.1.1/Robin_Nougat_108/00WW_Jenkins_108:user/release-keys
