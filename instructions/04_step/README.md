### 1. Install Yay (Yet Another Yaourt)

`yay` is an AUR helper that simplifies the process of installing packages from the Arch User Repository (AUR).

##### Steps to Install Yay:

1. **Install Essential Packages**:

   ```
   sudo pacman -S --needed base-devel git
   ```

2. **Clone the Yay Repository**:

   ```
   git clone https://aur.archlinux.org/yay-git.git
   ```

3. **Navigate to the Yay Directory**:

   ```
   cd yay-git
   ```

4. **Build and Install Yay**:

   ```
   makepkg -si
   ```

5. **Remove the Yay Directory**:

   ```
   cd ..
   sudo rm -rf yay-git
   ```

6. **Verify Installation**:
   ```
   yay --version
   ```

### 2. Install Packages

Some of these packages may be installed, but it's not a problem.

> [!Note] You can install all these packages (except yay, it's below) in one command

```
sudo pacman -S --noconfirm alacritty base base-devel efibootmgr grub sudo dhcpcd linux linux-firmware gvfs gvfs-mtp gvfs-gphoto deno nodejs npm git neovim stow ripgrep fzf silicon bspwm picom sxhkd polybar dunst lxappearance feh gpick kitty ttf-jetbrains-mono openssh telegram-desktop vlc obs-studio pavucontrol pipewire-pulse imagemagick flameshot figlet toilet yad thunar file-roller zip unzip eza wget xclip zathura zathura-pdf-mupdf btop neofetch xorg-server xorg-xrandr xorg-xbacklight xorg-setxkbmap xorg-xinput xorg-xset xorg-xev firefox-developer-edition gsimplecal zsh tmux bat viewnior tumbler ffmpegthumbnailer
```

##### Core System Utilities

```
sudo pacman -S alacritty base base-devel efibootmgr grub sudo dhcpcd linux linux-firmware gvfs gvfs-mtp gvfs-gphoto
```

##### Development Tools

```
sudo pacman -S deno nodejs npm git neovim stow ripgrep fzf silicon bat
```

##### System Customization and Appearance

```
sudo pacman -S bspwm picom sxhkd polybar dunst lxappearance feh gpick kitty ttf-jetbrains-mono
```

##### Networking and Communication

```
sudo pacman -S openssh telegram-desktop
```

##### Multimedia and Graphics

```
sudo pacman -S vlc obs-studio pavucontrol pipewire-pulse imagemagick flameshot figlet toilet yad
```

##### File Management and Utilities

```
sudo pacman -S thunar file-roller zip unzip eza wget xclip viewnior tumbler ffmpegthumbnailer
```

##### Text Editing and Documentation

```
pacman -S zathura zathura-pdf-mupdf
```

##### System Monitoring and Performance

```
sudo pacman -S btop neofetch
```

##### Install AUR packages

```
yay -S --noconfirm cmatrix yazi cava tty-clock teams
```

### 3. Install environment for ZSH

Install oh my zsh (framework from zsh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Powerlevel10k Theme for Oh My Zsh
Powerlevel10k is a fast and customizable theme for Zsh. To install it:

```
git clone git@github.com:romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Install zsh plugins

```
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git@github.com:zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone git@github.com:MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone git@github.com:zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone git@github.com:unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone git@github.com:MichaelAquilina/zsh-auto-notify.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-notify
```

Set zsh as a default terminal

```
chsh -s $(which zsh)
```

### 4. Stow Configuration

##### Stow config files

```
cd ~/projects/x11-bspwm-dotfiles/config
stow -t ~ *
```

##### Stow home files

```
cd ~/projects/x11-bspwm-dotfiles/home
stow -t ~ *
```

##### Copy binary files

```
cd ~/projects/x11-bspwm-dotfiles
cp -r bin/ ~
```

##### Copy wallpapers

```
mkdir Pictures
cp -r ~/projects/x11-bspwm-dotfiles/wallpapers/ ~/Pictures/
```

### 5. Install TPM (Tmux Plugin Manager)

1. **Clone TPM Repository**:
   ```
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```
2. Open tmux and press prefix + I to install the plugins listed in your .tmux.conf. (Note: In my case the prefix is Ctrl+a)

### 6. Setup Firefox Developer Edition

**1. Configure Firefox Settings:**

1. Open Firefox Developer Edition.
2. In the address bar, type `about:config` and press `Enter`.
3. Search for `toolkit.legacyUserProfileCustomizations.stylesheets` and set it to `true`.
4. Search for `svg.context-properties.content.enabled` and set it to `true`.

**2. Locate the Profile Directory:**

1. In the address bar, type `about:support` and press `Enter`.
2. In the 'Application Basics' section, find `Profile Directory`.
3. Click the `Open Directory` button next to it to open the profile directory in your file manager.
   ```
   cp -r ~/projects/x11-bspwm-dotfiles/misc/firefox/chrome/* ~/.mozilla/firefox/path_to_profile_directory.dev-edition-default/chrome/
   ```

### 7. Customize look and appearance

1. Open "Customize Look and Feel" in program launcher.
2. Choose Dracula.

P.S The further customization info check out https://draculatheme.com/
