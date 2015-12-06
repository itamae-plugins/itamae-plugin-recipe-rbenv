# This recipe requires `rbenv_root` and `rbenv_init` are defined.

scheme = node[:rbenv][:scheme]

git rbenv_root do
  repository "#{scheme}://github.com/rbenv/rbenv.git"
end

directory File.join(rbenv_root, 'plugins')

define :rbenv_plugin do
  name = params[:name]

  git "#{rbenv_root}/plugins/#{name}" do
    repository "#{scheme}://github.com/rbenv/#{name}.git"
    revision node[name][:revision] if node[name][:revision]
  end
end

rbenv_plugin 'ruby-build'
rbenv_plugin 'rbenv-gem-rehash'
rbenv_plugin 'rbenv-default-gems'

if node[:'rbenv-default-gems'] && node[:'rbenv-default-gems'][:'default-gems']
  file "#{rbenv_root}/default-gems" do
    content node[:'rbenv-default-gems'][:'default-gems'].join("\n") + "\n"
    mode    '664'
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
