# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Exclude Live Wallpapers
TARGET_EXCLUDE_LIVEWALLPAPERS := true

# Inherit base device configuration
$(call inherit-product, device/nextbit/ether/device.mk)

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit proprietary device parts
$(call inherit-product, vendor/nextbit/ether/device-vendor.mk)

# Copy TWRP fstab - TWRP requires fstab v1
PRODUCT_COPY_FILES += \
    device/nextbit/ether/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Override product naming for Omni
PRODUCT_NAME := omni_ether
PRODUCT_DEVICE := ether
PRODUCT_BRAND := Nextbit
PRODUCT_MODEL := Robin
PRODUCT_MANUFACTURER := Nextbit

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="Nextbit/ether/ether:7.1.1/Robin_Nougat_91/00WW_Jenkins_91:user/release-keys" \
    PRIVATE_BUILD_DESC="ether-user 7.1.1 Robin_Nougat_91 00WW_Jenkins_91 release-keys"
