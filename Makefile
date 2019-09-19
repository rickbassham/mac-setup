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
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder
	git config --global credential.helper osxkeychain
	git config --global user.name "Rick Bassham"
	git config --global user.email "brodrick.bassham@gmail.com"
	cat .gitignore_global >> ~/.config/git/ignore
	git config --global core.excludesfile ~/.config/git/ignore

gcp:
	brew cask install google-cloud-sdk
	brew cleanup
	gcloud init

devtools:
	cat devtools >> ~/.bash_profile

all: brew utils devtools golang python node
