SHELL := /bin/bash

install: install-ssh install-powerline install-vim install-bash

clean:
	rm -rf ~/.bash
	rm -rf ~/.dotfiles
	rm -rf ~/.bashrc
	rm -rf ~/.bash_profile

	rm -rf ~/.gemrc
	rm -rf ~/.tmux.conf
	rm -rf ~/.minttyrc
	rm -rf ~/.gitconfig
	rm -rf ~/.gitignore
	rm -rf ~/.vimrc
	rm -rf ~/.vim
	rm -rf ~/powerline-config

install-ssh:
	env
	sed -i 's/GITHUB_USER/'"${GITHUB_USER}"'/g' ssh/config
	sed -i 's/GHE_ENTERPRISE_ADDR/'"${GITHUB_USER}"'/g' ssh/config
	sed -i 's/GHE_ENTERPRISE_USER/'"${GHE_ENTERPRISE_USER}"'/g' ssh/config
	cp ssh/config ~/.ssh/config
	cat ~/.ssh/config
	
install-bash:
	cp -rf `pwd`/bash ~/.bash
	cp -rf `pwd`/dotfiles ~/.dotfiles
	ln -s ~/.dotfiles/.bashrc ~/.bashrc
	ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

	ln -s ~/.dotfiles/.gemrc ~/.gemrc
	ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/.dotfiles/.minttyrc ~/.minttyrc
	ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/.gitignore ~/.gitignore
        		
	source ~/.bash_profile

install-vim:
	rm -rf ~/.vim
	cp -Rf `pwd`/vim ~/.vim
	ln -s ~/.vim/.vimrc ~/.vimrc
	git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone https://github.com/ekalinin/Dockerfile.vim.git ~/.vim/bundle/Dockerfile.vim
	vim +BundleInstall +qall	

install-powerline:
	sudo pip install powerline-status
	sudo pip install powerline-gitstatus
	git clone git@github.com:gravyboat/powerline-config.git ~/powerline-config
	cp -r ~/powerline-config/powerline/ ~/.config/
