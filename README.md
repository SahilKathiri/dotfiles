# Dotfiles

Personal configuration files for macOS and Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Package Details](#package-details)
  - [zsh](#zsh)
  - [nvim](#nvim)
  - [tmux](#tmux)
  - [git](#git)
  - [ssh](#ssh)
  - [ghostty](#ghostty)
  - [ohmyposh](#ohmyposh)
  - [lazygit](#lazygit)
- [Machine-Specific Configuration](#machine-specific-configuration)
- [Troubleshooting](#troubleshooting)

---

## Overview

Each top-level directory is a Stow package. Running `stow <package>` creates symlinks from the package contents into `$HOME`, mirroring the directory structure. The included `.stowrc` sets `--target=$HOME` so you never need to pass `-t ~` manually.

```
dotfiles/
├── .stowrc          # Sets stow target to $HOME
├── ghostty/         # Terminal emulator config
├── git/             # Git config (personal + work profiles)
├── lazygit/         # Lazygit TUI config
├── nvim/            # Neovim (LazyVim) config
├── ohmyposh/        # Shell prompt themes
├── ssh/             # SSH config for multiple GitHub accounts
├── tmux/            # Tmux config + plugins
└── zsh/             # Zsh config with Zinit
```

---

## Prerequisites

### macOS — one command

```sh
brew install stow zsh neovim git tmux lazygit oh-my-posh fzf eza zoxide bat git-delta ripgrep fd mise gh yazi && \
brew install --cask ghostty font-jetbrains-mono-nerd-font
```

### Linux — one command

Install [Homebrew for Linux](https://brew.sh) first (recommended, ensures version parity), then:

```sh
brew install stow zsh neovim git tmux lazygit oh-my-posh fzf eza zoxide bat git-delta ripgrep fd mise gh yazi
```

Then install the font manually:
```sh
mkdir -p ~/.local/share/fonts
curl -fLo /tmp/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
```

For Ghostty on Linux, see [ghostty.org/download](https://ghostty.org/download).

> **Note:** Oh My Posh, mise, and yazi require Homebrew on Linux for the versions expected by these configs.

### Full tool reference

| Tool | Purpose |
|------|---------|
| `stow` | Symlink manager |
| `zsh` | Shell |
| `neovim` | Editor (LazyVim) |
| `git` | Version control |
| `tmux` | Terminal multiplexer |
| `lazygit` | Git TUI |
| `oh-my-posh` | Shell prompt |
| `fzf` | Fuzzy finder |
| `eza` | Modern `ls` |
| `zoxide` | Smart `cd` |
| `bat` | Syntax-highlighted `cat` + man pages |
| `git-delta` | Better git diffs |
| `ripgrep` | Fast `grep` |
| `fd` | Fast `find` |
| `mise` | Runtime version manager (replaces nvm/pyenv) |
| `gh` | GitHub CLI |
| `yazi` | Terminal file manager |
| `ghostty` | Terminal emulator |
| `font-jetbrains-mono-nerd-font` | Font (icons in prompt, nvim, yazi) |

### Ghostty (terminal)

- **macOS:** Download from [ghostty.org](https://ghostty.org/download)
- **Linux:** Build from source or use a distro package — see [ghostty.org/download](https://ghostty.org/download)

### Fonts

The shell prompt and terminal config use **JetBrains Mono Nerd Font**.

**macOS:**
```sh
brew install --cask font-jetbrains-mono-nerd-font
```

**Linux:**
```sh
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
```

---

## Installation

### 1. Clone the repository

```sh
git clone https://github.com/sahilkathiri/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Stow the packages you want

```sh
# All at once
stow zsh nvim tmux git ssh ghostty ohmyposh lazygit

# Or individually
stow zsh
stow nvim
# etc.
```

> Stow reads `.stowrc` and targets `$HOME` automatically. Each package directory maps to the same structure under `~`. For example, `nvim/.config/nvim/` becomes `~/.config/nvim/`.

### 3. Set Zsh as your default shell (if needed)

```sh
chsh -s $(which zsh)
```

Then restart your terminal. Zinit will auto-install on first launch.

### 4. Create machine-specific Git credentials

The git config uses local override files that are intentionally **not** committed (see [Machine-Specific Configuration](#machine-specific-configuration)).

```sh
# Required: your identity
cp ~/dotfiles/git/.gitconfig-local-example ~/.gitconfig-local
# Edit with your name, email, and GPG signing key
nvim ~/.gitconfig-local
```

### 5. Install Tmux plugins

Launch tmux, then press `Ctrl+s` + `I` (capital i) to install plugins via TPM. TPM itself will auto-install on first tmux launch if it isn't present.

### 6. Open Neovim

```sh
nvim
```

Lazy.nvim will auto-install on first launch and pull all plugins. Wait for the install to complete, then restart nvim.

---

## Package Details

### zsh

**Symlink:** `zsh/.zshrc` → `~/.zshrc`

**Plugin manager:** [Zinit](https://github.com/zdharma-continuum/zinit) — auto-installs to `~/.local/share/zinit` on first shell launch.

**Plugins:**
- `zsh-users/zsh-syntax-highlighting` — live syntax highlighting
- `zsh-users/zsh-completions` — extra completions
- `zsh-users/zsh-autosuggestions` — fish-style inline suggestions
- `Aloxaf/fzf-tab` — fzf-powered tab completion

**Shell integrations loaded at startup:**
- Oh My Posh (prompt) — requires `oh-my-posh` in PATH
- Zoxide (`cd` replacement)
- FZF

**Aliases:**
```
ls  → eza
vi  → nvim
vim → nvim
```

**History:** 5000 lines, deduplication, shared across sessions.

**SSH agent:** Started automatically; loads `~/.ssh/id_ed25519` and `~/.ssh/id_personal`.

**NVM:** Sourced from `~/.nvm` if present.

---

### nvim

**Symlinks:**
- `nvim/.config/nvim/` → `~/.config/nvim/`

**Base:** [LazyVim](https://www.lazyvim.org/) — a full Neovim distribution built on [lazy.nvim](https://github.com/folke/lazy.nvim).

Lazy.nvim auto-installs to `~/.local/share/nvim/lazy/lazy.nvim` on first launch.

**LazyVim extras enabled** (`lazyvim.json`):
- `lazyvim.plugins.extras.ai.copilot`
- `lazyvim.plugins.extras.ai.copilot-chat`
- `lazyvim.plugins.extras.coding.yanky`
- `lazyvim.plugins.extras.editor.inc-rename`
- `lazyvim.plugins.extras.lang.go`
- `lazyvim.plugins.extras.util.project`

**Key plugins (from `lazy-lock.json`):**
- Completion: `blink.cmp`, `friendly-snippets`
- LSP: `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig`
- Treesitter: `nvim-treesitter`, `nvim-treesitter-textobjects`
- UI: `bufferline.nvim`, `lualine.nvim`, `noice.nvim`, `snacks.nvim`
- Git: `gitsigns.nvim`
- AI: `copilot.lua`, `CopilotChat.nvim`
- Theme: `catppuccin`, `tokyonight.nvim`

**Config locations:**
- Plugin specs: `~/.config/nvim/lua/plugins/`
- Options/keymaps/autocmds: `~/.config/nvim/lua/config/`
- Lock file (pinned versions): `~/.config/nvim/lazy-lock.json`
- Plugin data: `~/.local/share/nvim/lazy/`
- State/cache: `~/.local/state/nvim/`, `~/.cache/nvim/`

**Formatting:** Stylua (2-space indent, 120 col width) — configured in `~/.config/nvim/stylua.toml`.

---

### tmux

**Symlink:** `tmux/.tmux.conf` → `~/.tmux.conf`

**Plugin manager:** [TPM](https://github.com/tmux-plugins/tpm) — auto-installs to `~/.tmux/plugins/tpm` if missing.

**Prefix key:** `Ctrl+s` (replaces default `Ctrl+b`)

**Plugins:**
- `catppuccin/tmux` (v2.1.3) — Mocha flavour, rounded windows
- `tmux-plugins/tmux-sensible` — sensible defaults
- `tmux-plugins/tmux-cpu` — CPU in status bar
- `tmux-plugins/tmux-battery` — battery in status bar

**Key bindings:**
| Key | Action |
|-----|--------|
| `Ctrl+s \|` | Split pane horizontal |
| `Ctrl+s -` | Split pane vertical |
| `Ctrl+s h/j/k/l` | Navigate panes (vim-style) |
| `Ctrl+s r` | Reload config |
| `Ctrl+s I` | Install plugins (TPM) |

**Status bar:** Application · CPU · Session · Uptime · Battery

---

### git

**Symlinks:**
- `git/.gitconfig` → `~/.gitconfig`
- `git/.gitconfig-personal` → `~/.gitconfig-personal`
- `git/.gitconfig-work` → `~/.gitconfig-work`
- `git/.gitignore_global` → `~/.gitignore_global`
- `git/.gitconfig-local-example` → `~/.gitconfig-local-example`

**Profile system:** Git uses conditional includes to load different identities based on which directory you're working in:

| Directory | Config loaded |
|-----------|--------------|
| `~/Projects/` | `~/.gitconfig-work` → `~/.gitconfig-work-local` |
| `~/Code/` | `~/.gitconfig-personal` → `~/.gitconfig-personal-local` |
| `~/dotfiles/` | `~/.gitconfig-personal` → `~/.gitconfig-personal-local` |
| anywhere else | `~/.gitconfig-local` |

**SSH host aliases** (in `.gitconfig-personal` and `.gitconfig-work`):
```
git@github-personal: → git@github.com (uses ~/.ssh/id_personal)
git@github-work:     → git@github.com (uses ~/.ssh/id_ed25519)
```

**GPG signing:** Enabled for commits and tags in both work and personal profiles.

**Files you must create yourself** (not committed, listed in `.gitignore_global`):

```sh
# ~/.gitconfig-local (base identity)
[user]
    name = Your Name
    email = you@example.com
    signingkey = YOUR_GPG_KEY_ID

# ~/.gitconfig-work-local (work identity)
[user]
    name = Your Name
    email = you@work.com
    signingkey = YOUR_WORK_GPG_KEY_ID

# ~/.gitconfig-personal-local (personal identity)
[user]
    name = Your Name
    email = you@personal.com
    signingkey = YOUR_PERSONAL_GPG_KEY_ID
```

Use `.gitconfig-local-example` as a starting template:
```sh
cp ~/.gitconfig-local-example ~/.gitconfig-local
```

---

### ssh

**Symlink:** `ssh/.ssh/config` → `~/.ssh/config`

Configures two separate SSH identities for GitHub, enabling you to have distinct work and personal accounts:

```
Host github-work
    HostName github.com
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
    AddKeysToAgent yes

Host github-personal
    HostName github.com
    IdentityFile ~/.ssh/id_personal
    IdentitiesOnly yes
    AddKeysToAgent yes
```

**Generate the keys if they don't exist:**
```sh
# Work key
ssh-keygen -t ed25519 -C "you@work.com" -f ~/.ssh/id_ed25519

# Personal key
ssh-keygen -t ed25519 -C "you@personal.com" -f ~/.ssh/id_personal
```

Add both public keys to their respective GitHub accounts under **Settings → SSH and GPG keys**.

**Using the aliases:**
```sh
# Clone a work repo
git clone git@github-work:your-org/repo.git

# Clone a personal repo
git clone git@github-personal:your-username/repo.git
```

**macOS:** Keys are added to the keychain automatically via `AddKeysToAgent yes`.

**Linux:** You may need to start `ssh-agent` in your shell profile or use a systemd user service. The `.zshrc` handles this automatically.

---

### ghostty

**Symlink:** `ghostty/.config/ghostty/config` → `~/.config/ghostty/config`

Ghostty reads its config from `~/.config/ghostty/config` on both macOS and Linux — no platform difference.

**Settings:**
- Font: JetBrains Mono Nerd Font, size 14
- Theme: Flexoki Dark
- Scrollback: 100,000 lines
- Shell integration: enabled (cursor, sudo, title)

**macOS-only settings in config:** titlebar style, option-as-alt, window shadow — these are silently ignored on Linux.

**Key bindings:**

| Key | Action |
|-----|--------|
| `Super+T` | New tab |
| `Super+W` | Close tab |
| `Super+N` | New window |
| `Super+Shift+N` | Split right |
| `Super+Shift+D` | Split down |
| `Super+Shift+[` / `]` | Previous / next tab |
| `Super+1–9` | Go to tab N |
| `Super+↑` / `↓` | Jump to previous / next prompt |
| `Super+Shift+K` | Clear screen |
| `Super+Shift+F` | Fullscreen |

---

### ohmyposh

**Symlinks:**
- `ohmyposh/.config/ohmyposh/zen.toml` → `~/.config/ohmyposh/zen.toml`
- `ohmyposh/.config/ohmyposh/catpuccin.toml` → `~/.config/ohmyposh/catpuccin.toml`

The active theme is set in `.zshrc`:
```sh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
```

**Zen theme** (default): minimal two-segment prompt showing path, git status, and execution time. Transient prompt collapses to `❯`.

**Catppuccin theme**: fuller prompt with OS icon, username, hostname, and branch info.

To switch themes, edit line 75 of `~/.zshrc` and change the `--config` path.

Oh My Posh config lives in `~/.config/ohmyposh/` on both macOS and Linux — no platform difference.

---

### lazygit

**Symlink:** `lazygit/.config/lazygit/config.yml` → `~/.config/lazygit/config.yml`

> **Note:** On macOS, lazygit also looks for config at `~/Library/Application Support/lazygit/config.yml`. Because this setup uses `XDG_CONFIG_HOME=$HOME/.config` (set in `.zshrc`), it will correctly pick up `~/.config/lazygit/config.yml` on both platforms.

Settings: auto-fetch, auto-refresh, fetch-all enabled.

---

## Machine-Specific Configuration

These files are excluded from the repo (via `.gitignore_global`) and must be created on each machine:

| File | Purpose |
|------|---------|
| `~/.gitconfig-local` | Base git identity (name, email, GPG key) |
| `~/.gitconfig-work-local` | Work git identity |
| `~/.gitconfig-personal-local` | Personal git identity |

Use the provided example as a template:
```sh
cp ~/.gitconfig-local-example ~/.gitconfig-local
nvim ~/.gitconfig-local
```

---

## Troubleshooting

**`stow` conflicts on existing files**

If a file already exists at the target path (e.g. `~/.zshrc`), stow will refuse to overwrite it. Back up and remove it first:
```sh
mv ~/.zshrc ~/.zshrc.bak
stow zsh
```

**`oh-my-posh: command not found`**

Oh My Posh is not installed or not in `PATH`. Install it:
```sh
brew install oh-my-posh
```
On Linux without Homebrew, see the [Oh My Posh install docs](https://ohmyposh.dev/docs/installation/linux).

**Neovim: `module 'nvim-treesitter.query_predicates' not found`**

This happens when nvim-treesitter and LazyVim are out of sync. Run `:Lazy sync` inside nvim to update all plugins together.

**Tmux plugins not loading**

TPM must be installed first. If it wasn't auto-installed:
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Then open tmux and press `Ctrl+s` + `I`.

**SSH keys not loading on Linux**

The `.zshrc` starts `ssh-agent` and runs `ssh-add`. If you're not using zsh as your login shell, you may need to start the agent separately or configure a systemd user service:
```sh
systemctl --user enable --now ssh-agent
```

**Lazygit config not found on macOS**

Ensure `XDG_CONFIG_HOME` is set (it is in `.zshrc`). If lazygit is launched before zsh initialises the variable, it may fall back to `~/Library/Application Support/lazygit/`. Either symlink that path or ensure the env var is set in your shell profile.
