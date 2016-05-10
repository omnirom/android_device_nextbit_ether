#
# Copyright (C) 2015 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL ether devices, and
# are also specific to ether devices
#
# Everything in this directory will become public

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/nextbit/ether/ether-vendor.mk)

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)

# Product configuration
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS := device/nextbit/ether/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:system/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    device/nextbit/ether/rootdir/fstab.qcom:root/fstab.qcom \
    device/nextbit/ether/rootdir/init.class_main.sh:root/init.class_main.sh \
    device/nextbit/ether/rootdir/init.fih.fqcaudio.rc:root/init.fih.fqcaudio.rc \
    device/nextbit/ether/rootdir/init.fih.nbq.rc:root/init.fih.nbq.rc \
    device/nextbit/ether/rootdir/init.mdm.sh:root/init.mdm.sh \
    device/nextbit/ether/rootdir/init.nbq.charger.rc:root/init.nbq.charger.rc \
    device/nextbit/ether/rootdir/init.nbq.fingerprint.rc:root/init.nbq.fingerprint.rc \
    device/nextbit/ether/rootdir/init.nbq.fs.rc:root/init.nbq.fs.rc \
    device/nextbit/ether/rootdir/init.nbq.led.rc:root/init.nbq.led.rc \
    device/nextbit/ether/rootdir/init.nbq.lcm.rc:root/init.nbq.lcm.rc \
    device/nextbit/ether/rootdir/init.nbq.poweroff_charging.rc:root/init.nbq.poweroff_charging.rc \
    device/nextbit/ether/rootdir/init.nbq.smartamp_mode.sh:root/init.nbq.smartamp_mode.sh \
    device/nextbit/ether/rootdir/init.nbq.smartamp_post.sh:root/init.nbq.smartamp_post.sh \
    device/nextbit/ether/rootdir/init.nbq.smartamp.rc:root/init.nbq.smartamp.rc \
    device/nextbit/ether/rootdir/init.nbq.smartamp.sh:root/init.nbq.smartamp.sh \
    device/nextbit/ether/rootdir/init.nbq.target.rc:root/init.nbq.target.rc \
    device/nextbit/ether/rootdir/init.nfc_default.sh:root/init.nfc_default.sh \
    device/nextbit/ether/rootdir/init.qcom.cda.rc:root/init.qcom.cda.rc \
    device/nextbit/ether/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/nextbit/ether/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/nextbit/ether/rootdir/init.qcom.factory.sh:root/init.qcom.factory.sh \
    device/nextbit/ether/rootdir/init.qcom.fs.rc:root/init.qcom.fs.rc \
    device/nextbit/ether/rootdir/init.qcom.log.rc:root/init.qcom.log.rc \
    device/nextbit/ether/rootdir/init.target.rc:root/init.target.rc \
    device/nextbit/ether/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/nextbit/ether/rootdir/init.qcom.sh:root/init.qcom.sh \
    device/nextbit/ether/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/nextbit/ether/rootdir/init.qcom.target.rc:root/init.qcom.target.rc \
    device/nextbit/ether/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/nextbit/ether/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/nextbit/ether/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Audio
PRODUCT_COPY_FILES += \
    device/nextbit/ether/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/nextbit/ether/audio/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    device/nextbit/ether/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/nextbit/ether/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/nextbit/ether/audio/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
    device/nextbit/ether/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml

# Listen Platform
PRODUCT_COPY_FILES += \
    device/nextbit/ether/listen_platform/listen_platform_info.xml:system/etc/listen_platform_info.xml

# Sound Trigger
PRODUCT_COPY_FILES += \
    device/nextbit/ether/sound_trigger/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/nextbit/ether/sound_trigger/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

# Audio HAL and utilities
PRODUCT_PACKAGES += \
    audio.primary.msm8992 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_policy.msm8992 \
    libaudio-resampler

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcomvisualizer \
    libqcompostprocbundle \
    libvolumelistener

# OMX Audio Packages
PRODUCT_PACKAGES += \
    libOmxAacDec \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnv \
    libOmxMp3Dec \
    libOmxQcelp13Enc \
    libstagefright_soft_flacdec

# Display
PRODUCT_PACKAGES += \
    copybit.msm8992 \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    libgenlock \
    libc2dcolorconvert \
    liboverlay \
    libqdMetaData \
    libqdutils \
    memtrack.msm8992

# OMX Display
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVdpp \
    libOmxVenc \
    libOmxVidEnc \
    libstagefright

# GPS packages
PRODUCT_PACKAGES += \
    libloc_adapter \
    libgps.utils \
    libloc_eng \
    libloc_api_v02

# GPS configuration
PRODUCT_COPY_FILES += \
    device/nextbit/ether/configs/gps.conf:system/etc/gps.conf \
    device/nextbit/ether/configs/sec_config:system/etc/sec_config

# Input device files
PRODUCT_COPY_FILES += \
    device/nextbit/ether/input/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Liblights
PRODUCT_PACKAGES += \
    lights.msm8992

# Media
PRODUCT_COPY_FILES += \
    frameworks/av-caf/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av-caf/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av-caf/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/nextbit/ether/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/nextbit/ether/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    device/nextbit/ether/media/media_profiles.xml:system/etc/media_profiles.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/nextbit/ether/configs/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

# Net
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libcnefeatureconfig \
    librmnetctl \
    libxml2 \
    rmnetcli

# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.qcom \
    NfcNci \
    Tag

# NFC config files
PRODUCT_COPY_FILES += \
    device/nextbit/ether/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/nextbit/ether/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Off charging mode
PRODUCT_PACKAGES += \
    charger_res_images

# OMX core
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore

# WLAN configuration
PRODUCT_COPY_FILES += \
    device/nextbit/ether/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/nextbit/ether/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/nextbit/ether/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/nextbit/ether/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/nextbit/ether/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/nextbit/ether/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    device/nextbit/ether/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/nextbit/ether/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# WLAN packages
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

