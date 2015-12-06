include_recipe 'rbenv::dependency'

scheme = "git"
scheme = node[:rbenv][:scheme] if node[:rbenv][:scheme]

DEFAULT_RBENV_ROOT = "/usr/local/rbenv"

def rbenv_root
  if node[:rbenv] && node[:rbenv][:rbenv_root]
    node[:rbenv][:rbenv_root]
  else
    DEFAULT_RBENV_ROOT
  end
end

def rbenv_init
  <<-EOS
    export RBENV_ROOT=#{rbenv_root}
    export PATH="#{rbenv_root}/bin:${PATH}"
    eval "$(rbenv init --no-rehash -)"
  EOS
end

git rbenv_root do
  repository "#{scheme}://github.com/rbenv/rbenv.git"
end

git "#{rbenv_root}/plugins/ruby-build" do
  repository "#{scheme}://github.com/rbenv/ruby-build.git"
  if node[:'ruby-build'] && node[:'ruby-build'][:revision]
    revision node[:'ruby-build'][:revision]
  end
end

git "#{rbenv_root}/plugins/rbenv-gem-rehash" do
  repository "#{scheme}://github.com/rbenv/rbenv-gem-rehash.git"
  if node[:'rbenv-gem-rehash'] && node[:'rbenv-gem-rehash'][:revision]
    revision node[:'rbenv-gem-rehash'][:revision]
  end
end

git "#{rbenv_root}/plugins/rbenv-default-gems" do
  repository "#{scheme}://github.com/rbenv/rbenv-default-gems.git"
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
