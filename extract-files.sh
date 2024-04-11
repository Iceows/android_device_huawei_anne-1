#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        odm/etc/camera/*.xml)
            sed -i 's/gb2312/iso-8859-1/g' "${2}"
            sed -i 's/GB2312/iso-8859-1/g' "${2}"
            sed -i 's/xmlversion/xml version/g' "${2}"
            ;;
	odm/etc/libnfc-nci.conf)
	    sed -i 's/\/data\/nfc/\/data\/vendor\/nfc/g' "${2}"
	    ;;
        odm/lib64/hwcam/hwcam.hi6250.m.ANNE.so)
            "${PATCHELF}" --remove-needed "vendor.huawei.hardware.ai@1.0.so" "${2}"
            "${PATCHELF}" --remove-needed "vendor.huawei.hardware.biometrics.hwsecurefacerecognize@1.0.so" "${2}"
            ## NOP vendor.huawei.hardware.perfgenius calls
            # CameraPerfImpl::connectLocked
            "${SIGSCAN}" -p "c3 19 f0 97 fc 6f ba a9 fa 67 01 a9" -P "c3 19 f0 97 00 00 80 d2 c0 03 5f d6" -f "${2}"
            ## NOP vendor.huawei.hardware.sensors calls
            # TofSensorImpl::connectTofServiceLocked
            "${SIGSCAN}" -p "30 c7 ef 97 fc 0f 1b f8 f8 5f 01 a9" -P "30 c7 ef 97 00 00 80 d2 c0 03 5f d6" -f "${2}"
            # AwbSensorImpl::connectAwbServiceLocked
            "${SIGSCAN}" -p "27 b1 ee 97 fc 0f 1b f8 f8 5f 01 a9" -P "27 b1 ee 97 00 00 80 d2 c0 03 5f d6" -f "${2}"
            # FlickerSensorImpl::connectFlickerServiceLocked
            "${SIGSCAN}" -p "20 a9 ee 97 fc 0f 1b f8 f8 5f 01 a9" -P "20 a9 ee 97 00 00 80 d2 c0 03 5f d6" -f "${2}"
            # LightSensorImpl::connectLightServiceLocked
            "${SIGSCAN}" -p "82 a3 ee 97 fc 0f 1b f8 f8 5f 01 a9" -P "82 a3 ee 97 00 00 80 d2 c0 03 5f d6" -f "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=anne
export DEVICE_COMMON=hi6250-9-common
export VENDOR=huawei

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
