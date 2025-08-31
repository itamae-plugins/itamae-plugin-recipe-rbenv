require "bundler/gem_tasks"
require "rspec/core/rake_task"

ENV["SOURCE_IMAGE"] ||= "ubuntu:jammy"

targets = %i(system user)

namespace :test do
  targets.each do |target|
    namespace target do
      node_yaml = "#{__dir__}/spec/#{target}/recipes/node.yml"
      test_image = "itamae-plugin:#{target}"

      desc "Run itamae to #{target}"
      task :itamae do
        ENV["TEST_IMAGE"] = "itamae-plugin:#{target}"
        sh "itamae docker --node-yaml=#{node_yaml} spec/#{target}/recipes/install.rb --image=#{ENV["SOURCE_IMAGE"]} --tag #{test_image}"
      end

      desc "Run serverspec tests to #{target}"
      RSpec::Core::RakeTask.new(:serverspec) do |t|
        ENV["TEST_IMAGE"] = test_image
        ENV["NODE_YAML"] = node_yaml
        t.pattern = "spec/#{target}/*_spec.rb"
      end
    end

    desc "Run itamae and serverspec tests to #{target}"
    task target => ["#{target}:itamae", "#{target}:serverspec"]
  end
end

desc "Run test"
task :test => targets.map { |target| "test:#{target}" }

task default: :test
