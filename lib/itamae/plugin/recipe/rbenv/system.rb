# cf) https://github.com/sstephenson/ruby-build/wiki#suggested-build-environment
case node[:platform]
when "debian", "ubuntu"
  package "autoconf"
  package "bison"
  package "build-essential"
  package "libffi-dev"
  package "libgdbm-dev"
  package "libgdbm3"
  package "libncurses5-dev"
  package "libreadline6-dev"
  package "libssl-dev"
  package "libyaml-dev"
  package "zlib1g-dev"
when "redhat", "fedora"
  # redhat is including CentOS
  package "gcc"
  package "gdbm-devel"
  package "libffi-devel"
  package "libyaml-devel"
  package "ncurses-devel"
  package "openssl-devel"
  package "readline-devel"
  package "zlib-devel"
when "osx"
  package "libffi"
  package "libyaml"
  package "openssl"
else
  # for backward compatibility (<= v0.2.1)
  package "libffi-devel"
  package "openssl-devel"
  package "readline-devel"
end

package "git"

scheme = "git"
scheme = node[:rbenv][:scheme] if node[:rbenv][:scheme]

require "itamae/plugin/recipe/rbenv"

git rbenv_root do
  repository "#{scheme}://github.com/sstephenson/rbenv.git"
end

git "#{rbenv_root}/plugins/ruby-build" do
  repository "#{scheme}://github.com/sstephenson/ruby-build.git"
  if node[:'ruby-build'] && node[:'ruby-build'][:revision]
    revision node[:'ruby-build'][:revision]
  end
end

git "#{rbenv_root}/plugins/rbenv-gem-rehash" do
  repository "#{scheme}://github.com/sstephenson/rbenv-gem-rehash.git"
  if node[:'rbenv-gem-rehash'] && node[:'rbenv-gem-rehash'][:revision]
    revision node[:'rbenv-gem-rehash'][:revision]
  end
end

git "#{rbenv_root}/plugins/rbenv-default-gems" do
  repository "#{scheme}://github.com/sstephenson/rbenv-default-gems.git"
  if node[:'rbenv-default-gems'] && node[:'rbenv-default-gems'][:revision]
    revision node[:'rbenv-default-gems'][:revision]
  end
end

if node[:'rbenv-default-gems'] && node[:'rbenv-default-gems'][:'default-gems']
  file "#{rbenv_root}/default-gems" do
    content node[:'rbenv-default-gems'][:'default-gems'].join("\n") + "\n"
    mode    "664"
  end
end

node[:rbenv][:versions].each do |version|
  execute "rbenv install #{version}" do
    command "#{rbenv_init} rbenv install #{version}"
    not_if  "#{rbenv_init} rbenv versions | grep #{version}"
  end
end

node[:rbenv][:global].tap do |version|
  execute "rbenv global #{version}" do
    command "#{rbenv_init} rbenv global #{version}"
    not_if  "#{rbenv_init} rbenv version | grep #{version}"
  end
end
