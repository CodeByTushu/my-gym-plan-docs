# My GYM Plan (IronTracker) — Official Technical & Athletic Documentation

<div align="center">

![My GYM Plan Logo](assets/icon-192.png)

### The 100% Offline-First Athletic Operating System & Hypertrophy Tracker

[![Version](https://img.shields.io/badge/Version-v0.05.3-black.svg?style=for-the-badge&logo=github)](https://github.com/Tushpendra-Kumar/my-gym-plan)
[![Platform](https://img.shields.io/badge/Platform-Android%208.0%2B%20%7C%20PWA-black.svg?style=for-the-badge&logo=android)](https://codebytushu.com/apps/)
[![Architecture](https://img.shields.io/badge/Architecture-Vanilla%20ES6%2B%20%2B%20Native%20WebView-black.svg?style=for-the-badge&logo=javascript)](https://codebytushu.com)
[![Privacy](https://img.shields.io/badge/Privacy-100%25%20Offline%20%28Zero%20Cloud%29-22c55e.svg?style=for-the-badge&logo=shield)](https://codebytushu.com)
[![License](https://img.shields.io/badge/Studio-CodeByTushu-black.svg?style=for-the-badge)](https://codebytushu.com)

**[📲 Download APK on CodeByTushu Apps Hub](https://codebytushu.com/apps/)** • **[📖 Download PDF Manual (Clickable)](manual/My-Gym-Plan-Athletic-Manual.html)** • **[⚡ Development Engine Repo](https://github.com/Tushpendra-Kumar/my-gym-plan)**

---

</div>

## 📌 Executive Summary

**My GYM Plan** (also branded as **IronTracker** on the CodeByTushu Apps Hub) is an uncompromising, military-grade athletic tracker and habit accountability engine. 

Engineered from the ground up to solve the bloat, privacy invasion, and performance degradation of commercial fitness apps, My GYM Plan runs **100% offline**, operates with a cold boot time under **50ms**, and renders **65 animated biomechanical exercises** with dual anatomical angles (Front & Side) using lightweight vector mathematics rather than battery-draining video files.

Furthermore, it features a custom **Hybrid Live Over-The-Air (OTA) update system** that downloads web asset patches directly from GitHub into an isolated native staging directory, hot-swapping code at runtime with **zero APK re-install required**.

---

## 📑 Table of Contents

- [Architectural Overview](#-architectural-overview)
- [Core Features & Modules](#-core-features--modules)
  - [1. The 7-12-15 Scientific Hypertrophy Protocol](#1-the-7-12-15-scientific-hypertrophy-protocol)
  - [2. 2-Tier Room Fitness & Calisthenics Engine](#2-2-tier-room-fitness--calisthenics-engine)
  - [3. Biomechanical Dual-Angle SVG Vector Engine](#3-biomechanical-dual-angle-svg-vector-engine)
  - [4. Habits & Discipline Accountability Tracker](#4-habits--discipline-accountability-tracker)
  - [5. Athletic Nutrition & Macro Engine](#5-athletic-nutrition--macro-engine)
  - [6. Security, SHA-256 PIN Vault & Device Privacy](#6-security-sha-256-pin-vault--device-privacy)
  - [7. Data Governance, Backup & Retention](#7-data-governance-backup--retention)
  - [8. Hybrid Live Over-The-Air (OTA) Updates](#8-hybrid-live-over-the-air-ota-updates)
- [Technology Stack Matrix](#-technology-stack-matrix)
- [Project Directory Structure](#-project-directory-structure)
- [Developer Setup & Build Guide](#-developer-setup--build-guide)
- [Live OTA Deployment Workflow](#-live-ota-deployment-workflow)
- [Downloadable Interactive User Manual (PDF)](#-downloadable-interactive-user-manual-pdf)
- [About CodeByTushu Studio & Credits](#-about-codebytushu-studio--credits)

---

## 🏗 Architectural Overview

The system employs a high-performance **Hybrid Native-to-Web Architecture**:

```mermaid
graph TD
    subgraph Android Native Runtime (Java 17 / API 26+)
        A[MainActivity.java] --> B[Edge-to-Edge System Bar Sync]
        A --> C[Hardware Accelerated WebView]
        A --> D[Live OTA Background Downloader]
        D --> E[ota_staging/ Directory]
        E -->|Atomic Swap on Success| F[ota_www/ Directory]
        C --> G[Custom Asset Interceptor shouldInterceptRequest]
        F --> G
    end

    subgraph Web Runtime (Zero-Framework Vanilla ES6+)
        G --> H[index.html / style.css Apple Monochrome]
        H --> I[app.js Core Router & State]
        H --> J[room-fitness.js 2-Tier Engine]
        H --> K[habits-tracker.js + Manage Mode]
        H --> L[visual-guides.js Dual-Angle SVG Engine]
        H --> M[pro-coach.js & Nutrition Engine]
        H --> N[ota-updater.js Client State Machine]
    end

    subgraph Offline Storage & Security
        I --> O[localStorage Device-Only Schema]
        O --> P[tushu_gym_logs & weights]
        O --> Q[tushu_habits_v2 records]
        O --> R[tushu_room_fitness_v1 state]
        O --> S[SHA-256 Encrypted PIN Hash]
        I --> T[sw.js Dual Cache Layer PWA]
    end

    subgraph CI/CD & OTA Channel (GitHub)
        U[git push origin main] --> V[GitHub Actions build-apk.yml]
        V --> W[GymPlan.apk Release]
        U --> X[ota-manifest.json raw CDN]
        X -->|Background Check| N
    end
```

---

## ⚡ Core Features & Modules

### 1. The 7-12-15 Scientific Hypertrophy Protocol
Unlike conventional 3x10 routines, My GYM Plan sequences resistance training to recruit every muscle fiber spectrum in a single session:
- **Set 1 — Power Set (7 Reps @ 80–85% 1RM):** Mechanical tension recruiting high-threshold Type IIx motor units.
- **Set 2 — Hypertrophy Set (12 Reps @ 65–70% 1RM):** Time-under-tension driving cellular sarcoplasmic growth.
- **Set 3 — Metabolic Burnout Drop Set (15 Fast Reps @ 50% 1RM):** Rapid metabolite pooling (lactate/hydrogen) stimulating maximal muscle swelling.
- **6-Day Split:** Chest & Front Delts (Mon), Back & Rear Delts (Tue), Shoulders & Traps (Wed), Arms Biceps/Triceps (Thu), Legs & Calves (Fri), Core & Functional (Sat), Full Rest (Sun).
- **Audio & Haptic Rest Timers:** Automatically fires 60s/90s/120s rest periods upon completing any set.

### 2. 2-Tier Room Fitness & Calisthenics Engine
Designed for bodyweight mastery and off-gym conditioning:
- **Tier 1: Daily Essentials (Non-Negotiable):** High-frequency morning baseline routines (10 Push-ups, 10 Hindu Baithak Squats, 60s Core Plank, Doorframe Rows) with a quick 1-tap check-in toggle.
- **Tier 2: Weekly Split (48-Hour Recovery Lock):** Upper Body Push/Pull, Core Hollow-Body, and Lower Body routines protected by strict 48-hour recovery locks to guarantee muscle protein synthesis heals before repeat strain.
- **Sunday Sacred Rest:** Automatically locks high-intensity volume and renders guided mobility drills, hydration prompts, and nervous system recovery cues.

### 3. Biomechanical Dual-Angle SVG Vector Engine
Eliminates hundreds of megabytes of video dependencies with a proprietary mathematical SVG rendering pipeline:
- **65 Exercises across 19 Anatomical Groups:** Front View (0°) for grip spacing, bilateral balance, and primary muscle glow; Side Profile (90°) for spinal alignment, knee path, and bar trajectory.
- **MuscleWiki-Grade Aesthetics:** Smooth CSS keyframe biomechanical motion with high-contrast muscle highlight layers (Pectoralis, Lats, Deltoids, Quads, Hamstrings, Abdominals).
- **In-App Exercise Customizer:** Interactive modal providing breathing cadence, form cues, common mistakes, and an *Edit Details* button for custom rep targets.

### 4. Habits & Discipline Accountability Tracker
- **11 Core Daily Athletic Habits:** Wake up at 05:00, Gym Training, Clean Diet, 3+ Liters Water, Reading/Learning, Deep Work, Social Media Detox, Day Plan & Budget, Cold Shower, 7.5+ Hours Sleep, and Custom Routines.
- **Interactive Progress Views:** Weekly Cards view, Monthly Calendar Heatmaps, and real-time daily score percentage calculation.
- **✎ Manage Mode (`v0.05.2+`):** 1-tap toggle exposing inline delete (`✕`) and edit (`✎`) controls on every habit item, allowing users to remove accidental additions and configure custom routines effortlessly.

### 5. Athletic Nutrition & Macro Engine
- **Target Macro Formulas:** Protein (1.6–2.2g/kg), Carbs (3.0–4.5g/kg), Fats (0.8–1.0g/kg), and Hydration (3.5–4.0L).
- **Indian Diet Customization:** Tailored high-protein meal templates for both Indian Vegetarian (Paneer, Soya Chunks, Tofu, Dal, Sprouts, Oats, Ghee) and Non-Vegetarian athletes.
- **Pre & Post Workout Nutrient Timing:** Precise 45-minute metabolic carbohydrate and protein fueling windows.

### 6. Security, SHA-256 PIN Vault & Device Privacy
- **Zero Cloud Leakage:** No external user tracking, advertising analytics, or telemetry servers.
- **Goku Ultra Instinct Onboarding:** Guided athlete profile setup with goal selection and PIN establishment.
- **SHA-256 Client-Side Hashing:** Athlete PIN is cryptographically hashed with local salting via `crypto.subtle.digest('SHA-256')`. Plain-text PINs are never saved to disk.

### 7. Data Governance, Backup & Retention
- **1-Click JSON Snapshot:** Complete export/import of all 14 internal `tushu_*` localStorage databases for device migration.
- **Automated 6-Month Log Retention:** Background pruning engine that purges daily log records older than 180 days (`YYYY-MM-DD`) while permanently preserving all-time PR weights.
- **PIN-Protected Hard Reset:** Clear Device Data function requiring SHA-256 PIN authentication before safely wiping all local databases.

### 8. Hybrid Live Over-The-Air (OTA) Updates
- **Manifest Architecture:** Checks remote `ota-manifest.json` on push.
- **Staging & Atomic Swap:** Native Java thread streams delta files into `ota_staging/`, verifies file integrity, and atomically swaps to `ota_www/`.
- **Zero APK Reinstall:** New UI changes, bug fixes, and workout additions are applied in under 2 seconds.

---

## 📊 Technology Stack Matrix

| Layer | Technologies Used | Key Purpose |
| :--- | :--- | :--- |
| **Native Runtime** | Android SDK (Java 17, Min API 26, Target API 34) | Hardware acceleration, WebView bridge, Live OTA downloader |
| **Frontend Core** | Vanilla ES6+ JavaScript, HTML5 Semantic | Instant cold boot (<50ms), 60 FPS scrolling, zero framework lag |
| **Styling & Theme** | Modern CSS3 (Variables, Grid, Flex, Backdrop Filter) | Apple Frosted Glass, pure monochrome (White & Deep Black) |
| **Vector Biomechanics** | Scalable Vector Graphics (SVG), CSS Keyframes | Mathematical joint movement & muscle activation graphics |
| **Offline Cache** | Service Worker (`sw.js`) + Android Asset Interceptor | 100% offline functionality without internet connectivity |
| **Cryptography** | Web Crypto API (`SHA-256` hashing) | Secure athlete PIN authentication on local device |
| **CI / CD Pipeline** | GitHub Actions, Gradle 8.2 | Headless APK compilation, automated release tagging |

---

## 📂 Project Directory Structure

```text
my-gym-plan/
├── android/                        # Android Native Project (Gradle / Java)
│   ├── app/
│   │   ├── build.gradle            # Native dependencies & signing configs
│   │   └── src/main/
│   │       ├── AndroidManifest.xml # Permissions & edge-to-edge configurations
│   │       ├── assets/www/         # Bundled offline web assets for native WebView
│   │       ├── java/.../MainActivity.java # Native OTA downloader & WebView bridge
│   │       └── res/                # Mipmap icons, monochrome themes.xml & colors.xml
│   └── build.gradle                # Top-level Gradle build configuration
├── .github/workflows/
│   └── build-apk.yml               # GitHub Actions CI/CD headless APK builder
├── icons/                          # High-resolution 192px and 512px app icons
├── manual/                         # Printable User Manuals & Documentation
│   ├── My-Gym-Plan-Athletic-Manual.html # Interactive HTML Manual (Clickable TOC)
│   └── generate-pdf.bat            # 1-Click PDF compiler script
├── app.js                          # Core routing, workout logging, backup/restore
├── room-fitness.js                 # 2-Tier calisthenics, Daily 10, 48h split
├── habits-tracker.js               # Habits engine, streak heatmap, ✎ Manage mode
├── visual-guides.js                # 65 animated SVG exercises (Front & Side angles)
├── pro-coach.js                    # Athletic tips, motivation, and nutrition logic
├── ota-updater.js                  # Frontend OTA state machine & check engine
├── ota-manifest.json               # Live update version manifest (version & build #)
├── publish-ota.js                  # 1-Command release publisher & version bumper
├── sync-assets.js                  # Automated web asset synchronizer to Android assets
├── sw.js                           # Progressive Web App offline Cache API worker
├── index.html                      # Single-page athlete dashboard
└── style.css                       # Apple monochrome design tokens & animations
```

---

## 🛠 Developer Setup & Build Guide

### Prerequisites
- **Node.js**: v18.0.0 or higher
- **Java Development Kit (JDK)**: OpenJDK 17
- **Android Studio / Android SDK**: API Level 34 with Build-Tools 34.0.0

### Local Development Steps

1. **Clone the development repository:**
   ```bash
   git clone https://github.com/Tushpendra-Kumar/my-gym-plan.git
   cd my-gym-plan
   ```

2. **Run local web server for frontend inspection:**
   ```bash
   npx serve . -p 8080
   ```
   Open `http://localhost:8080` in your desktop or mobile browser.

3. **Synchronize web assets to Android project:**
   ```bash
   node sync-assets.js
   ```

4. **Build Android APK locally (CLI):**
   ```bash
   cd android
   ./gradlew assembleDebug
   ```
   The compiled APK will be located at:
   `android/app/build/outputs/apk/debug/app-debug.apk`

---

## 🚀 Live OTA Deployment Workflow

To publish a web update that instantly delivers to all installed user devices without requiring an APK re-install:

```bash
# 1. Update your code in app.js, visual-guides.js, habits-tracker.js, etc.

# 2. Run the automated OTA publisher (bumps version and syncs assets):
node publish-ota.js patch "Detailed release notes for athletes"

# 3. Commit and push to GitHub:
git add .
git commit -m "ota: release v0.05.x - new features and performance enhancements"
git push origin main
```

Upon pushing:
1. GitHub Actions detects the push and compiles a fresh `GymPlan.apk` release.
2. User devices polling `ota-manifest.json` immediately detect the new build number.
3. Athletes tap **"⬇ Install Live Update Now"** inside the app to hot-swap assets in 2 seconds.

---

## 📖 Downloadable Interactive User Manual (PDF)

A complete, high-resolution printable manual formatted specifically for end users and athletes is provided in the [`manual/`](manual/) directory:

- **Interactive Features:** Clickable Table of Contents with instant internal bookmarks, full 7-12-15 science, 6-day split guides, habit management instructions, and troubleshooting.
- **Source HTML:** [`manual/My-Gym-Plan-Athletic-Manual.html`](manual/My-Gym-Plan-Athletic-Manual.html)
- **1-Click PDF Generation:** Double click [`manual/generate-pdf.bat`](manual/generate-pdf.bat) on Windows or open the HTML file in any modern browser and select **Print (Ctrl + P) ➔ Destination: Save as PDF**.

---

## 🏢 About CodeByTushu Studio & Credits

**My GYM Plan (IronTracker)** is designed, engineered, and published by **CodeByTushu Studio**.

- **Official Website:** [https://codebytushu.com](https://codebytushu.com)
- **Mobile Apps Hub:** [https://codebytushu.com/apps/](https://codebytushu.com/apps/)
- **Lead Architect & Developer:** Tushpendra Kumar
- **Documentation Repository:** [https://github.com/CodeByTushu/my-gym-plan-docs](https://github.com/CodeByTushu/my-gym-plan-docs)
- **Core Engine Repository:** [https://github.com/Tushpendra-Kumar/my-gym-plan](https://github.com/Tushpendra-Kumar/my-gym-plan)

*Discipline Equals Freedom. Train Heavy. Stay Consistent.* ⚡
