#
# Copyright (C) 2016 The CyanogenMod Project
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

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)

# setup base hwui configs
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)

# Init
PRODUCT_COPY_FILES += \
    device/nextbit/ether/rootdir/fstab.qcom:root/fstab.qcom \
    device/nextbit/ether/rootdir/init.nbq.charger.rc:root/init.nbq.charger.rc \
    device/nextbit/ether/rootdir/init.nbq.fingerprint.rc:root/init.nbq.fingerprint.rc \
    device/nextbit/ether/rootdir/init.nbq.led.rc:root/init.nbq.led.rc \
    device/nextbit/ether/rootdir/init.nbq.nfc.rc:root/init.nbq.nfc.rc \
    device/nextbit/ether/rootdir/init.nbq.poweroff_charging.rc:root/init.nbq.poweroff_charging.rc \
    device/nextbit/ether/rootdir/init.nbq.smartamp.rc:root/init.nbq.smartamp.rc \
    device/nextbit/ether/rootdir/init.nbq.target.rc:root/init.nbq.target.rc \
    device/nextbit/ether/rootdir/init.nbq.usb.rc:root/init.nbq.usb.rc \
    device/nextbit/ether/rootdir/init.qcom.fs.rc:root/init.qcom.fs.rc \
    device/nextbit/ether/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/nextbit/ether/rootdir/init.qcom.sh:root/init.qcom.sh \
    device/nextbit/ether/rootdir/init.target.rc:root/init.target.rc \
    device/nextbit/ether/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    device/nextbit/ether/rootdir/bin/init.nbq.mac.sh:system/bin/init.nbq.mac.sh \
    device/nextbit/ether/rootdir/bin/init.nbq.power.sh:system/bin/init.nbq.power.sh

PRODUCT_COPY_FILES += \
    device/nextbit/ether/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh


# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8992 \
    audio_policy.msm8992 \
    audio.r_submix.default \
    audio.usb.default

# Amplifier
PRODUCT_PACKAGES += \
    audio_amplifier.msm8992

# some extra tools
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay

# routes, paths, effects, policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml


# features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml  \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# custom acdb path
PRODUCT_PROPERTY_OVERRIDES += \
    audio.acdb.name=NBQ

# fast track settings
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio_hal.period_size=192

# fluence multi-mic solution
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.audiorec=false \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.mode=broadside

# stereo camcorder
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.camcorder.stereo=true

# low audio flinger standby delay to reduce power consumption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.flinger_standbytime_ms=300

# Camera2 API
PRODUCT_PROPERTY_OVERRIDES += \
    media.camera.ts.monotonic=0 \
    persist.camera.HAL3.enabled=1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

# Display density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

PRODUCT_PACKAGES += fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

# Lights
PRODUCT_PACKAGES += \
    lights.msm8992

# Input device files for ether
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    nfc_nci.qcom \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/nfc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Power
PRODUCT_PACKAGES += \
    power.msm8992

# Audio calibration database
ACDB_TARGET ?= NBQ

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_Bluetooth_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_General_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_Global_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_Handset_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_Hdmi_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_Headset_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdbdata/$(ACDB_TARGET)_Speaker_cal.acdb:system/etc/acdbdata/$(ACDB_TARGET)/$(ACDB_TARGET)_Speaker_cal.acdb

PRODUCT_PACKAGES += \
    audiod \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessingdescriptors \
    libqcomvoiceprocessing

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \

# speaker protection
PRODUCT_PROPERTY_OVERRIDES += \
    persist.speaker.prot.enable=false \
    persist.spkr.cal.duration=0

# surround sound recording
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.ssr.3mic=false

# offload settings
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.gapless.enabled=true \
    audio.offload.buffer.size.kb=32 \
    audio.offload.video=true \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.multiple.enabled=false \
    audio.deep_buffer.media=true

# voip
PRODUCT_PROPERTY_OVERRIDES += \
    use.voice.path.for.pcm.voip=true

PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.enable_timeout_ms=12000 \
    bluetooth.hfp.client=1 \
    qcom.bluetooth.soc=rome

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false \
    ro.qc.sdk.camera.facialproc=false \
    ro.qc.sdk.gestures.camera=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1 \
    persist.env.fastdorm.enabled=true

# Display HAL
PRODUCT_PACKAGES += \
    copybit.msm8992 \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    liboverlay \
    libqdutils \
    libqdMetaData \
    memtrack.msm8992 \

# QC CABL feature
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=2

# MSM8992 HAL settings
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.egl.hw=1 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=1 \
    persist.debug.wfd.enable=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    persist.mdpcomp.4k2kSplit=1 \
    persist.mdpcomp_perfhint=50 \
    persist.metadata_dynfps.disable=true \
    persist.sys.wfd.virtual=0 \
    ro.opengles.version=196609

# OpenGLES Android Extension
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_PACKAGES += \
    gps.msm8992

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:system/etc/sap.conf

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PROPERTY_OVERRIDES += \
    mm.enable.smoothstreaming=true \
    media.aac_51_output_enabled=true \
    vidc.debug.level=1 \
    vidc.enc.dcvs.extra-buff-count=2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

PRODUCT_PACKAGES += \
    libtinyxml

# try not to use big cores during dexopt
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=4 \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=4

PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libbson \
    libcnefeatureconfig \
    libnl_2 \
    libqsap_sdk \
    librmnetctl \
    libxml2

# property for vendor specific library
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.gt_library=libqti-gt.so \
    sys.games.gt.prof=0

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent \
    persist.data.netmgrd.qos.enable=true \
    persist.data.tcp_rst_drop=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.custom_ecc=1 \
    persist.radio.sib16_support=1 \
    ro.data.large_tcp_window_size=true \
    ro.use_data_netmgrd=true \
    ro.telephony.default_network=9

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.sensors.gestures=true

PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/wifi/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

PRODUCT_PACKAGES += \
    a4wpservice \
    android.wipower \
    android.wipower.xml \
    com.quicinc.wbcserviceapp \
    libwipower_jni \
    wipowerservice

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.emb_wp_mode=true \
    ro.bluetooth.wipower=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Enable Wifi calling
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true

# Telephony extension
#PRODUCT_PACKAGES += telephony-ext
#PRODUCT_PACKAGES += ims-ext-common
#PRODUCT_BOOT_JARS += telephony-ext
