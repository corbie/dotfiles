# Setup

To install dotfiles:

1. Clone this repo into ~/.dotfiles:

```
git clone --bare https://github.com/corbie/dotfiles.git ~/.dotfiles
```

2. Check out bare repo into $HOME:

```
git --git-dir=${HOME}/.dotfiles --work-tree=${HOME} checkout
```

3. Disable showing untracked files in $HOME

```
dt config --local status.showUntrackedFiles no
```

4. Set up remote branch tracking

```
git --git-dir=$HOME/.dotfiles config --add remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*' && git --git-dir=$HOME/.dotfiles fetch origin
```
