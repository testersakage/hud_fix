# HUD Fix for Luanti (Minetest)

<img width=384, height=176, src="https://github.com/testersakage/hud_fix/blob/main/screenshots/hud_fix.png"></img>

[Japanese Documentation (README.md)](./README.md)

A Luanti (formerly Minetest) mod that resolves layout conflicts and organizes HUD (heads-up display) text elements in the lower-left corner when multiple mods are used simultaneously.
It beautifully consolidates and stacks information from three major protection mods into a clean vertical list on the left side of the screen.

## ✨ Features

- **3-Mod Layout Conflict Resolution**: 
  Brings overlapping or scattered HUD elements into a neatly organized stack in the lower-left corner, ordered from bottom to top:
  1. **Protector Redo** (Bottom / 1 line)
  2. **Chunk Protection** (Middle / 2 lines)
  3. **Areas** (Top / Dynamic lines. Placed on top so it expands upward without covering other HUDs)
- **In-Game Settings Support**:
  Allows pixel-perfect position fine-tuning and text color customization for each mod via the Luanti settings menu.
- **Safe & Non-Destructive Design**:
  Modifies the HUD layout without overwriting or patching the core code of the target mods. Your custom positions will not be reset when those mods are updated.

## ⚙️ Configuration

Go to Luanti's main menu ＞ **Settings** ＞ **Content: Mods** ＞ select **`hud_fix`** to customize the following values:

| Setting Key | Description | Default Value |
| :--- | :--- | :--- |
| **Protector X Offset** | Protector HUD horizontal position (in pixels) | `8` |
| **Protector Y Offset** | Protector HUD vertical position (in pixels) | `-20` |
| **Protector HUD Color** | Protector HUD text color (Hex color code) | `#FFFF22` |
| **Chunk Protect X Offset** | Chunk Protection HUD horizontal position (in pixels) | `8` |
| **Chunk Protect Y Offset** | Chunk Protection HUD vertical position (in pixels) | `-40` |
| **Chunk Protect HUD Color** | Chunk Protection HUD text color (Hex color code) | `#FFFFFF` |
| **Areas X Offset** | Areas HUD horizontal position (in pixels) | `5` |
| **Areas Y Offset** | Areas HUD vertical position (in pixels) | `-85` |
| **Areas HUD Color** | Areas HUD text color (Hex color code) | `#FFFFFF` |

*Note: Please re-join the world or restart the game for configuration changes to take effect.*

## 📦 Installation

1. Download the source code from this repository.
2. Rename the extracted folder to `hud_fix`.
3. Move the folder into your Luanti `mods` folder (or world-specific `worldmods` folder).
4. **Enable** the mod in your world configurations before starting the game.

## Dependencies

- **Required**: None (Safe to enable even without the target mods installed)
- **Supported Mods**: [`Areas`](https://github.com/minetest-mods/areas/), [`Protector`](https://codeberg.org/tenplus1/protector) (Protector Redo), [`chunk_protect`](https://content.luanti.org/packages/Simon/chunk_protect/) (Chunk Protection)

## 📄 License

This project is licensed under the **MIT License**.

AI-generated: This package contains AI-generated assets or code
