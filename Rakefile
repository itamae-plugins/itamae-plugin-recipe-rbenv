require "bundler/gem_tasks"
require "rspec/core/rake_task"

ENV["SOURCE_IMAGE"] ||= "ubuntu:jammy"

docker_targets = %i(docker_system docker_user)

namespace :test do
  docker_targets.each do |target|
    namespace target do
      node_yaml = "#{__dir__}/spec/recipes/#{target}/node.yml"
      test_image = "itamae-plugin-recipe-rbenv-#{target}:latest"

      desc "Run itamae to #{target}"
      task :itamae do
        sh "itamae docker --node-yaml=#{node_yaml} #{__dir__}/spec/recipes/#{target}/install.rb --image=#{ENV["SOURCE_IMAGE"]} --tag #{test_image}"
      end

      desc "Run serverspec tests to #{target}"
      RSpec::Core::RakeTask.new(:serverspec) do |t|
        ENV["TEST_IMAGE"] = test_image
        ENV["NODE_YAML"] = node_yaml
        t.pattern = "spec/**/*_spec.rb"
      end
    end

    desc "Run itamae and serverspec tests to #{target}"
    task target => ["#{target}:itamae", "#{target}:serverspec"]
  end

  namespace :local do
    node_yaml = "#{__dir__}/spec/recipes/local/node.yml"

    desc "Run itamae to local (tmp/rbenv/)"
    task :itamae do
      sh "itamae local --node-yaml=#{node_yaml} #{__dir__}/spec/recipes/local/install.rb"
    end

    desc "Run serverspec tests to local (tmp/rbenv/)"
    RSpec::Core::RakeTask.new(:serverspec) do |t|
      ENV["NODE_YAML"] = node_yaml
      t.pattern = "spec/**/*_spec.rb"
    end
  end

  desc "Run itamae and serverspec tests to local (tmp/rbenv/)"
  task :local => %w[local:itamae local:serverspec]
end

desc "Run test"
task :test => docker_targets.map { |target| "test:#{target}" } + %i(local)

task default: :test
