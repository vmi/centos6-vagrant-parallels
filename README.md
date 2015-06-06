CentOS6 environment with Vagrant and Chef on Parallels
======================================================

This is scripts for building CentOS6 environment with Vagrant and Chef on Parallels.

Prerequirements
---------------

* Parallels

* Vagrant

```bash
brew cask install vagrant
hash -r
vagrant plugin install vagrant-parallels
```

* Chef Development Kit & Knife Solo

```bash
brew cask install chefdk
hash -r
chef gem install knife-solo
```

Setup
-----

```bash
vagrant up
./prepare.sh
make install
```
