all::
	@echo make install - apply chef cookbooks.

install::
	knife solo cook centos6 --ssh-config-file ssh-config
