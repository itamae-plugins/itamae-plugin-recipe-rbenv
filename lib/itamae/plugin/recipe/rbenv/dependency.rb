# cf) https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
case node[:platform]
when 'debian', 'ubuntu'
  package 'autoconf'
  package 'bison'
  package 'build-essential'
  package 'libffi-dev'
  package 'libgdbm-dev'
  package 'libgdbm3'
  package 'libncurses5-dev'
  package 'libreadline6-dev'
  package 'libssl-dev'
  package 'libyaml-dev'
  package 'zlib1g-dev'
when 'redhat', 'fedora'
  # redhat is including CentOS
  package 'gcc'
  package 'gdbm-devel'
  package 'libffi-devel'
  package 'libyaml-devel'
  package 'ncurses-devel'
  package 'openssl-devel'
  package 'readline-devel'
  package 'zlib-devel'
when 'osx', 'darwin'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
else
  # for backward compatibility (<= v0.2.1)
  package 'libffi-devel'
  package 'openssl-devel'
  package 'readline-devel'
end

package 'git'
