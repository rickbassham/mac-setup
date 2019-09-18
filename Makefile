brew:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew doctor
	echo 'export PATH="/usr/local/bin:$$PATH"' >> ~/.bash_profile

node:
	brew install node

python:
	brew install python3
	brew install pipenv

golang:
	brew install go
	echo 'export GOROOT="$$(brew --prefix golang)/libexec"' >> ~/.bash_profile
	echo 'export PATH="$${HOME}/go/bin:$$PATH"' >> ~/.bash_profile

utils:
	brew install git
	brew cask install insomnia
	brew cask install firefox
	brew cask install visual-studio-code

devtools:
	cat devtools >> ~/.bash_profile
