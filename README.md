## tmux  
  
tmux is a terminal multiplexer  
  
Automatic install/update:
```
bash -c "$(curl -LSs https://github.com/dfmgr/tmux/raw/master/install.sh)"
```
Manual install:

requires:    
apt: ```apt install tmux powerline fonts-powerline python3-powerline python3-psutil```  
yum: ```yum install tmux powerline```  
pacman: ```pacman -S tmux powerline```  
  
```
mv -fv "$HOME/.config/tmux" "$HOME/.config/tmux.bak"
git clone https://github.com/dfmgr/tmux "$HOME/.config/tmux"
git clone https://github.com/tmux-plugins/tpm "$HOME/.local/share/tmux/tpm"
ln -sf "$HOME/.config/tmux/tmux.conf" "$HOME/.tmux.conf"
bash "$HOME/.local/share/tmux/tpm/scripts/install_plugins.sh"
```
  
  
<p align=center>
  <a href="https://wiki.archlinux.org/index.php/tmux" target="_blank">tmux wiki</a>  |  
  <a href="https://tmux.github.io/" target="_blank">tmux site</a>
</p>  
