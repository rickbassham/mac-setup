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
	brew install git
	brew cask install insomnia
	brew cask install firefox
	brew cask install visual-studio-code
	brew cask install dbeaver-community
	brew cask install docker
	brew cask install iterm2
	brew cleanup

devtools:
	cat devtools >> ~/.bash_profile
