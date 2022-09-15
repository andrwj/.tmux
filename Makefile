mac:
	cat .tmux.conf.local conf.common conf.macos conf.lab conf.plugins > ~/.tmux.conf.local

linux:
	cat .tmux.conf.local conf.common conf.linux conf.lab conf.plugins > ~/.tmux.conf.local

geovim: mac
	cat conf.geovim >> ~/.tmux.conf.local

mac-install:
	brew install reattach-to-user-namespace


