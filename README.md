### How do I get set up? ###

* cd ~
* clone the repo
* ln -s ./dotfiles/.bash_profile
* ln -s ./dotfiles/.bashrc
* ln -s ./dotfiles/git/.gitconfig
* source ~/.bash_profile

* cd /usr/share/git-core/templates/hooks/

* sudo mv pre-commit.sample pre-commit.sample.old
* sudo ln -s ~/dotfiles/git/hooks/pre-commit pre-commit

* sudo mv post-checkout.sample post-checkout.sample.old
* sudo ln -s ~/dotfiles/git/hooks/post-checkout post-checkout
