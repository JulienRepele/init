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