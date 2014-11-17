# Itamae::Plugin::Recipe::Rbenv

Itamae plugin to install ruby with rbenv

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

System wide rbenv install

### Recipe

```
# your recipe
include_recipe "rbenv::system"
```

### Node

Use this with `itamae -y node.yml`

```yaml
# node.yml
rbenv:
  global:
    2.1.5
  versions:
    - 2.1.5
    - 2.1.3
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
