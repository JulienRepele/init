# Install Xcode (require for git)
command xcode-select --install

# Create dev directory
cd ~
mkdir ~/dev
touch ~/.bash_profile
echo "alias dev='cd ~/dev'" >> ~/.bash_profile 

# Display hidden files
defaults write com.apple.Finder AppleShowAllFiles true; killall Finder

# Set acces right for Github SSH key (if copied from another computer)
# chmod 400 ~/.ssh/id_rsa

# Make the keyboard cursor faster (effective after system reboot)
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Configure git aliases
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global core.editor "sublime -n -w"

# For people always typing gti instead of git
touch ~/.bash_profile
echo "alias gti='git'" >> ~/.bash_profile 

# Install and configure OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
touch ~/.bash_profile
echo "source ~/.bash_profile">> ~/.zshrc

# Fix Folder permission issue with Oh My ZSH
echo "$(echo -n 'ZSH_DISABLE_COMPFIX=true\n'; cat ~/.zshrc)" > ~/.zshrc

# Install Ktlint (Kotlin linter)
curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.41.0/ktlint && chmod a+x ktlint
touch ~/.bash_profile
echo "alias lint='git ls-files -m | xargs ktlint'" >> ~/.bash_profile

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instal Sublime Text and use it as git editor (instead of vim)
brew install --cask sublime-text
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
git config --global core.editor "subl -n -w"

# Install popular softwares
brew install --cask iterm2
brew install --cask slack
brew install --cask android-studio
brew install --cask spotify
brew install --cask intellij-idea-ce
brew install --cask vlc
brew install --cask transmission # for dowloading Linux images
brew install --cask adobe-creative-cloud
