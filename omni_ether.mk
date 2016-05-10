# Exclude Live Wallpapers
TARGET_EXCLUDE_LIVEWALLPAPERS := true

# Inherit base device configuration
$(call inherit-product, device/nextbit/ether/device.mk)

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Override product naming for Omni
PRODUCT_NAME := omni_ether
PRODUCT_DEVICE := ether
PRODUCT_BRAND := Nextbit
PRODUCT_MODEL := Robin
PRODUCT_MANUFACTURER := Nextbit

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="Nextbit/ether/ether:6.0.1/MMB29M/00WW_1_290:user/release-keys" \
    PRIVATE_BUILD_DESC="ether-user 6.0.1 MMB29M 00WW_1_290 release-keys"

