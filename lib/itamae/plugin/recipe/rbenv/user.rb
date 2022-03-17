node.reverse_merge!(
  rbenv: {
    plugins:  {},
    scheme:   'https',
    user:     ENV['USER'],
    versions: [],
    install_dependency: true,
    install_development_dependency: false,
  },
  :'ruby-build' => {
    install: true,
    build_envs: [],
  }
)

unless node[:rbenv][:rbenv_root]
  case node[:platform]
  when 'osx', 'darwin'
    user_dir = '/Users'
  else
    user_dir = '/home'
  end
  node[:rbenv][:rbenv_root] = File.join(user_dir, node[:rbenv][:user], '.rbenv')
end

include_recipe 'rbenv::install'
