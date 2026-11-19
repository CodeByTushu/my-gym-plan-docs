# Biomechanical Dual-Angle SVG Vector Engine

This document details the mathematical rendering pipeline and anatomical vector architecture of the **Biomechanical Exercise Engine** in My GYM Plan.

---

## 1. Vector Graphics vs Video Assets

Standard fitness applications bundle video files (MP4/WebM) or animated GIFs to demonstrate exercise form. This introduces significant issues:
- Massive APK file sizes (often 200MB – 1GB+).
- High GPU and battery drain during continuous loops.
- Inability to dynamically highlight individual muscle recruitment phases.

My GYM Plan replaces video assets with a **Mathematical Vector Engine** implemented entirely in Scalable Vector Graphics (SVG) and CSS Keyframe animations. The complete library of 65 exercises adds less than 180KB of uncompressed code.

---

## 2. Dual-Angle Anatomical Perspective

Every exercise renders two distinct geometric projections:

### A. Front View (0° Bilateral Projection)
- **Primary Focus:** Bilateral symmetry, grip width, stance width, elbow flare angles, and lateral balance.
- **Muscle Activation:** Highlights the sternal and clavicular heads of the pectoralis, anterior deltoids, rectus abdominis, biceps, and quadriceps.

### B. Side View (90° Sagittal Profile)
- **Primary Focus:** Spinal neutrality (cervical, thoracic, lumbar alignment), bar path trajectory, hip hinge angle, knee tracking relative to toes, and scapular retraction.
- **Muscle Activation:** Highlights the latissimus dorsi, erector spinae, gluteus maximus, hamstrings, and gastrocnemius.

---

## 3. Exercise Categories & Geometry Matrix

The engine categorizes 65 exercises across 19 biomechanical clusters:

| Cluster | Key Exercises | Front Geometry Characteristics | Side Profile Geometry |
| :--- | :--- | :--- | :--- |
| **Push-ups** | Standard, Diamond, Incline, Decline, Pike | Bilateral hand spacing, chest flare | 45° elbow tracking, plank lumbar line |
| **Squats & Baithak** | Bodyweight, Sumo, Pistol, Hindu Baithak | Knee valgus guard, torso verticality | Femur parallel plane, hip hinge depth |
| **Pull-ups & Rows** | Pull-up, Chin-up, Doorframe Row, Inverted | Symmetrical scapular depression | Full chest-to-bar travel, arm line |
| **Planks & Core** | Standard Plank, Hollow Body, Mountain Climbers | Shoulder-wrist perpendicular line | Posterior pelvic tilt, anti-extension |
| **Dips & Extensions** | Chair Dips, Parallel Bar Dips, Tricep Pushdown | Shoulder pack, chest opening | 90° elbow flexion, forward torso lean |
| **Leg Press & Lunges** | Barbell Lunge, Walking Lunge, Bulgarian Split | Knee-foot tracking line | 90° anterior knee angle, hip extension |
| **Overhead Press** | Barbell OHP, Dumbbell Shoulder Press | Vertical bar path, wrist alignment | Lumbar brace, head pass-through |
| **Deadlifts** | Conventional, Romanian (RDL), Sumo | Bar-shin proximity, shoulder pack | Neutral spine, hip hinge, hamstring load |

---

## 4. Keyframe Animation & Timing

Animations are driven by synchronized CSS `@keyframes` with alternating concentric and eccentric phases:
- **Concentric Phase (Effort):** 1.2s to 1.5s with cubic-bezier easing (`cubic-bezier(0.4, 0, 0.2, 1)`).
- **Peak Contraction (Isometric Hold):** 0.3s hold at peak muscle recruitment.
- **Eccentric Phase (Lowering):** 2.0s to 2.5s controlled return tempo.
