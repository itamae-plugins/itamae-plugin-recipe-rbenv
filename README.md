# Itamae::Plugin::Recipe::Rbenv

[Itamae](https://github.com/ryotarai/itamae) plugin to install ruby with rbenv

[![test](https://github.com/itamae-plugins/itamae-plugin-recipe-rbenv/actions/workflows/test.yml/badge.svg)](https://github.com/itamae-plugins/itamae-plugin-recipe-rbenv/actions/workflows/test.yml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-rbenv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-rbenv

# Usage
## System wide installation

Install rbenv to /usr/local/rbenv or some shared path

### Recipe

```ruby
# your recipe
include_recipe "rbenv::system"
```

### Node

Use this with `itamae -y node.yml`

```yaml
# node.yml
rbenv:
  global:
    2.3.0
  versions:
    - 2.3.0
    - 2.2.4

  # rbenv install dir, optional (default: /usr/local/rbenv)
  rbenv_root: "/path/to/rbenv"

  # specify scheme to use in git clone, optional (default: https)
  scheme: git

  # Create /usr/local/rbenv/cache, optional (default: false)
  # See: https://github.com/rbenv/ruby-build#package-download-caching
  cache: true

  # Whether install dependencies (default: true)
  # Recommend false if `--no-sudo`
  install_dependency: true

  # Install arbitrary rbenv plugins, optional (default: [])
  plugins:
    dcarley/rbenv-sudo:
      revision: master

# ruby-build is always installed. Specifying revision improves performance.
ruby-build:
  revision: e455975286e44393b1b33037ae1ce40ef2742401

# Optional plugin. Specify :install or :revision to install rbenv-default-gems.
rbenv-default-gems:
  default-gems:
    - bundler
    - bcat ~>0.6
    - rails --pre
  install: true
  # or
  revision: ead67889c91c53ad967f85f5a89d986fdb98f6fb
```

### .bashrc

Recommend to append this to .bashrc in your server.

```bash
export RBENV_ROOT=/usr/local/rbenv
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"
```

## Installation for a user

Install rbenv to `~#{node[:rbenv][:user]}/.rbenv`

### Recipe

```ruby
# your recipe
include_recipe "rbenv::user"
```

### Node

Use this with `itamae -y node.yml`

```yaml
# node.yml
rbenv:
  user: k0kubun
  global:
    2.3.0
  versions:
    - 2.3.0
    - 2.2.4

  # specify scheme to use in git clone, optional (default: https)
  scheme: git

  # Create ~/.rbenv/cache, optional (default: false)
  # See: https://github.com/rbenv/ruby-build#package-download-caching
  cache: true

  # Install build dependencies or not (default: true)
  # Recommend false if `--no-sudo`
  install_dependency: true

  # Install dependencies to build *-dev or not (default: false)
  install_development_dependency: false

# ruby-build is always installed. Specifying revision improves performance.
ruby-build:
  revision: e455975286e44393b1b33037ae1ce40ef2742401

# Optional plugin. Specify :install or :revision to install rbenv-default-gems.
rbenv-default-gems:
  default-gems:
    - bundler
    - bcat ~>0.6
    - rails --pre
  install: true
  # or
  revision: ead67889c91c53ad967f85f5a89d986fdb98f6fb
```

## MItamae

This plugin can be used for MItamae too. Put this repository under `./plugins` as git submodule.

```rb
node.reverse_merge!(
  rbenv: {
    user: 'k0kubun',
    global: '2.3.1',
    versions: %w[
      2.3.1
      2.2.5
    ],
  }
)

include_recipe "rbenv::user"
```

## Development
### Run test
Run itamae and serverspec tests to local (tmp/rbenv/)

```bash
bundle exec rake test:local
```

Run itamae and serverspec tests to docker (test for `rbenv::system`)

```bash
bundle exec rake test:docker_system
```

Run itamae and serverspec tests to docker (test for `rbenv::user`)

```bash
bundle exec rake test:docker_user
```

`test:docker_system` and `test:docker_user` use `ubuntu:jammy` by default.

If you want to change the Docker image, please provide the `SOURCE_IMAGE`.

e.g.

```bash
SOURCE_IMAGE=amazonlinux:2 bundle exec rake test:docker_system
```

## License

MIT License
