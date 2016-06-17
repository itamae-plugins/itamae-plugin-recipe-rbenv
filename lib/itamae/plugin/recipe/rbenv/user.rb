node.reverse_merge!(
  rbenv: {
    scheme:   'git',
    user:     ENV['USER'],
    versions: [],
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
