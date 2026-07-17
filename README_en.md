# HUD Fix for Luanti (Minetest)

<img width=413, height=136, src="https://github.com/testersakage/hud_fix/blob/main/screenshots/hud_fix.png"></img>

[Japanese Documentation (README.md)](./README.md)

A Luanti (formerly Minetest) mod that resolves and layout-adjusts HUD (heads-up display) overlap text elements in the lower-left corner when multiple mods are used simultaneously. 
By default, it fixes the issue where the text from **"Areas"** and **"Protector Redo"** overlap and become unreadable.

## ✨ Features

- **Automatic Layout Conflict Resolution**: 
  Locks the "Protector Redo" HUD at the very bottom (line 1) and shifts the "Areas" HUD just above it. Even if the "Areas" list grows dynamically into multiple lines, it will never overlap or hide the protector info.
- **In-Game Settings Support**:
  Allows pixel-perfect position fine-tuning and text color customization via the Luanti settings menu.
- **Safe & Non-Destructive Design**:
  Modifies the HUD layout without overwriting or patching the core code of the target mods. Your custom positions will not be reset when those mods are updated.

## ⚙️ Configuration

Go to Luanti's main menu ＞ **Settings** ＞ **Content: Mods** ＞ select **`hud_fix`** to customize the following values:

| Setting Key | Description | Default Value |
| :--- | :--- | :--- |
| **Protector X Offset** | Protector HUD horizontal position (in pixels) | `8` |
| **Protector Y Offset** | Protector HUD vertical position (in pixels) | `-20` |
| **Protector HUD Color** | Protector HUD text color (Hex color code) | `#FFFF22` |
| **Areas X Offset** | Areas HUD horizontal position (in pixels) | `5` |
| **Areas Y Offset** | Areas HUD vertical position (in pixels) | `-45` |
| **Areas HUD Color** | Areas HUD text color (Hex color code) | `#FFFFFF` |

*Note: Please re-join the world or restart the game for configuration changes to take effect.*

## 📦 Installation

1. Download the source code from this repository.
2. Rename the extracted folder to `hud_fix`.
3. Move the folder into your Luanti `mods` folder (or world-specific `worldmods` folder).
4. **Enable** the mod in your world configurations before starting the game.

## Dependencies

- **Required**: None (Safe to enable even without the target mods installed)
- **Supported Mods**: `areas`, `protector` (Protector Redo)

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
