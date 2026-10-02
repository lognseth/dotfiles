# Dotfiles

## Setup

```bash
brew install chezmoi
chezmoi init --apply git@github.com:lognseth/dotfiles.git
brew bundle --file="$HOME/Brewfile"
```

## Common commands

Add a file:

```bash
chezmoi add ~/.zshrc
```

Edit a managed file:

```bash
chezmoi edit ~/.zshrc
```

See pending changes:

```bash
chezmoi diff
```

Apply changes:

```bash
chezmoi apply
```

Pull latest changes and apply:

```bash
chezmoi update
```

Open the dotfiles repo:

```bash
chezmoi cd
```

Commit changes:

```bash
chezmoi cd
git add .
git commit -m "Update dotfiles"
git push
```

Update the Brewfile:

```bash
brew bundle dump --file="$HOME/Brewfile" --force
chezmoi add "$HOME/Brewfile"
```
