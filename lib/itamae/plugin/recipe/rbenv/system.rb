# cf) https://github.com/sstephenson/ruby-build/wiki#suggested-build-environment
case node[:platform]
when "debian", "ubuntu"
  package "autoconf"
  package "bison"
  package "build-essential"
  package "libssl-dev"
  package "libyaml-dev"
  package "libreadline6-dev"
  package "zlib1g-dev"
  package "libncurses5-dev"
  package "libffi-dev"
  package "libgdbm3"
  package "libgdbm-dev"
  package "libffi-dev"
when "redhat", "fedora"
  # redhat is including CentOS
  package "gcc"
  package "openssl-devel"
  package "libyaml-devel"
  package "libffi-devel"
  package "readline-devel"
  package "zlib-devel"
  package "gdbm-devel"
  package "ncurses-devel"
  package "libffi-devel"
else
  # for backward compatibility (<= v0.2.1)
  package "libffi-devel"
  package "openssl-devel"
  package "readline-devel"
end

require "itamae/plugin/recipe/rbenv"

git rbenv_root do
  repository "git://github.com/sstephenson/rbenv.git"
end

git "#{rbenv_root}/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  if node[:'ruby-build'] && node[:'ruby-build'][:revision]
    revision node[:'ruby-build'][:revision]
  end
end

git "#{rbenv_root}/plugins/rbenv-default-gems" do
  repository "git://github.com/sstephenson/rbenv-default-gems.git"
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
