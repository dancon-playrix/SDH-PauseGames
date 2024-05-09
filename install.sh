#!/usr/bin/bash
# does the following:
# - SDH-PauseGames Decky Plugin
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi


echo "removing previous install if it exists"

cd $HOME

sudo rm -rf $HOME/homebrew/plugins/SDH-PauseGames

echo "installing SDH-PauseGames plugin for TDP control"
# download + installhttps://github.com/aarron-lee/SDH-PauseGames/tree/main
curl -L $(curl -s https://api.github.com/repos/dancon-playrix/SDH-PauseGames/releases/latest | grep "browser_download_url" | cut -d '"' -f 4) -o "$HOME/SDH-PauseGames.tar.gz"
sudo tar -xzf "SDH-PauseGames.tar.gz" -C $HOME/homebrew/plugins

# install complete, remove build dir
rm  "$HOME/SDH-PauseGames.tar.gz"
sudo systemctl restart plugin_loader.service

echo "Installation complete"
