# Emacs Configuration README (Mainly for myself)

This repository contains an Emacs configuration focused on practical defaults, convenient keybindings, common programming modes, and ChatGPT integration via gptel.

WARNING: This README.md is written by gpt-5 automatically.
## Requirements

- Emacs 28+ (recommended for gptel and modern package behavior)
- Internet access for package installation
- Environment variable OPENAI_API_KEY set if using gptel

## Installation

1. Place init.el in your Emacs directory (usually ~/.emacs.d/).
2. Create an elisp/ directory under ~/.emacs.d/ for extra local Lisp files if needed.
3. Start Emacs and install packages:
   - M-x package-list-packages
   - Mark desired packages with I
   - Press x to install

Optional: Byte-compile init for slightly faster startup:
- emacs --batch -f batch-byte-compile init.el

Note: In Emacs 27+, package-initialize runs automatically at startup. For older Emacs, add (package-initialize) early in init.el.

## Package archives

Configured archives:
- MELPA: https://melpa.org/packages/
- MELPA Stable: https://stable.melpa.org/packages/
- Org ELPA: https://orgmode.org/elpa/ (use HTTPS)

Selected packages (as saved by Custom): markdown-mode, leaf-tree, leaf-convert, hydra, gptel, el-get, blackout

## Keybindings

- C-l → linum-mode (toggle line numbers; overrides recenter-top-bottom)
- C-e → end-of-buffer (overrides default move-end-of-line)
- M-w → copy-region-as-kill (same as default)
- C-w → kill-region (same as default)
- C-u → undo (overrides universal-argument)
- C-t → beginning-of-buffer (overrides transpose-chars)

Notes:
- Overriding C-u removes the universal argument; consider alternatives like C-/ or C-_ for undo.
- Overriding C-e and C-t also removes common defaults.

## Included modes and loaded features

Loaded via (load ...) or configuration:
- markdown-mode
- matlab (matlab-mode)
- cuda-mode
- go-mode
- yaml-mode
- init-global (local config, if present)
- gptel (via use-package)

Tip: The explicit (load "...") calls expect these files to be installed and on load-path. If they’re not installed yet, Emacs will error. Using use-package with :ensure t can make this more robust.

## UI and behavior tweaks

- Background color: default face set to #303030
- Disable audible/visible bell: ring-bell-function set to ignore
- Disable backup files: make-backup-files nil
- Suppress startup screen: inhibit-startup-screen t
- Enable downcase-region (no longer disabled by default)
- Load path: add elisp/ and all its subdirectories to load-path

Suggestion: Instead of disabling backups entirely, you can redirect them:
- (setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))

Line numbers note: linum-mode is deprecated in newer Emacs. Prefer display-line-numbers-mode if you want a modern alternative.

## Custom function

swap-buffers
- Swaps the buffers between the selected window and the least-recently-used window when more than one window is open.
- Invoke with M-x swap-buffers
- Optional keybinding example:
  - (global-set-key (kbd "C-x 4 s") #'swap-buffers)

## gptel (ChatGPT) integration

- Installed via use-package with :ensure t
- Model configured as "gpt-5"
- API key pulled from environment:
  - export OPENAI_API_KEY="your-key"

Usage:
- M-x gptel
- M-x gptel-send or use gptel buffer commands

Notes:
- Ensure use-package is installed. If not, install it from MELPA first or add a bootstrap snippet.
- Verify that "gpt-5" is a valid model for your provider; adjust to an available model if needed.
- Emacs 28+ recommended.

## Directory layout

- ~/.emacs.d/init.el — main configuration
- ~/.emacs.d/elisp/ — additional local Lisp files; all subdirectories are added to load-path automatically

## Tips and caveats

- Package initialization: In batch contexts (e.g., byte-compiling), ensure required packages/macros (like use-package) are available at compile time.
- Security: Use HTTPS for package archives. This config switches Org ELPA to https://orgmode.org/elpa/.
- Overridden defaults: Be aware of the changed behaviors for C-u, C-e, C-t, and C-l.
- Windows and buffers: swap-buffers uses get-lru-window; with many windows, the target may be unexpected.

## Troubleshooting

- Symbols not found when loading modes:
  - Ensure the package is installed and on load-path.
  - Replace (load "pkg") with (require 'pkg) or a use-package stanza with :ensure t.
- gptel not found:
  - Install gptel from MELPA and ensure use-package is installed.
- Line numbers not toggling:
  - If linum-mode is unavailable in your Emacs, use display-line-numbers-mode.

That’s it—copy this README.md into your repository to document the configuration and its behavior.
