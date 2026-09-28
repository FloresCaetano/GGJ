# When The Rooster Crowns

A narrative 2D game built in Godot 4 for Global Game Jam, centered on a **mask-selection mechanic**: dialogue choices don't just branch the story — they hand the player a literal mask that recolors both the character and the scene around them.

**Semifinalist — Global Game Jam+ São Paulo 2026.**
Built and led by a 12-person team (director, lead programmer, co-designer role).

## Core Systems

- **Dialogue system** (`dialog_system/`) — a typewriter-style dialogue box driven by exported `DialogData` resources, with per-line skip handling and conditional branches gated on which mask the player has selected (`dialog.mask_selected`).
- **Mask mechanic** (`mask_system/`) — each `Mask` carries a `player_value` / `scene_value` pair that's added into running hue totals (`GAMEMANAGER.current_player_hue` / `current_background_hue`), then pushed into a shader parameter on the player and every node in the `background` group. Picking a mask is a real-time visual and tonal shift, not just a UI choice.
- **Mask inventory** (`MaskInventory`) — handles opening/closing the selection tray and the pick-up animation that carries the chosen mask from the tray to the player's equipped slot, using duplicated placeholder nodes so the "real" mask instances stay untouched during the tween.
- **Room-based structure** (`rooms/`) — each story beat lives in its own self-contained room scene, keeping content additions isolated from the core systems.
- **Autoload core** (`core/GAMEMANAGER.gd`, `core/PATHS.gd`) — centralizes cross-scene state and node references so dialogue, masks, and rooms can talk to each other without deep scene-tree lookups.

## Requirements

- Engine: Godot 4.x
- Open the project root from the Godot Project Manager and run `first_scene.tscn`.
