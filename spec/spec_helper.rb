require "serverspec"
require "docker"
require "yaml"
require "itamae"

set :backend, :docker

set :docker_image, ENV["TEST_IMAGE"]
set :docker_container, ENV["DOCKER_CONTAINER"]

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

def node
  return @node if @node

  hash = YAML.load_file(ENV["NODE_YAML"])

  @node = Itamae::Node.new(hash, Specinfra.backend)

  if !@node[:rbenv][:rbenv_root] && @node[:rbenv][:user]
    case @node[:platform]
    when 'osx', 'darwin'
      user_dir = '/Users'
    else
      user_dir = '/home'
    end
    @node[:rbenv][:rbenv_root] = File.join(user_dir, @node[:rbenv][:user], '.rbenv')
  end

  @node
end
