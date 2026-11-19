# System Architecture & Technical Specifications

This document outlines the low-level technical architecture of **My GYM Plan (IronTracker)**, detailing the Android native runtime, WebView bridge, custom asset caching interceptor, and the atomic Live Over-The-Air (OTA) staging swap engine.

---

## 1. Native Android Runtime Layer

The native layer is implemented in Java 17, targeting Android API Level 34 (Android 14) with backward compatibility down to Android API Level 26 (Android 8.0 Oreo).

### Core Components (`MainActivity.java`)

```text
MainActivity.java
├── initWebView()                  # Hardware-accelerated WebView initialization
├── setupEdgeToEdge()              # Dynamic system status & navigation bar color sync
├── WebAppInterface                # JavascriptInterface bridge exposed to window.Android
│   ├── checkForOtaUpdate()        # Asynchronous GitHub CDN manifest poll
│   ├── downloadAndApplyOtaUpdate()# Multi-threaded asset stream into ota_staging/
│   ├── openExternalUrl()          # Secure Intent.ACTION_VIEW delegator
│   └── getAppBuildInfo()          # Returns native versionCode, versionName, and build
└── CustomWebViewClient
    └── shouldInterceptRequest()   # Custom offline-first cached HTTP interceptor
```

### WebView Performance Optimizations
- **Hardware Acceleration:** Enabled in `AndroidManifest.xml` via `android:hardwareAccelerated="true"`.
- **Render Cache Mode:** Set to `WebSettings.LOAD_DEFAULT` paired with custom interceptor overrides.
- **DOM Storage:** `setDomStorageEnabled(true)` and `setDatabaseEnabled(true)` enabled for persistent `localStorage` performance.
- **Safe Browsing:** Sandboxed to trusted local asset URLs (`http://localhost/` or local schema).

---

## 2. Hybrid Live Over-The-Air (OTA) Engine

Commercial hybrid apps traditionally require users to download full APK updates for minor JavaScript or CSS modifications. My GYM Plan introduces an **Atomic Directory Swapping OTA Engine**:

```text
Local Storage / App Data
├── assets/www/ (Built-in Fallback Base Assets)
│
├── files/ota_staging/ (Isolated Incoming Download Staging)
│   ├── app.js
│   ├── visual-guides.js
│   └── ota-manifest.json
│
└── files/ota_www/ (Active Runtime Directory)
    ├── [Atomic Rename from ota_staging upon checksum validation]
    └── Directly intercepted by shouldInterceptRequest()
```

### Update Lifecycle
1. **Manifest Check:** Client requests `https://raw.githubusercontent.com/Tushpendra-Kumar/my-gym-plan/main/ota-manifest.json`.
2. **Version Evaluation:** If `remote.buildNumber > local.buildNumber`, an update payload is assembled.
3. **Download Phase:** Assets listed in `ota-manifest.json.files` are streamed concurrently into `files/ota_staging/`.
4. **Validation & Atomic Swap:** If all downloads succeed without socket timeout:
   - Existing `files/ota_www_old/` (if any) is purged.
   - Current `files/ota_www/` is moved to `files/ota_www_old/`.
   - `files/ota_staging/` is renamed to `files/ota_www/`.
5. **Runtime Interception:** `shouldInterceptRequest()` checks `files/ota_www/` first; if present, it serves updated assets; otherwise, it falls back to built-in `assets/www/`.

---

## 3. Frontend Architecture (Vanilla ES6+)

The web application deliberately avoids frameworks (React, Vue, Angular) to eliminate virtual DOM reconciliation overhead and runtime dependency bloat.

### Module Responsibilities
- **`app.js`:** Root coordinator. Manages athlete state, workout logging, set completions, timer callbacks, and JSON backup/restore exports.
- **`room-fitness.js`:** 2-Tier Calisthenics engine, Daily Essentials 10-rep counter, and 48-hour recovery lock calculations.
- **`habits-tracker.js`:** Habit check-in grid, streak counters, monthly heatmap rendering, and the interactive `✎ Manage` mode.
- **`visual-guides.js`:** Biomechanical SVG vector engine rendering real-time animated Front and Side angle exercises.
- **`ota-updater.js`:** Client-side state machine managing update banners, progress bars, and bridge invocations.
- **`sw.js`:** Progressive Web App Service Worker providing Cache API fallback for non-native browser sessions.
