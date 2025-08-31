include_recipe "../setup"

unless File.absolute_path?(node[:rbenv][:rbenv_root])
  node[:rbenv][:rbenv_root] = File.join(Dir.pwd, node[:rbenv][:rbenv_root])
end

include_recipe "rbenv::system"
