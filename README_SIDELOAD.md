# Flappy Cyber-Wing: Remix Edition — iOS Sideloading & Install Kit

Because Apple's iOS `arm64` Mach-O compiler (`xcodebuild` / iOS SDK) only runs on macOS, a raw `.ipa` file cannot be compiled inside a Linux environment without producing a dummy binary that crashes on launch. This kit gives you **three ways** to install and play **Flappy Cyber-Wing: Remix Edition** on your iPhone or iPad:

---

## Method 1: Build the Real Native `.IPA` for Free in the Cloud (No Mac Needed)
Use this method if you want a true native ARM64 `FlappyRemix.ipa` to sideload with **AltStore**, **SideStore**, **Sideloadly**, **Feather**, or **TrollStore**:

1. Create a free GitHub repository and upload the contents of this folder (ensuring `.github/workflows/build-ipa.yml` is at `.github/workflows/build-ipa.yml` in your repo, or run the workflow from `FlappyRemix_Xcode_IPA`).
2. Open the **Actions** tab on GitHub and run **Build Unsigned iOS .IPA for Sideloading**.
3. In ~2 minutes, GitHub's `macos-latest` runner compiles the Swift `WKWebView` app and outputs **`FlappyRemix-iOS-IPA` (`FlappyRemix.ipa`)**.
4. Import `FlappyRemix.ipa` into **Sideloadly**, **AltStore**, **SideStore**, or **TrollStore** — your signing tool will automatically sign the unsigned `.ipa` with your Apple ID / certificate and install it on your device.

---

## Method 2: Build `FlappyRemix.ipa` Locally on a Mac (1 Command)
If you have a Mac with Xcode installed:
```bash
cd FlappyRemix_Xcode_IPA
chmod +x build_ipa_macos.sh
./build_ipa_macos.sh
```
This outputs `FlappyRemix.ipa` in the root folder, ready for Sideloadly or AltStore.

---

## Method 3: Instant Full-Screen iOS Install (No Computer & Zero 7-Day Revokes)
If you want the game on your iPhone Home Screen immediately without a PC/Mac or 7-day certificate expirations:
- **Via Configuration Profile:** AirDrop or save `FlappyRemix.mobileconfig` to your iPhone, tap it to download the profile, then open **Settings → Profile Downloaded → Install**. It places **Flappy Remix** with its custom neon icon right on your Home Screen.
- **Via Safari PWA:** Open `flappy_remix.html` in Safari on iOS and tap **Share → Add to Home Screen**.
