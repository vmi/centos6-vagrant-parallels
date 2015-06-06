# Copyright (c) 2015 Motonori IWAMURO
#
# This software is released under the MIT License.
# http://opensource.org/licenses/MIT

ruby_version = "2.2.2"
default['rbenv']['install'] = [ ruby_version ]
default['rbenv']['global'] = ruby_version
default['rbenv']['symlink_usr_bin_ruby'] = true

default['rbenv']['root'] = '/usr/local/rbenv'

default['rbenv']['url'] = 'https://github.com/sstephenson/rbenv.git'
default['rbenv']['plugins']['ruby-build'] = 'https://github.com/sstephenson/ruby-build.git'

default['rbenv']['build']['packages'] = %w[
  gdbm-devel
  libffi-devel
  libyaml-devel
  ncurses-devel
  openssl-devel
  procps
  readline-devel
  tk-devel
  zlib-devel
]
