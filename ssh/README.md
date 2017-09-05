# install step

```bash

mkdir -p ~/.ssh

mkdir -p ~/work/
git clone https://git.oschina.net/seanly/sshkey.git
cd sshkey
./install.sh

cd ~/work/dotfiles
ln -s `pwd`/ssh/config ~/.ssh/config

```
