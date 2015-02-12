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

  # rbenv install dir, optional (default: /use/local/rbenv )
  rbenv_root: "/path/to/rbenv"

# revision of sstephenson/ruby-build, optional
ruby-build:
  revision: e455975286e44393b1b33037ae1ce40ef2742401
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
