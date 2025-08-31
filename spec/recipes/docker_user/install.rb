include_recipe "../setup"

user node[:rbenv][:user] do
  shell "/bin/bash"
  create_home true
end

include_recipe "rbenv::user"
