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

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a7

ENABLE_CPUSETS := true

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE :=  4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000

TARGET_KERNEL_SOURCE := kernel/nextbit/msm8992
TARGET_KERNEL_CONFIG := NBQ_defconfig
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_APPEND_DTB := true

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += boot_cpus=0-5 androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true

BOARD_CUSTOM_BOOTIMG_MK := device/nextbit/ether/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_RIL_VARIANT := caf
COMMON_GLOBAL_CFLAGS += -DBOARD_HAS_SENSORS_GROUP

# Audio/media
TARGET_QCOM_AUDIO_VARIANT := caf-msm8992
TARGET_QCOM_MEDIA_VARIANT := caf-msm8992
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Camera
USE_CAMERA_STUB := true

# Increase coldboot timeout
TARGET_INCREASES_COLDBOOT_TIMEOUT := true

BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true

COMMON_GLOBAL_CFLAGS += -DSNDRV_COMPRESS_SET_NEXT_TRACK_PARAM

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nextbit/ether/bluetooth
BOARD_HAS_QCA_BT_ROME := true
WCNSS_FILTER_USES_SIBS := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := false

BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

BOARD_HAS_FINGERPRINT_FPC := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8992
TARGET_BOARD_PLATFORM_GPU := qcom-adreno418
TARGET_BOOTLOADER_BOARD_NAME := ether
TARGET_NO_RPC := true

BOARD_EGL_CFG := device/nextbit/ether/configs/egl.cfg

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_QCOM_DISPLAY_VARIANT := caf-msm8992
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true

HAVE_ADRENO_SOURCE:= false

OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE     := 41943040
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27258764288

BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RECOVERY_FSTAB = device/nextbit/ether/rootdir/fstab.qcom

BOARD_CHARGER_ENABLE_SUSPEND := true

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

TARGET_USES_64_BIT_BINDER := true

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Keystore
TARGET_PROVIDES_KEYMASTER := true

TARGET_HW_DISK_ENCRYPTION := true

# sepolicy
include device/qcom/sepolicy/sepolicy.mk

# TWRP
TW_THEME := portrait_hdpi
TW_INCLUDE_CRYPTO := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

-include vendor/nextbit/ether/BoardConfigVendor.mk 
