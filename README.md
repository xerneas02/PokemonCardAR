# Pokémon Card AR

> [**Showcase Video**](https://youtu.be/E9LXZgkXa18?si=ZwU1s0Pt_soL1h0f)

---

## 📦 Project Overview

**Pokémon Card AR** is an augmented reality sketch built with **Processing** and **ARToolKit**. When you point your webcam at a Pokémon marker (image target), a 3D model of that Pokémon pops up, complete with particle effects, animations, and configurable flame overlays!

![image](https://github.com/user-attachments/assets/78d4f2dd-b587-41be-b6e0-81f3aa16e529)

![image](https://github.com/user-attachments/assets/c6eafd15-21be-4dd6-96a1-b7ea05e65ca4)


The code is organized so you can see each piece’s responsibility and easily **add new Pokémon** to your own AR experience.

---

## ⚙️ How It Works

1. **`PokemonCardAR.pde`**: Initializes the ARToolKit engine, loads camera parameters, scans the `data/` folder for markers, and delegates detection events to submodules.
2. **Marker Tracking** (`Card.pde`): Uses ARToolKit to detect printed marker images and calculate their pose in 3D space.
3. **Model Loading** (`Card.pde`): When a marker is found, the sketch loads the corresponding 3D model (`.obj`, `.fbx`, or `.dae`), material (`.mtl`), and textures (`*.png`) from `data/<Pokemon>/`.
4. **Rendering & Effects**

   * **`Flame.pde`**: Renders configurable flame overlays around the model, based on a `flame.config` file in each Pokémon folder.
   * **`Particle.pde`**: Generates ambient particles rising around the model for extra visual flair.


---

## 📁 Project Structure

```
PokemonCardAR/
├── data/
│   ├── Charizard/      # 3D model (.obj/.fbx/.dae), material (.mtl), textures (.png), and marker files (.iset/.fset/.fset3)
│   ├── Pikachu/        # Same structure for Pikachu
│   ├── ...             # Other Pokémon folders
│   └── camera_para.dat # ARToolKit camera calibration file
├── PokemonCardAR.pde   # Main sketch: AR initialization & event loop
├── Card.pde            # Marker detection & 3D model placement logic
├── Flame.pde           # Flame overlay effect rendering
├── Particle.pde        # Particle system
└── README.md           # This document
```

---

## 🚀 Installation & Setup

1. **Install Processing** (version 3.5+)

   * Download from [processing.org](https://processing.org).
2. **Clone or download** this repo into your Processing sketchbook folder.
3. **Add ARToolKit library**: Copy the `artoolkit` folder into `~/Documents/Processing/libraries/`.
4. **Print your markers**: Use each `Marker_<Name>.png` in `data/<Pokemon>/` as your physical AR cards.
5. **Verify camera calibration**: Ensure `camera_para.dat` is in `data/`.

---

## ▶️ Usage

1. Open **PokemonCardAR.pde** in Processing.
2. Click **Run** (▶️) to launch the sketch with webcam access.
3. Point your camera at any Pokémon card registered.
4. Watch that Pokémon appear in 3D.

---

## 🆕 Adding Your Own Pokémon

1. **Create a folder** in `data/` named exactly after your Pokémon (e.g., `Bulbasaur/`).
2. **Place these files** inside that folder:

   * **3D model**: `.obj`, `.fbx`, or `.dae`
   * **Material**: `.mtl`
   * **Textures**: all required `.png` images
   * **Marker definitions**: `.iset`, `.fset`, and `.fset3` generated via ARToolKit’s `mk_patt` tool
   * **Flame config** (optional): `flame.config` to tweak color, size, and speed of overlays
3. **Ensure** `camera_para.dat` is accessible (either at root `data/` or copied into your folder).
4. **Run the sketch**. The main script auto-scans `data/` by folder name—no extra code edits required!

For a guided tutorial on adding new Pokémon, watch:
[https://youtu.be/DKDLUqVoHVw?si=U8twDkF\_-YK2Wsjw](https://youtu.be/DKDLUqVoHVw?si=U8twDkF_-YK2Wsjw)
*Excuse my French accent!*

---

## 🎨 Customization

* **Flame Effects**: Edit `data/<Pokemon>/flame.config` to change overlay color, opacity, and animation speed.
* **Particle Behavior**: Adjust spawn rate, velocity, size, and lifetime parameters in `Particle.pde`.
* **Model Transform**: In `Card.pde`, tweak the positioning and scaling matrices to fit each model perfectly.

---

## 📜 License

This project is released under the **MIT License**.
