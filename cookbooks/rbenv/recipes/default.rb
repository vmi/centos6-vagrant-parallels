# Copyright (c) 2015 Motonori IWAMURO
#
# This software is released under the MIT License.
# http://opensource.org/licenses/MIT

conf = node['rbenv']

# Setup packages for build.

conf['build']['packages'].each { |name| yum_package name }

# Setup configuration file.

template "/etc/profile.d/rbenv.sh" do
  source "profile_rbenv.sh.erb"
end

template "/etc/sudoers.d/rbenv" do
  source "sudoers_rbenv.erb"
end

# Install rbenv.

script = <<-EOH
git clone "#{conf['url']}" "#{conf['root']}"
EOH
conf['plugins'].each_pair do |name, url|
  script += <<-EOH if url
    git clone "#{url}" "#{conf['root']}/plugins/#{name}"
  EOH
end
script += <<-EOH
. /etc/profile.d/rbenv.sh
EOH

bash "Install rbenv" do
  code script
  not_if { FileTest.directory? "#{conf['root']}/shims"}
end

# Install Ruby.

conf['install'].each do |version|
  bash "Install Ruby #{version}" do
    code ". /etc/profile.d/rbenv.sh && rbenv install -s '#{version}'"
  end
end

# Set global version.

bash "Set global ruby version: #{conf['global']}" do
  code ". /etc/profile.d/rbenv.sh && rbenv global '#{conf['global']}'"
end

# Symlink from /usr/bin/ruby
if conf['symlink_usr_bin_ruby']
  link "/usr/bin/ruby" do
    to "#{conf['root']}/shims/ruby"
    only_if "test ! -e /usr/bin/ruby -o -L /usr/bin/ruby"
  end
end
