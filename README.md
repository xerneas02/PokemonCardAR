# Pokémon Card AR

> [**Showcase Video**](https://youtu.be/E9LXZgkXa18?si=ZwU1s0Pt_soL1h0f)

---

## 📦 Project Overview

**Pokémon Card AR** is an augmented reality sketch built with **Processing** and **ARToolKit**. When you point your webcam at a Pokémon marker (image target), a 3D model of that Pokémon pops up, complete with particle effects, animations, and configurable flame overlays!

The project is structured to make it easy to explore, customize, and—most importantly—**add your own Pokémon** to the experience.

---

## ⚙️ How It Works

1. **Marker Tracking**

   * Uses ARToolKit to detect specific printed markers via your webcam.
2. **Model Loading**

   * For each recognized marker, the corresponding folder in `data/` (e.g., `data/Charmander/`) contains:

     * **3D model files** (`.obj`, `.fbx`, `.dae`)
     * **Material definitions** (`.mtl`)
     * **Texture images** (`*.png`)
     * **Marker definition files** (`.iset`, `.fset`, `.fset3`)
     * **Optional flame configuration file** (`flame.config`)
3. **Rendering & Effects**

   * `Card.pde` handles the high‐level AR loop and draws the 3D model.
   * `Flame.pde` adds a configurable flame or ice overlay effect around the model.
   * `Particle.pde` generates rising particle effects (embers, snowflakes, etc.).

---

## 📁 Project Structure

```
PokemonCardAR/
├── data/
│   ├── Charizard/      # Example: all files for Charizard marker
│   ├── Pikachu/        # Example: all files for Pikachu marker
│   ├── ...             # Other Pokémon folders
│   └── camera_para.dat # ARToolKit camera calibration data
├── Card.pde            # Main AR sketch: tracking + model render
├── Flame.pde           # Overlay effect (flames)
├── Particle.pde        # Particle system
├── README.md           # This document
└── LICENSE             # MIT License
```

---

## 🚀 Installation & Setup

1. **Install Processing** (version 3.5+)

   * Download from [processing.org](https://processing.org).
2. **Download/Clone this repo** into your Processing sketches folder.
3. **Install ARToolKit for Processing**:

   * Copy the `artoolkit` library folder into your Processing `libraries/` directory.
4. **Print your markers**:

   * Use the `.png` files inside each `data/[Pokémon]/Marker_*.png` as printed targets.
5. **Calibrate your camera**:

   * Ensure `camera_para.dat` is present in the `data/` folder.

---

## ▶️ Usage

1. Open **Card.pde** in Processing.
2. Click **Run** (▶️) to start the webcam and AR engine.
3. Point your camera at a printed Pokémon marker.
4. Enjoy the 3D model + effects!

---

## 🆕 Adding Your Own Pokémon

1. **Create a new folder** in `data/` named after your Pokémon (e.g., `Bulbasaur/`).
2. **Create or obtain**:

   * A **3D model** (`.obj`, `.fbx`, or `.dae`).
   * Corresponding **material** (`.mtl`) and **textures** (`.png`).
3. **Create marker definitions**:

   * Use ARToolKit’s `mk_patt` tool to convert your marker image into `*.iset`, `*.fset`, `*.fset3` files.
   * Name them `Marker_<YourName>.iset`, etc.
4. **Copy** `camera_para.dat` into your new folder or keep it at `data/` root.
5. **Reference your folder**:

   * In `Card.pde`, add your Pokémon’s folder name to the list of tracked markers.

For a step-by-step walkthrough, watch this tutorial video (excuse my bad accent I am French):
[https://youtu.be/DKDLUqVoHVw?si=U8twDkF\_-YK2Wsjw](https://youtu.be/DKDLUqVoHVw?si=U8twDkF_-YK2Wsjw)

---

## 🎨 Customization

* Add particle effect : Tweak colors, positions with `flame.config` in your pokemon folder (exemple can be found in Charmender and Charmeleon folder).

---

## 📜 License

This project is released under the **MIT License**. See [LICENSE](LICENSE) for details.
