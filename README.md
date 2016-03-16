General
=======

My personal vim config. This repo serves mainly as a personal backup and has
not been extensively tested on various platforms, though it should work out
of the box on most systems. Please open a ticket if anything does not work
for your specific setup.

Installation
============

This config assumes that you have some version of vim that supports copying
to clipboard such as vim-athena and that ctags and curl are already installed 
in your system. On Debian/Ubuntu you may install the respective packages via

    	sudo apt-get install vim-athena exuberant-ctags curl

On Mac OS X you may use brew or macports respectively.


Backup and remove your ~/.vim (if any). Once everything is setup run:
    
    cd && git clone https://github.com/nettrino/vimconf.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim && make

Staying up-to-date
==================
    
    cd ~/.vim && make update

Custom Settings
===============

You can specify your own settings overriding the defaults in config/vimrc.user

Plugin Dependencies
===================

Most plugins should work out of the box, however there are some that might require
additional system packages for their full functionality. For instance, syntastic
works pretty nicely for Python with [pylint]:(https://www.pylint.org/#install) installed.
