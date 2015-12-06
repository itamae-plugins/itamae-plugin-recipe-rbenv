# Itamae::Plugin::Recipe::Rbenv

[Itamae](https://github.com/ryotarai/itamae) plugin to install ruby with rbenv

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-rbenv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-rbenv

## Usage

System wide rbenv installation

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
    2.2.0
  versions:
    - 2.2.0
    - 2.1.5

  # rbenv install dir, optional (default: /usr/local/rbenv)
  rbenv_root: "/path/to/rbenv"

  # specify scheme to use in git clone (default: git)
  scheme: https

# revision of rbenv/ruby-build, optional
ruby-build:
  revision: e455975286e44393b1b33037ae1ce40ef2742401

rbenv-default-gems:
  default-gems:
    - bundler
    - bcat ~>0.6
    - rails --pre
  # revision of rbenv/rbenv-default-gems, optional
  revision: ead67889c91c53ad967f85f5a89d986fdb98f6fb

# revision of rbenv/rbenv-gem-rehash, optional
rbenv-gem-rehash:
  revision: 4d7b92de4bdf549df59c3c8feb1890116d2ea985
```

### .bashrc

Recommend to append this to .bashrc in your server.

```bash
export RBENV_ROOT=/usr/local/rbenv
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"
```

## License

MIT License
