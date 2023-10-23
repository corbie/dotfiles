# Setup

To install dotfiles:

1. Clone this repo into ~/.dotfiles:

```
git clone --bare https://github.com/corbie/dotfiles.git ~/.dotfiles
```

2. Check out bare repo into $HOME:

```
git --git-dir=/Users/corban.johnson/.dotfiles --work-tree=/Users/corban.johnson checkout
```

3. Disable showing untracked files in $HOME

```
dt config --local status.showUntrackedFiles no
```
