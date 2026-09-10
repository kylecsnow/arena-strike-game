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
| Q / E | Lean left / right (peek around cover) |
| Tab / 1-6 | Switch weapons (Tab cycles rifle → shotgun → sniper → battleaxe → lightsaber → frag) |
| G | Throw a frag grenade without switching weapons |
| Esc | Pause |

## Gameplay

You spawn in a square arena and face waves of enemies that spawn from the edges. Each wave adds more hostiles, and the mix shifts as you survive. Clear a wave to earn a score bonus and partial health recovery, then the next wave begins.

## Hostiles

| Enemy | From | Behaviour |
|-------|------|-----------|
| **Bot** | wave 1 | Fast, fragile, keeps its distance and fires inaccurate plasma bolts. |
| **Tank** | wave 1 | Slow, heavily armoured, closes to ~11 m and hits hard. |
| **Skitter** | wave 2 | Six-legged ambusher with almost no armour. It sprints in, flares its eye cluster as a tell, then launches a ballistic pounce that hurts on contact. Dodge the landing or drop it mid-air — it telegraphs for half a second before it jumps. |
| **Weaver** | wave 4 | Floating mortar platform, and the toughest thing in the arena. Hovers above the crates on a figure-eight, then lobs arcing plasma shells that detonate for area damage. A pink ground marker shows the impact point while the shell is airborne, so keep moving and it lands behind you. It jukes sideways every time it takes a hit, so finishing one takes sustained, tracked fire. Its core is the headshot; the spinning rings are just decoration and don't stop bullets. |

Tanks, skitters and weavers all become more common as the wave number climbs.

Six weapons are available — three that fire, two that swing, and one you throw:

- **Rifle** — automatic, 30-round magazine
- **Shotgun** — 8 pellets per shot, 6-round magazine
- **Sniper** — high damage, 5-round magazine, scope overlay
- **Battleaxe** — 200 damage, cleaves everything in its sweep, but every swing is committed for 1.22s (0.55s wind-up before the blow lands, then recovery). Carrying it slows you to 0.82x speed. Slow, lumbering, and it kills anything it touches outright.
- **Lightsaber** — 55 damage per swipe, a whole swing in 0.46s, wider sweep. Less damage than the axe and no cleave, but far less committed: it is the safer weapon to be caught holding.

- **Frag** — a thrown grenade: 150 damage in a 6m blast, falling off with distance, on a 1.7s fuse. It arcs, bounces off cover and the arena walls, and detonates on the fuse **or on contact with a hostile**. You get **2 per wave** and no more: reloading never reissues them and neither does swapping weapons. The HUD always shows the allowance, so you can see what is left. Press **G** to throw one without switching weapons. Cover contains the blast — a hostile behind a crate is shielded — and your own frags never hurt you.

Melee weapons never run out of ammo and never need reloading, so they show **∞** on the HUD. Their cost is time — only the strike frame deals damage, so a swing started at the wrong moment is a wasted 1.22s with the axe.

A single swing that kills two or more enemies still earns the multi-kill banner, which is where the axe pays off: line up a pack and one chop can clear it.

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
| F3 / F4 | Spawn a skitter / weaver |
| 9 / 0 | Skip to next wave / clear the current wave |
| F1 | Show/hide the debug panel |
| F2 | Exit debug mode back to the main menu |

## Project structure

This is a minimal, zero-build setup:

- `index.html` — game logic, UI, and styles in a single file
- `three.min.js` — vendored Three.js runtime
- `play.sh` — convenience script to launch the game in Chrome

No package manager or bundler is required.
