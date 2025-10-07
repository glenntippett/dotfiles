When built from source the neovim repository should be located at `~/neovim`
(The binary will be at `/usr/local/bin/nvim`)

To update the neovim repository, run the following commands:

```bash
cd ~/neovim
git pull origin master
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

To switch the install to homebrew instead of building from source, run the following commands:

```bash
sudo rm /usr/local/bin/nvim
brew install neovim --HEAD
```

Then to update via homebrew, run:

```bash
brew upgrade neovim --fetch-HEAD
```

