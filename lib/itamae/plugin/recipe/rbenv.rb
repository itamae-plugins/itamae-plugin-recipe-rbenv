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
