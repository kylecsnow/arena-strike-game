# Arena Strike

A wave-based first-person arena shooter built with [Three.js](https://threejs.org/). Fight through escalating waves of hostiles in a compact 3D arena — hold the line as long as you can.

## How to play

Open `index.html` in a modern browser with WebGL support, or use the included launcher:

```bash
./play.sh
```

For software rendering (no GPU), pass `--sw`:

```bash
./play.sh --sw
```

Click **Enter the Arena** to start, then click the canvas to lock the mouse for aiming.

## Controls

| Input | Action |
|-------|--------|
| WASD | Move |
| Mouse | Aim & shoot |
| Shift | Sprint |
| Space | Jump |
| R | Reload |
| Tab / 1 / 2 / 3 | Switch weapons (Tab cycles rifle → shotgun → sniper) |
| Esc | Pause |

## Gameplay

You spawn in a square arena and face waves of enemies that spawn from the edges. Each wave adds more hostiles; later waves introduce tougher **tank** units alongside faster **bot** enemies. Clear a wave to earn a score bonus and partial health recovery, then the next wave begins.

Three weapons are available:

- **Rifle** — automatic, 30-round magazine
- **Shotgun** — 8 pellets per shot, 6-round magazine
- **Sniper** — high damage, 5-round magazine, scope overlay

Headshots deal extra damage. Your score tracks kills (with headshot multipliers), waves survived, and wave-clear bonuses. The run ends when your health reaches zero.

## Debug mode

The main menu has a **DEBUG MODE** button: a sandbox run with hotkey toggles for testing features by hand (a gold frame around the screen marks it as active). Toggles start OFF every time you enter debug mode.

| Key | Action |
|-----|--------|
| 1 | God mode — take no damage |
| 2 | Infinite ammo |
| 3 | One-shot kills |
| 4 | Bullet time — world at 0.3× speed, player at normal speed |
| 5 | Freeze enemies in place |
| 6 | No spread / recoil / kick |
| 7 / 8 | Spawn a bot / tank |
| 9 / 0 | Skip to next wave / clear the current wave |
| F1 | Show/hide the debug panel |
| F2 | Exit debug mode back to the main menu |

## Project structure

This is a minimal, zero-build setup:

- `index.html` — game logic, UI, and styles in a single file
- `three.min.js` — vendored Three.js runtime
- `play.sh` — convenience script to launch the game in Chrome

No package manager or bundler is required.
