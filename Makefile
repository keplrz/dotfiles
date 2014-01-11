install-bash:
	@rm -f ~/.bash_profile
	@ln -s `pwd`/bash_profile ~/.bash_profile

install-vim:
	@rm -f ~/.vimrc
	@ln -s `pwd`/vimrc ~/.vimrc

install-x:
	@rm -f ~/.xinitrc
	@ln -s `pwd`/xinitrc ~/.xinitrc
	@rm -f ~/.Xresources
	@ln -s `pwd`/Xresources ~/.Xresources
