#!/bin/bash

source ../../../../system/tools/hidl/update-makefiles-helper.sh

do_makefiles_update \
  "vendor.lineage:device/nextbit/ether/modules" \
  "android.hardware:hardware/interfaces" \
  "android.hidl:system/libhidl/transport"
