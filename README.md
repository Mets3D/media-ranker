# Media Ranker

An Elo-based 1v1 image and video ranking tool that runs in your browser. Pick your favourite between two media files, and over time a ranked leaderboard emerges from your choices.

## Requirements

- A modern browser
- Python (for the local HTTP server)

## Getting Started

Media Ranker must be served over HTTP — it won't work if you open the HTML file directly. Use the included launch script for your platform:

| Platform | File | How to run |
|----------|------|------------|
| Windows | `media-ranker_windows.bat` | Double-click |
| Mac | `media-ranker_mac.command` | Double-click (first run: `chmod +x media-ranker_mac.command` in Terminal) |
| Linux | `media-ranker_linux.sh` | Run in Terminal, or `chmod +x media-ranker_linux.sh` then double-click |

The script starts a local server on port 8080 and opens the app in your browser.

## Setup

On first launch you'll see the setup screen. You need to configure three things:

1. **Media folder**: Folder containing the images and videos you want to rank. Toggle "include subfolders" to scan recursively.
1. **Rankings file (JSON)**: Where your ranking data is saved.
1. **Backup folder** *(optional)*: Folder where timestamped backups are saved every 2 minutes while you're ranking.

Once a media folder and JSON file are selected, click **Start Ranking**.

Your folder and file selections are remembered between sessions. On relaunch, click **⟳ reconnect saved session** to restore them without re-selecting.

## Ranking

Two media files are shown side by side. Pick the one you prefer — the winner gains Elo points, the loser loses them. Over many battles, a ranked leaderboard emerges.

### Hotkeys

| Key | Action |
|-----|--------|
| `←` / `A` | Pick left |
| `→` / `D` | Pick right |
| `↑` / `S` | Skip |
| `M` | Toggle audio (videos only) |
| `Space` | Pause / resume videos |
| `W` | Toggle winner stays mode |
| `B` | Switch to Battle tab |
| `R` | Switch to Rankings tab |
| `F` | Toggle cinematic / fullscreen |
| `Esc` | Exit cinematic mode / close lightbox |

### Winner Stays

Enable **winner stays** (hotkey: `W`) to keep the winning file on screen and face a series of opponents. The winner keeps fighting until they reach rank #1, or if you use Skip, at which point normal matchmaking resumes.

### Duplicates

If two files are byte-for-byte identical, a warning banner appears and the Pick buttons change to Delete. Choose which copy to delete from disk — the other is kept. Duplicate resolution doesn't affect Elo.

## Rankings Tab

Browse the full ranked leaderboard for the current session. Unranked files (not yet battled) appear dimmed at the bottom.

## Data

Rankings are stored in a JSON file. The schema is:

```json
{
  "battleCount": 142,
  "rankings": {
    "<sha256-hash>": {
      "hash": "...",
      "elo": 1284,
      "matches": 12,
      "wins": 8,
      "names": ["filename.jpg"]
    }
  }
}
```

Files are identified by their full SHA-256 hash, so renaming a file doesn't lose its ranking history. If you rank different folders in different sessions, all data accumulates in the same JSON file — but the leaderboard only shows files present in the current session.

## Elo System

- Starting Elo: **1200** (or the current session average for new files.)
- K-factor: **32**
- Normal matchmaking prioritises files with fewer battles, with Elo proximity as a tiebreaker.
- "Winner stays" matchmaking prioritises Elo proximity to find worthy opponents for the reigning winner.

## AI Disclaimer
This project was entirely vibecoded with my voice, with a broken hand, using Claude Sonnet 4.6.

## Screenshots
<img width=720 src="/docs/screenshot1.jpg"></img>
<img width=720 src="/docs/screenshot2.jpg"></img>
<img width=720 src="/docs/screenshot3.jpg"></img>