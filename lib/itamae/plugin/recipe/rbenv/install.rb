# This recipe requires `rbenv_root` is defined.

include_recipe 'rbenv::dependency'

scheme     = node[:rbenv][:scheme]
rbenv_root = node[:rbenv][:rbenv_root]

git rbenv_root do
  repository "#{scheme}://github.com/rbenv/rbenv.git"
end

directory File.join(rbenv_root, 'plugins')

define :rbenv_plugin do
  name = params[:name]

  if node[name] && (node[name][:install] || node[name][:revision])
    git "#{rbenv_root}/plugins/#{name}" do
      repository "#{scheme}://github.com/rbenv/#{name}.git"
      revision node[name][:revision] if node[name][:revision]
    end
  end
end

if node[:'rbenv-default-gems'] && node[:'rbenv-default-gems'][:'default-gems']
  node[:'rbenv-default-gems'][:install] = true
  file "#{rbenv_root}/default-gems" do
    content node[:'rbenv-default-gems'][:'default-gems'].join("\n") + "\n"
    mode    '664'
  end
end

rbenv_plugin 'ruby-build'
rbenv_plugin 'rbenv-gem-rehash'
rbenv_plugin 'rbenv-default-gems'

rbenv_init = <<-EOS
  export RBENV_ROOT=#{rbenv_root}
  export PATH="#{rbenv_root}/bin:${PATH}"
  eval "$(rbenv init --no-rehash -)"
EOS

node[:rbenv][:versions].each do |version|
  execute "rbenv install #{version}" do
    command "#{rbenv_init} rbenv install #{version}"
    not_if  "#{rbenv_init} rbenv versions | grep #{version}"
  end
end

if node[:rbenv][:global]
  node[:rbenv][:global].tap do |version|
    execute "rbenv global #{version}" do
      command "#{rbenv_init} rbenv global #{version}"
      not_if  "#{rbenv_init} rbenv version | grep #{version}"
    end
  end
end
