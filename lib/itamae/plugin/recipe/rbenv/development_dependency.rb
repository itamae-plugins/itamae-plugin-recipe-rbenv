# Dependencies to install x.y.z-dev (see also: dependency.rb)
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
case node[:platform]
when 'debian', 'ubuntu', 'mint'
  package 'autoconf'
  package 'bison'
when 'redhat', 'fedora', 'amazon' # redhad includes CentOS
  package 'autoconf'
  package 'bison'
when 'osx', 'darwin'
  # none
when 'arch'
  # none
when 'opensuse'
  package 'automake'
  package 'bison'
when 'gentoo'
  package 'autoconf'
  package 'bison'
when 'freebsd'
  package 'devel/autoconf'
  package 'devel/bison'
when 'openbsd'
  package 'autoconf'
  package 'bison'
else
  raise NotImplementedError, "Platform '#{node[:platform]}' is not supported by rbenv::dependency yet"
end

package 'subversion'
