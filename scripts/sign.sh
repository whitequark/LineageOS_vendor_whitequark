#!/bin/sh -ex

./build/tools/releasetools/sign_target_files_apks \
  -o \
  -d vendor/extra/security \
  $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
  signed-target_files.zip

./build/tools/releasetools/ota_from_target_files \
  -k vendor/extra/security/releasekey \
  signed-target_files.zip \
  signed-ota_update.zip

./build/tools/releasetools/img_from_target_files \
  signed-target_files.zip \
  signed-img.zip
