#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Device Path
DEVICE_PATH := device/huawei/anne

## Include common BoardConfig
include device/huawei/hi6250-9-common/BoardConfigCommon.mk

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824 # mmcblk0p31 (24576*1024)
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728 # mmcblk0p43 (131072*1024)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 # mmcblk0p33 (32768*1024)
BOARD_RECVENDORIMAGE_PARTITION_SIZE := 16777216 # mmcblk0p34 (16384*1024)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 54316236800 # mmcblk0p59 (53043200*1024)

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# SKUs
ODM_MANIFEST_SKUS += ANE-L01 ANE-L02J ANE-L02K ANE-L02 ANE-L03 ANE-L12JPZ ANE-L12J ANE-L21
ODM_MANIFEST_ANE-L01_FILES := $(DEVICE_PATH)/manifest_singlesimnfc.xml
ODM_MANIFEST_ANE-L02J_FILES := $(DEVICE_PATH)/manifest_singlesim.xml
ODM_MANIFEST_ANE-L02K_FILES := $(DEVICE_PATH)/manifest_singlesim.xml
ODM_MANIFEST_ANE-L02_FILES := $(DEVICE_PATH)/manifest_singlesim.xml
ODM_MANIFEST_ANE-L03_FILES := $(DEVICE_PATH)/manifest_singlesim.xml
ODM_MANIFEST_ANE-L12JPZ_FILES := $(DEVICE_PATH)/manifest_singlesim.xml
ODM_MANIFEST_ANE-L12J_FILES := $(DEVICE_PATH)/manifest_singlesim.xml
ODM_MANIFEST_ANE-L21_FILES := $(DEVICE_PATH)/manifest_dualsimnfc.xml
