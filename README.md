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

### Recipe

```
# your recipe
include_recipe "rbenv::system"
```

### Node

```yaml
# node.yml
rbenv:
  global:
    2.1.5
  versions:
    - 2.1.5
    - 2.1.3
```

Use this with `itamae -y node.yml`

## License

MIT License
