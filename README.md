# Revancify X ![Hi](https://img.shields.io/github/stars/kastentop2005/Revancify-X?style=flat-square)
### A TUI wrapper for Revanced CLI with amazing features.
### Revancify X (or simply "Revx" [riˈvɪks]) is continuation of the discontinued Revancify manager by [decipher3114](https://github.com/decipher3114)

[![TelegramChannel](https://img.shields.io/badge/Telegram_Channel-2CA5E0?style=for-the-badge&logo=Telegram&logoColor=FFFFFF)](https://t.me/revancifyx) [![TelegramChannel](https://img.shields.io/badge/Telegram_Support_Chat-2CA5E0?style=for-the-badge&logo=Telegram&logoColor=FFFFFF)](https://t.me/revxchat)

## Termux
| Android Version | Download Link|
| ---- | ----- |
| Android 8+ | [Termux Monet](https://github.com/HardcodedCat/termux-monet/releases/latest) (Strictly Recommended)
| Android 4+ | [Termux](https://github.com/termux/termux-app/releases/latest)

# Features
1. Auto update patches and CLI
2. Interactive and easy to use
3. Inbuilt scrapper for [ApkMirror](https://apkmirror.com)
    > Only apps present on APKMirror are supported. However, you can still download app manually and use the apk file to patch
4. Contains user-friendly patch options editor
5. Conserve selected patches
6. Supports app downgrade for devices with signature spoofing enabled
7. Convenient installation and usage
6. Lightweight and faster than any other tool

## Current problems
- Create an issue if any

## Installation
1. Open Termux
2. Copy and paste this command:
```
bash -c "$(curl -fsSL https://github.com/kastentop2005/Revancify-X/raw/testing/install.sh)"
```

<details>
  <summary>If the above one doesn't work, use this</summary>

  ```
pkg update -y -o Dpkg::Options::="--force-confnew" && pkg install git -y && git clone --branch testing --single-branch --depth=1 https://github.com/kastentop2005/Revancify-X/raw/testing/install.sh && ./Revancify-X/revx
```
</details>

## Usage
After installation, type `revx` in termux and press enter.

You can also run Revancify X with arguments:
```
-n, --no-root     Run in non-root mode
-o, --offline     Run in offline mode
-r, --reinstall   Reinstall revancify X
-h, --help        Prints help statement
```

# Thanks & Credits
[Revancify](https://github.com/decipher3114/Revancify)
[Revanced](https://github.com/revanced)  
[Revanced Extended](https://github.com/inotia00)  
