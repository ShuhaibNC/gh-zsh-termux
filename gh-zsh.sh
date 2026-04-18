#!/data/data/com.termux/files/usr/bin/bash
set -e

#===========================================================
# Helpers
#===========================================================
msg() { echo -e "\n→ $1"; }
err() { echo "ERROR: $1" >&2; exit 1; }

backup_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        cp "$file" "${file}.backup-$(date +%F)" 2>/dev/null || true
        msg "Backup created: ${file}.backup-$(date +%F)"
    fi
}

#===========================================================
# Update & Install Packages (Termux)
#===========================================================
msg "Updating packages"
pkg update -y >/dev/null
pkg upgrade -y >/dev/null

msg "Installing dependencies (zsh, git, curl, bat)"
pkg install -y zsh git curl bat >/dev/null

#===========================================================
# Ensure directories
#===========================================================
mkdir -p ~/.zsh
mkdir -p ~/.zsh/plugins

#===========================================================
# Change shell to ZSH (Termux-safe)
#===========================================================
msg "Setting ZSH as default shell"
chsh -s zsh || msg "chsh not supported, will start zsh manually"

#===========================================================
# Backup old zshrc and download new
#===========================================================
backup_file ~/.zshrc

msg "Downloading new .zshrc"
curl -fsSL -o ~/.zshrc https://raw.githubusercontent.com/shuhaibnc/gh-zsh-termux/main/.zshrc

#===========================================================
# Install Powerlevel10k Theme
#===========================================================
msg "Installing Powerlevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k >/dev/null 2>&1

curl -fsSL -o ~/.p10k.zsh https://raw.githubusercontent.com/shuhaibnc/gh-zsh-termux/main/.p10k.zsh

#===========================================================
# Install Plugins
#===========================================================
msg "Installing plugins"

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh/fast-syntax-highlighting >/dev/null 2>&1

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions >/dev/null 2>&1

curl -fsSL -o ~/.zsh/completion.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/completion.zsh
curl -fsSL -o ~/.zsh/history.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/history.zsh
curl -fsSL -o ~/.zsh/key-bindings.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/key-bindings.zsh

#===========================================================
# Update .zshrc sources
#===========================================================
cat << 'EOF' >> ~/.zshrc

# Custom additions (Termux)
source $HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/key-bindings.zsh

EOF

#===========================================================
# Finish
#===========================================================
msg "Installation Finished!"
msg "→ Restart Termux or run: zsh"

#===========================================================
# Launch ZSH immediately
#===========================================================
exec zsh