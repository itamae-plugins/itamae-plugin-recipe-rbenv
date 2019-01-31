node.reverse_merge!(
  rbenv: {
    rbenv_root: '/usr/local/rbenv',
    scheme:     'git',
    versions:   [],
    install_dependency: true,
  },
  :'ruby-build' => {
    install: true,
    build_envs: [],
  }
)

include_recipe 'rbenv::install'
