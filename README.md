## Setup

1. `git clone git@github.com:whitequark/LineageOS_vendor_whitequark vendor/extra`
2. `mkdir -p .repo/local_manifests && ln -s ../../vendor/extra/manifest.xml .repo/local_manifests/vendor_extra.xml`
3. apply patches in `vendor/extra/patches`
4. `./development/tools/make_key vendor/extra/security/media /CN=$USER`
5. `./development/tools/make_key vendor/extra/security/networkstack /CN=$USER`
6. `./development/tools/make_key vendor/extra/security/platform /CN=$USER`
7. `./development/tools/make_key vendor/extra/security/shared /CN=$USER`
8. `./development/tools/make_key vendor/extra/security/sdk_sandbox /CN=$USER`
8. `./development/tools/make_key vendor/extra/security/bluetooth /CN=$USER`
9. `./development/tools/make_key vendor/extra/security/releasekey /CN=$USER`
10. `openssl pkcs8 -in vendor/extra/security/releasekey.pk8 -inform DER -out vendor/extra/security/verifiedboot.key -nocrypt`
11. `external/avb/avbtool extract_public_key --key vendor/extra/security/verifiedboot.key --output vendor/extra/security/pkmd.bin`
12. `adb keygen vendor/extra/security/adb.key`

## Build

```console
$ source build/envsetup.sh
$ lunch lineage_$DEVICE-userdebug
$ mka target-files-package otatools
$ ./build/tools/releasetools/sign_target_files_apks -o -d vendor/extra/security \
  $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip signed-target_files.zip
$ ./build/tools/releasetools/ota_from_target_files -k vendor/extra/security/releasekey --block \
  signed-target_files.zip signed-ota_update.zip
```
