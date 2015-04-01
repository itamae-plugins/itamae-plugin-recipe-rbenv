# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/rbenv/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-rbenv"
  spec.version       = Itamae::Plugin::Recipe::Rbenv::VERSION
  spec.authors       = ["Takashi Kokubun"]
  spec.email         = ["takashikkbn@gmail.com"]
  spec.summary       = %q{Itamae plugin to install ruby with rbenv}
  spec.description   = %q{Itamae plugin to install ruby with rbenv}
  spec.homepage      = "https://github.com/k0kubun/itamae-plugin-recipe-rbenv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
