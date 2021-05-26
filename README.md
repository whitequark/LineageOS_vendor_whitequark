## Setup

1. `git clone git@github.com:whitequark/LineageOS_vendor_whitequark vendor/extra`
2. `mkdir -p .repo/local_manifests && ln -s ../../vendor/extra/manifest.xml .repo/local_manifests/vendor_extra.xml`
3. apply patches in `vendor/extra/patches`
4. generate `releasekey`, `media`, `networkstack`, `platform`, `shared` keys in `vendor/extra/security` with `./development/tools/make_key`
5. generate `verifiedboot.key` in `vendor/extra/security` with `openssl genrsa`
6. generate `verifiedboot.pkmd.bin` in `vendor/extra/security` with `avbtool extract_public_key`
7. generate `adb.key` in `vendor/extra/security` with `adb keygen`

## Build

```console
$ source build/envsetup.sh
$ lunch lineage_$DEVICE-userdebug
$ mka target-files-package otatools
$ ./build/tools/releasetools/sign_target_files_apks -o -d vendor/extra/security \
  $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip signed-target_files.zip
$ ./build/tools/releasetools/ota_from_target_files -k vendor/extra/security/releasekey --block \
  signed-target_files.zip signed-ota_update.zip
$ ./build/tools/releasetools/img_from_target_files \
  signed-target-files.zip signed-img.zip
```
