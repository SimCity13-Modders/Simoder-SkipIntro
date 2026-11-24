# Simoder-SkipIntro

[![Download Latest (Nightly)](https://img.shields.io/github/last-commit/SimCity13-Modders/Simoder-SkipIntro/main?label=Download%20latest%20(nightly)&logo=github)](https://github.com/SimCity13-Modders/Simoder-SkipIntro/archive/refs/heads/main.zip)
[![Download Latest Release](https://img.shields.io/github/v/release/SimCity13-Modders/Simoder-SkipIntro?label=Download%20latest%20release&logo=github)](https://github.com/SimCity13-Modders/Simoder-SkipIntro/releases/latest)
[![Star](https://img.shields.io/github/stars/SimCity13-Modders/Simoder-SkipIntro?style=social)](https://github.com/SimCity13-Modders/Simoder-SkipIntro/stargazers)

**Simoder-SkipIntro** (`simoder.skip_intro`) is a lightweight, sandboxed **Luau** mod for **Simoder** that automatically skips the SimCity startup intro movies (EA / Maxis / expansion logos) and transitions directly toward the main menu.

Because it runs inside Simoder's standard Luau sandbox using `api.game.setSkipIntro(true)`, it requires **no `dev_ui` privileges** and **no native `.dll` trust approval**.

## Dependencies & Requirements

- **Runtime**: [Simoder](https://github.com/SimCity13-Modders/Simoder) (`d3d9.dll`)
- **Base Mod**: [Simoder-Base](https://github.com/SimCity13-Modders/Simoder-Base) (`mods/simoder.base`) with `api.game.setSkipIntro` support

## Installation

1. Install [Simoder](https://github.com/SimCity13-Modders/Simoder) and [Simoder-Base](https://github.com/SimCity13-Modders/Simoder-Base).
2. Download `Simoder-SkipIntro` from the **Release** or **Nightly** badge above (or clone this repository).
3. Copy the mod folder into `<SimCity Install>\mods\simoder.skip_intro\`:

```text
<SimCity Install>/
  mods/
    simoder.skip_intro/
      mod.toml
      scripts/
        main.luau
```

4. Launch SimCity, open **Mods → Installed Mods** in the launcher, and click **Enable** on **Skip Intro**.

---

## How It Works

- On enable, `scripts/main.luau` calls `api.game.setSkipIntro(true)` on Simoder's frozen mod facade.
- `Simoder-Base`'s `EAWebKit` applicator sets `mSkipIntroMovie`, enables `gSessionManager.SetSkipMovie(true)`, bypasses `cCurtainUIHandler.prototype.{Show, PlayIntroMovie}`, and stops any already-playing intro movie immediately.
- Disabling the mod in **Installed Mods** automatically revokes the `skipIntro` flag.
