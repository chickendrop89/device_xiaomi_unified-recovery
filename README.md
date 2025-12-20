# device_xiaomi_sm6225ad-recovery

Device tree for these Xiaomi devices
- Xiaomi Redmi Note _12_ 4G (codenamed `topaz` / `tapas`) (March 2023)
- Xiaomi Redmi Note _13_ 4G (codenamed `sapphire` / `sapphiren`) (January 2024)
- POCO _M7_ 4G / Redmi _15_ 4G (codenamed `creek`) (August, December 2025) (Experimental)

## Device specifications

Device                  | Redmi Note 12 4G / Note 13 4G        | POCO M7 4G / Redmi 15 4G
:-----------------------|:-------------------------------------|:-------------------------------------
SoC                     | Qualcomm Snapdragon® 685 (SM6225-AD) | Qualcomm Snapdragon® 685 (SM6225-AD)
Board                   | `khaje`                              | `khaje`
CPU                     | Octa-core (4x2.8 GHz Cortex-A73 & 4x1.9 GHz Cortex-A53) | Octa-core (4x2.8 GHz Cortex-A73 & 4x1.9 GHz Cortex-A53)
GPU                     | Adreno 610                           | Adreno 610
Memory                  | 4/6/8 GB RAM                         | 6/8 GB RAM
Shipped Android Version | 13.0                                 | 15.0 (HyperOS 2)
Storage                 | 64/128/256 GB (UFS 2.2)              | 128/256 GB (UFS 2.2)
MicroSD                 | Up to 1024 GB (1TB)                  | Up to 1024 GB (1TB)
Battery                 | Non-removable Li-Po 5000 mAh         | Non-removable Li-Ion 7000 mAh
Dimensions              | ~165.7 x 76 x 7.9 mm                 | 171.1 x 80.5 x 8.6 mm
Display                 | 6.67" AMOLED, 120Hz, 1080x2400       | 6.9" IPS LCD, 144Hz, 1080x2340

## Branch information
There are 4 branches in this repository:
- fox-12.1 - Main OFRP
- fox-14.1 - Experimental OFRP
- pbrp-12.1 - Main PBRP
- twrp-12.1 - Main TWRP

## `Creek` notes
These two devices are not yet fully supported, but the recoveries might be functional.

Modern HyperOS devices are ridiculously hard to unlock with the new requirements
and they were not tested yet. Though some initial bringup was made by `DarthJabba9`.

## How to build
This recovery tree was initially made for `topaz/tapas`. For historical purposes,
build the `twrp_tapas` target, it will work for the other devices as well.

```shell
lunch twrp_tapas-eng && mka adbd recoveryimage
```
