case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"

  [
    "curl",
    "sudo",
  ].each do |name|
    package name
  end

when "amazon"
  [
    "sudo",
    "which",

    # `groupadd` isn't installed in https://hub.docker.com/_/amazonlinux
    "shadow-utils",
  ].each do |name|
    package name
  end
end

package "git"
