brew:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew doctor
	brew cleanup
	echo 'export PATH="/usr/local/bin:$$PATH"' >> ~/.bash_profile

node:
	brew install node
	brew cleanup

python:
	brew install python3
	brew install pipenv
	brew cleanup

golang:
	brew install go
	brew cleanup
	echo 'export GOROOT="$$(brew --prefix golang)/libexec"' >> ~/.bash_profile
	echo 'export PATH="$${HOME}/go/bin:$$PATH"' >> ~/.bash_profile

utils:
	brew install --with-default-names make
	brew install git
	brew cask install insomnia
	brew cask install firefox
	brew cask install visual-studio-code
	brew cask install dbeaver-community
	brew cask install docker
	brew install docker-compose
	brew cask install virtualbox
	brew cask install minikube
	brew install kubectl
	brew cask install iterm2
	brew install jq
	brew install circleci
	brew install terraform
	brew cleanup
	git config --global credential.helper osxkeychain
	git config --global user.name "Rick Bassham"
	git config --global user.email "brodrick.bassham@gmail.com"
	cat .gitignore_global >> ~/.config/git/ignore
	git config --global core.excludesfile ~/.config/git/ignore

tweaks:
	# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	# Finder: show status bar
	defaults write com.apple.finder ShowStatusBar -bool true

	# Finder: show all filename extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	# Show hidden files in finder
	defaults write com.apple.finder AppleShowAllFiles YES

	# Enable subpixel font rendering on non-Apple LCDs 
	defaults write NSGlobalDomain AppleFontSmoothing -int 2

	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

	# Set a blazingly fast keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 2

	# Set a shorter Delay until key repeat
	defaults write NSGlobalDomain InitialKeyRepeat -int 25

	# Avoid creating .DS_Store files on network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

	# Disable the warning when changing a file extension
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

	# Require password immediately after sleep or screen saver begins

	defaults write com.apple.screensaver askForPassword -int 1
	defaults write com.apple.screensaver askForPasswordDelay -int 0

	# Set Safari’s home page to about:blank for faster loading
	defaults write com.apple.Safari HomePage -string "about:blank"

	# Enable Safari’s debug menu
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

	# Enable the Develop menu and the Web Inspector in Safari
	defaults write com.apple.Safari IncludeDevelopMenu -bool true
	defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

	# Add a context menu item for showing the Web Inspector in web views
	defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

	# Copy email addresses as foo@example.com instead of Foo Bar <foo@example.com> in Mail.app
	defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

	# Add the keyboard shortcut âŒ˜ + Enter to send an email in Mail.app
	defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\\U21a9"

	#Use plain text mode for new TextEdit documents
	defaults write com.apple.TextEdit RichText -int 0

	# Open and save files as UTF–8 in TextEdit
	defaults write com.apple.TextEdit PlainTextEncoding -int 4
	defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

	defaults write com.apple.menuextra.battery ShowPercent -string "YES"
	defaults write com.apple.menuextra.battery ShowTime -string "YES"

	# Always show scrollbars
	defaults write NSGlobalDomain AppleShowScrollBars -string “Always”

	# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
	defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

	# Increase sound quality for Bluetooth headphones/headsets
	defaults write com.apple.BluetoothAudioAgent “Apple Bitpool Min (editable)” -int 40

	# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
	defaults write com.apple.screencapture type -string “png”

	# Show item info below icons on the desktop and in other icon views
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	
	# Enable snap-to-grid for icons on the desktop and in other icon views
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	
	# Increase grid spacing for icons on the desktop and in other icon views
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

	# Use list view in all Finder windows by default
	# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
	defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

	# Empty Trash securely by default
	defaults write com.apple.finder EmptyTrashSecurely -bool true

	# Prevent Safari from opening 'safe' files automatically after downloading
	defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

	# Make Safari's search banners default to Contains instead of Starts With
	defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

gcp:
	brew cask install google-cloud-sdk
	brew cleanup
	gcloud init

devtools:
	cat devtools >> ~/.bash_profile

all: brew utils devtools golang python node tweaks
