1. `git clone git@github.com:whitequark/LineageOS_vendor_whitequark vendor/extra`
2. apply patches in `vendor/extra/patches`
3. generate `releasekey`, `media`, `networkstack`, `platform`, `shared` keys in `vendor/extra/security` with `./development/tools/make_key`
4. generate `verifiedboot.key` in `vendor/extra/security` with `openssl genrsa`
5. generate `verifiedboot.pkmd.bin` in `vendor/extra/security` with `avbtool extract_public_key`
6. generate `adb.key` in `vendor/extra/security` with `adb keygen`
