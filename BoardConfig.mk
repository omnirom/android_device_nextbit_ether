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

DEVICE_PATH := device/nextbit/ether

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8992
TARGET_BOOTLOADER_BOARD_NAME := ether

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

# Second architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 41943040
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27258747904

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

BOARD_ROOT_EXTRA_FOLDERS := bt_firmware firmware persist securefs

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE :=  4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000

TARGET_KERNEL_SOURCE := kernel/nextbit/msm8992
TARGET_KERNEL_CONFIG := omni_ether_defconfig
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-5
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

TARGET_USES_64_BIT_BINDER := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_HAL_SUFFIX := $(TARGET_BOARD_PLATFORM)
NXP_CHIP_TYPE := PN547C2

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-uart"

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true

USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_USES_ALSA_AUDIO := true

SNDRV_COMPRESS_SET_NEXT_TRACK_PARAM := true

# Bluetooth
TARGET_QCOM_BLUETOOTH_VARIANT := caf-msm8998
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Keymaster
TARGET_PROVIDES_KEYMASTER := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TARGET_LEGACY_HW_DISK_ENCRYPTION := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# QCOM Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

TARGET_QCOM_DISPLAY_VARIANT := caf-msm8992
TARGET_QCOM_AUDIO_VARIANT := caf-msm8992
TARGET_QCOM_MEDIA_VARIANT := caf-msm8992
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

BOARD_USES_QC_TIME_SERVICES := true

# Increase coldboot timeout
TARGET_INCREASES_COLDBOOT_TIMEOUT := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn

TARGET_USES_WCNSS_MAC_ADDR_REV   := true

WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# TWRP
ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/twrp.mk
endif

TARGET_PROVIDES_POWERHAL := true
TARGET_USES_INTERACTION_BOOST := true


USE_SENSOR_MULTI_HAL := true
BOARD_SENSOR_HAL_SUFFIX := $(TARGET_BOARD_PLATFORM)

# Include system properties in separate system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

-include vendor/nextbit/ether/BoardConfigVendor.mk
