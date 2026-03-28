# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/)

#### Install stow

Homebrew:

```bash
brew install stow
```

#### Usage

Clone the repo into your home directory and run stow to install symlinks:

```bash
stow bat ghostty helix lazygit nvim vim yazi zellij zsh
```

*Note* You can use the `--no-folding` flag to ensure that only the files are symlinked and not full directories.

To remove a packages symlinks:

```bash
stow -D zsh
```

Since files are symlinked, you can edit files in the repo and they'll be automatically applied.  To update just run `git pull`.

#### MacOS

On MacOS with homebrew installed you can instead use the install script:

```bash
./install bat ghostty helix lazygit nvim vim yazi zellij zsh
```

This will install all the required packages, additional basic tools (fd, fzf, ripgrep, zoxide etc), and dependencies such as helix language servers.
