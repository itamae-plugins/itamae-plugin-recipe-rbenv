describe file("#{node[:rbenv][:rbenv_root]}/bin/rbenv") do
  it { should be_file }
  it { should exist }
  it { should be_symlink }
end

describe file("#{node[:rbenv][:rbenv_root]}/plugins/ruby-build") do
  it { should be_directory }
  it { should exist }
end

describe file("#{node[:rbenv][:rbenv_root]}/plugins/rbenv-default-gems") do
  it { should be_directory }
  it { should exist }
end

describe file("#{node[:rbenv][:rbenv_root]}/default-gems") do
  it { should be_file }
  it { should exist }
  its(:content) { should eq "bundler\n" }
end

context "Passed rbenv.global from node.yml", if: node[:rbenv][:global] do
  describe file("#{node[:rbenv][:rbenv_root]}/shims/ruby") do
    it { should be_file }
    it { should exist }
    it { should be_executable }
    it { should be_owned_by "root" }
  end

  describe command("#{node[:rbenv][:rbenv_root]}/shims/ruby --version") do
    its(:stdout) { should_not be_empty }
    its(:stderr) { should be_empty }
    its(:exit_status) { should eq 0 }
  end
end
