def rbenv_root
  node[:rbenv] && node[:rbenv][:rbenv_root] ? node[:rbenv][:rbenv_root] : "/usr/local/rbenv"
end

def rbenv_init
  <<-EOS
    export RBENV_ROOT=#{rbenv_root}
    export PATH="#{rbenv_root}/bin:${PATH}"
    eval "$(rbenv init --no-rehash -)"
  EOS
end
