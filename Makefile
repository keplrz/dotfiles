install: install-bash install-emacs install-git install-vim install-x

install-bash:
	@rm -f ~/.bash_profile
	@ln -s `pwd`/bash_profile ~/.bash_profile
	@rm -f ~/.bashrc
	@ln -s `pwd`/bashrc ~/.bashrc

install-emacs:
	@rm -f ~/.emacs
	@ln -s `pwd`/emacs-init.el ~/.emacs

install-git:
	@rm -f ~/.gitconfig
	@ln -s `pwd`/gitconfig ~/.gitconfig

install-vim:
	@rm -f ~/.vimrc
	@ln -s `pwd`/vimrc ~/.vimrc

install-x:
	@rm -f ~/.xinitrc
	@ln -s `pwd`/xinitrc ~/.xinitrc
	@rm -f ~/.Xresources
	@ln -s `pwd`/Xresources ~/.Xresources
