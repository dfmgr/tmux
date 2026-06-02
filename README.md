## tmux

tmux is a terminal multiplexer — this repo provides a full Dracula-themed configuration with a smart status bar, session management helpers, and per-context configs (local, remote, SSH, zen).

---

### Install

Automatic install/update:

```shell
bash -c "$(curl -LSs https://github.com/dfmgr/tmux/raw/main/install.sh)"
```

Manual install:

```shell
mv -fv "$HOME/.config/tmux" "$HOME/.config/tmux.bak"
git clone https://github.com/dfmgr/tmux "$HOME/.config/tmux"
```

#### Dependencies

Debian based:

```shell
apt install tmux git curl
```

Fedora based:

```shell
dnf install tmux git curl
```

Arch based:

```shell
pacman -S tmux git curl
```

macOS:

```shell
brew install tmux git curl
```

---

### Config variants

| File | Use case | Status bar position | Accent color |
|------|----------|---------------------|--------------|
| `tmux.conf` | Local sessions | Bottom | Purple |
| `singlerc.conf` | Single-session use | Bottom | Purple |
| `tmux.remote.conf` | Remote/nested sessions | Top | Orange |
| `tmux.ssh.conf` | SSH sessions | Top | Red |
| `tmux-zen.conf` | Minimal/distraction-free | Bottom | Purple |

---

### Status bar layout

```
[MODE]│hostname│session│   window names   │[git]│[weather]│UP:uptime│HH:MM│MM/DD
```

| Segment | Description |
|---------|-------------|
| `MODE` | `TMUX` (idle) · `PRE` (prefix active) · `COPY` (copy mode) · `SYNC` (panes synced) |
| `hostname` | Short hostname (`hostname -s`) |
| `session` | tmux session name |
| window names | All windows shown, labeled by name (`PREFIX ,` to rename) |
| `git` | Branch + dirty flags (`*` unstaged · `+` staged · `?` untracked). Hidden when not in a git repo |
| `weather` | Current conditions from [wthr.top](https://wthr.top). Hidden when unavailable |
| `UP:` | System uptime in compact format (`9d:23h:54m`) |
| `HH:MM` | Current time |
| `MM/DD` | Current date |

The right side is **adaptive** — segments drop automatically on narrow terminals:
- `≥ 180 cols` — git · weather · uptime · time · date
- `≥ 120 cols` — git · time · date
- `< 120 cols` — git · time

SSH sessions never show weather.

---

### tmux-statusbar

`bin/tmux-statusbar` is the status bar helper script. All values are cached to `~/.cache/tmux/`.

```
Usage: tmux-statusbar <command>

Commands:
  git [path]    Branch + dirty flags for the git repo at path (default: CWD) — cached 5s
  weather       Current weather conditions                                    — cached 1h
  uptime        System uptime in compact Xd:Xh:Xm format                     — cached 1m
  loadavg       Load average (1/5/15 min)                                     — cached 10s
  memory        Memory usage (used/total)                                     — cached 10s
  cpu           CPU usage percentage                                          — cached 5s
  battery       Battery status (if applicable)                                — cached 1m
  help          Show this help
```

Environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `TMUX_WEATHER_SERVER` | `https://wthr.top` | Weather API server |
| `TMUX_WEATHER_LOCATION` | *(empty)* | Location for weather lookup |
| `MYLOCATION_NAME` | `New York, NY` | Alternative location variable |

---

### Prefix

`Ctrl+Space` — run `PREFIX ?` inside tmux for the full keybindings reference.

---

<p align="center">
  <a href="https://wiki.archlinux.org/index.php/tmux" target="_blank" rel="noopener noreferrer">tmux wiki</a> |
  <a href="https://tmux.github.io" target="_blank" rel="noopener noreferrer">tmux site</a>
</p>
