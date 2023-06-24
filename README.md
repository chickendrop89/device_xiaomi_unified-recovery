# orangefox_device_xiaomi_tapas

Redmi Note 12 4G (codenamed _"topaz/tapas"_) is a mid-range smartphone from Xiaomi announced in March 2023.

## Device specifications

Device                  | Xiaomi Redmi Note 12 4G
-----------------------:|:-------------------------
SoC                     | Qualcomm Snapdragon® 685 (SM6225)
CPU                     | Octa-core (4x2.8 GHz Cortex-A73 & 4x1.9 GHz Cortex-A53)
GPU                     | Adreno 610
Memory                  | 4/6/8 GB RAM
Shipped Android Version | 13.0
Storage                 | 64/128 GB (UFS 2.2)
MicroSD                 | Up to 1024 GB (1TB)
Battery                 | Non-removable Li-Po 5000 mAh
Dimensions              | 165.7 x 76 x 7.9 mm
Display                 | 1080 x 2400 pixels, 6.67 inches (~395 ppi density), AMOLED, 120Hz, Dolby Vision
Camera                  | 50 MP (wide), 2 MP (macro), 12 MP (ultrawide), 13 MP (front-wide)

## Device picture

![Redmi Note 12 4G](https://i02.appmifile.com/224_operator_sg/10/03/2023/cdf4a7f40a92668d1c8fe2fcc5045ea8.png)

## Features

Works:

- [X] ADB
- [X] Decryption
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] SD Card
- [ ] Vibrator

## To use it:

```
fastboot flash recovery_a out/target/product/tapas/recovery.img
fastboot flash recovery_b out/target/product/tapas/recovery.img
```
