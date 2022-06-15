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
