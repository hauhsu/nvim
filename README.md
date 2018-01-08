neovim places its configuration under `~/.config/nvim`. So, to use this configuration, 
clone this repo as follows:

```
$ git clong https://github.com/hauhsu/nvim.git ~/.config/nvim
```

The config uses [vim-plug](https://github.com/junegunn/vim-plug) as plug-in manager.  
To install vim-plug, use the following command (Unix):

```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

After opening nvim, use `:PlugInstall` to install plugins.
