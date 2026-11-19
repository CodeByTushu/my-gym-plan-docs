# Data Governance, Schema & Cryptographic Security

This document specifies the client-side data architecture, `localStorage` schemas, cryptographic hashing, and automated data lifecycle policies of **My GYM Plan (IronTracker)**.

---

## 1. Zero-Cloud Privacy Architecture

My GYM Plan adheres to a strict **Zero-Cloud, Device-Only Data Policy**:
- **No Remote User Accounts:** Athlete profiles exist exclusively on the local device.
- **No Third-Party Analytics:** Zero SDKs, telemetry collectors, tracking pixels, or advertisement IDs.
- **Offline Integrity:** All data operations are atomic and execute synchronously against the device's local storage engine.

---

## 2. LocalStorage Key Registry (The 14 Core Partitions)

All application state is partitioned across 14 dedicated `tushu_*` keys in `window.localStorage`:

| Key Name | Type | Description |
| :--- | :--- | :--- |
| `tushu_gym_athlete_v1` | `Object` | Athlete profile (Name, Diet, Master PIN Hash, Onboarding state) |
| `tushu_gym_custom_exercises` | `Object` | User-edited reps, weights, notes, and custom exercises |
| `tushu_gym_logs_v1` | `Object` | Daily logged sets, weights, and timestamps (ISO `YYYY-MM-DD`) |
| `tushu_gym_history_v1` | `Array` | Sequential history array of completed workout sessions |
| `tushu_gym_pr_records` | `Object` | All-time Personal Record (PR) weights indexed by exercise ID |
| `tushu_gym_settings_v1` | `Object` | Rest timer durations (60s/90s/120s), sound, and vibration toggles |
| `tushu_room_fitness_v1` | `Object` | Room fitness Daily Essentials check-in and 48h recovery timestamps |
| `tushu_habits_v2_list` | `Array` | Registry of active habits (11 defaults + user-added custom habits) |
| `tushu_habits_v2_logs` | `Object` | Daily habit check-in states (`{ "2026-11-19": { "habit_1": true } }`) |
| `tushu_habits_v2_streaks` | `Object` | Computed streak counters, best streaks, and monthly statistics |
| `tushu_diet_plan_v1` | `Object` | Macro goals, meal selections, and caloric targets |
| `tushu_app_theme_v1` | `String` | Theme preference token (`monochrome-dark` / `monochrome-light`) |
| `tushu_ota_manifest_cache` | `Object` | Cached OTA metadata (current version, buildNumber, last checked) |
| `tushu_retention_policy_v1`| `Object` | Automated 6-month log pruning configuration |

---

## 3. Cryptographic SHA-256 PIN Vault

To protect athlete privacy without relying on remote servers, athlete PIN authentication uses the native Web Crypto API:

```javascript
// Cryptographic PIN Verification Algorithm
async function verifyPin(inputPin, storedHash) {
  const encoder = new TextEncoder();
  const saltedData = encoder.encode(inputPin + "_tushu_salt_2026");
  const hashBuffer = await crypto.subtle.digest('SHA-256', saltedData);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const computedHash = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  return computedHash === storedHash;
}
```

- Raw PINs are never stored in plain text or written to logs.
- The salt string (`_tushu_salt_2026`) prevents pre-computed rainbow table attacks.
- High-risk operations (e.g., Hard Reset / Clear Device Data) strictly enforce PIN verification.

---

## 4. 1-Click JSON Backup Snapshot & Restore

Athletes can export their entire training history to a standardized JSON file (`my-gym-plan-backup.json`):

```json
{
  "version": "0.05.3",
  "exportDate": "2026-11-19T13:30:00.000Z",
  "app": "My GYM Plan (IronTracker)",
  "publisher": "CodeByTushu Studio",
  "data": {
    "athlete": { ... },
    "gymLogs": { ... },
    "gymHistory": [ ... ],
    "personalRecords": { ... },
    "roomFitness": { ... },
    "habits": { ... },
    "nutrition": { ... }
  }
}
```

The restore engine validates schema versions and performs an atomic bulk write, followed by an immediate UI re-render.

---

## 5. Automated 6-Month Log Retention Policy

To preserve device performance and prevent unnecessary database growth on low-memory Android hardware, the app includes an automated pruning algorithm:
- Evaluates log dates against `ISO_DATE_STRING <= NOW() - 180 Days`.
- Prunes historical daily logs while permanently safeguarding all-time PR weights and lifetime streak records.
