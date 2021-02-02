cd ~
mkdir dev
touch ~/.bash_profile

echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile
echo "export MAIN_DEV_PATH=\"~/dev\"" >> ~/.bash_profile
echo "alias gti='git'" >> ~/.bash_profile
echo "alias lint='git ls-files -m | xargs ktlint'" >> ~/.bash_profile


# Make the keyboard cursor faster
defaults write NSGlobalDomain KeyRepeat -int 0

# Configure git aliases
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global core.editor "sublime -n -w"

# Install and configure OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "source ~/.bash_profile"" >> ~/.zshrc

# Create SSH key
cd ~/.ssh
ssh-keygen -t rsa -b 4096
eval "$(ssh-agent -s)"
touch ~/.ssh/config

echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/key" >> ~/.ssh/config

ssh-add -K ~/.ssh/key

# Display hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
