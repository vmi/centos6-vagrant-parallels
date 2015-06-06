# Copyright (c) 2015 Motonori IWAMURO
#
# This software is released under the MIT License.
# http://opensource.org/licenses/MIT

conf = node['base_packages']

### Uninstall default packages.

conf['group']['uninstall'].each do |name|
  bash "Uninstall #{name}" do
    code "yum -y groupremove '#{name}'"
    only_if "LANG=C yum grouplist '#{name}' | grep '^Installed'"
  end
end

conf['uninstall'].each do |name|
  yum_package name do
    action :purge
  end
end

### Update packages.

bash "Yum update" do
  code "yum -y update"
end

### Install packages.

conf['group']['install'].each do |name|
  bash "Install #{name}" do
    code "yum -y groupinstall '#{name}'"
    not_if "LANG=C yum grouplist '#{name}' | grep '^Installed'"
  end
end

conf['install'].each do |name|
  yum_package name
end
