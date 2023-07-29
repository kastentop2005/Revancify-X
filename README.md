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
1. Auto updates patches and CLI
2. Interactive and easy to use
3. Inbuilt scrapper for [ApkMirror](https://apkmirror.com)
    > Only support apps available on apkmirror. However, you can still download app manually and use the apk file to patch
4. Contains user-friendly patch options Editor
5. Conserve selected patches
6. Supports app downgrade for devices with signature spoofing enabled
7. Convenient installation and usage
6. Lightweight and faster than any other tool

## Current problems
- The theme is broken
- Create an issue if anything else

## Installation
1. Open Termux
2. Delete your existing installation of Revancify X:
```
rm -rf $HOME/RevancifyX $HOME/RevancifyX-data
```
3. Copy and paste this command:
```
curl -sL "https://github.com/kastentop2005/Revancify-X/raw/testing/install.sh)" | bash
```

<details>
  <summary>If the above one doesn't work, use this.</summary>

  ```
pkg update -y -o Dpkg::Options::="--force-confnew" && pkg install git -y && git clone --depth=1 https://github.com/kastentop2005/Revancify-X/raw/testing/install.sh && ./Revancify-X/revx
```
</details>

## Usage
After installation, type `revx` in termux and press enter.

Or use with arguments. Check them with `revx -h` or `revx --help`

# Thanks & Credits
[Revancify](https://github.com/decipher3114/Revancify)
[Revanced](https://github.com/revanced)  
[Revanced Extended](https://github.com/inotia00)  
