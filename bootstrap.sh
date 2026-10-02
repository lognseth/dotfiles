```bash
#!/bin/bash
set -e

DOTFILES_REPO="git@github.com:lognseth/dotfiles.git"

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  brew install chezmoi
fi

chezmoi init --apply "$DOTFILES_REPO"

if [[ -f "$HOME/Brewfile" ]]; then
  brew bundle --file="$HOME/Brewfile"
fi
```
