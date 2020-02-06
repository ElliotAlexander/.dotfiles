#!/bin/bash

echo "Installing pre-build tools."
xcode-select --install 2>&1 >/dev/null
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer 2>&1 >/dev/null
sudo xcodebuild -license accept 2>&1 >/dev/null

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if [[ $? != 0 ]]; then
	echo "Unable to install homebrew, aborting."
	exit 2
fi


read -r -p "Update / Upgrade Brew? y/n:" response
if [[ $response =~ (y|yes|Y) ]]; then
	echo "Updating homebrew..."
	brew update
	echo "Brew Updated."
	echo "Upgrading homebrew..."
	brew upgrade
	echo "Done updating Brew"
	echo "Cleaning up Brew."
	brew cleanup --force > /dev/null 2>&1
	rm -f -r /Library/Caches/Homebrew/* > /dev/null 2>&1
else
	echo "skipped brew package upgrades."
fi

echo "Installing Node at latest stable release."
brew install node

# Pin NPM versions
npm config set save-exact true

echo "Installinig ZSH..."
brew install zsh
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Defensive shell-configurations?
chsh -s $(which zsh)



echo "Installing bat"
brew install bat


brew install ag

# Install python 
brew install python3

# Install typescript 
sudo chown -R $USER /usr/local/lib/node_modules/
npm install -g typescript tslint

# Setup FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# Install docker
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve
brew cask install kitematic
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve


# Assorted Others

brew install vim wget htop
brew cask install firefox visual-studio-code spotify karabiner-elements alfred firefox iterm2 slack

brew install neovim
# Vim plug
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

npm install -g neovim

#Denoite
python3 -m pip install pynvim 
# Fix dumb system prefs.

echo "Ensuring all pref panes are closed."
osascript -e 'tell application "System Preferences" to quit'


# Networking stuff

# Enable firewalling
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Enable stealh networking - no ICMP, hostname pings.
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# Enable logging - if requred.
#sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -int 1

# Show ip and hostname on login panell
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# reload
launchctl unload /System/Library/LaunchAgents/com.apple.alf.useragent.plist
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
launchctl load /System/Library/LaunchAgents/com.apple.alf.useragent.plist


# Security stuff


# Disable IR controller.
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool false

# Disable remote login
sudo systemsetup -setremotelogin off

# Disable wake-on modem
sudo systemsetup -setwakeonmodem off

# Disable wake-on LAN
sudo systemsetup -setwakeonnetworkaccess off

# no guest
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable local time machine snapshots
sudo tmutil disable local

# Other

# Remove sleep image, don't allow it to be recreated.
sudo rm -rf /Private/var/vm/sleepimage
sudo touch /Private/var/vm/sleepimage
sudo chflags uchg /Private/var/vm/sleepimage

# Allow 'locate'
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist > /dev/null 2>&1

defaults write com.apple.CrashReporter DialogType -string "none"

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false



# Finder

# Show filenames by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Search current folder by defualt
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Don't warn about changing a filename extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Don't create DSstore on networked drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Shred trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true


# GUI stuff

# Faster mission control!!!!!
defaults write com.apple.dock expose-animation-duration -float 0.1

# Spring laod all dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Minimise into icons on dock - no right hand pane
defaults write com.apple.dock minimize-to-application -bool true

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -bool true


# ITerm


# Don't get a closing prompt
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


# Activity monitor

# Show main window when opening activity monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualzie CPU
defaults write com.apple.ActivityMonitor IconType -int 5
# Don't hide some processes in activity monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Default sort results by CPU Usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
