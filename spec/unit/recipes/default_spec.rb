require 'spec_helper'

describe_recipe 'openssh-lpk::default' do
  it { expect(chef_run).to include_recipe('chef-sugar::default') }
  it { expect(chef_run).to include_recipe('openssh::default') }

  context %Q(node['platform'] = 'ubuntu' AND node['platform_version'] = '10.04') do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '10.04') }
    it do
      expect(lambda { chef_run.converge(described_recipe) }).to raise_error(SystemExit)
    end
  end

  context %Q(node['platform'] = 'ubuntu' AND node['platform_version'] = '12.04') do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04') }
    it do
      expect(lambda { chef_run.converge(described_recipe) }).to raise_error(SystemExit)
    end
  end

  context %Q(node['platform'] = 'redhat' AND node['platform_version'] = '6.4') do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'redhat', version: '6.4').converge(described_recipe) }
    it { expect(chef_run).to install_package('openssh-ldap') }
  end

  context %Q(node['platform'] = 'centos' AND node['platform_version'] = '6.4') do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.4').converge(described_recipe) }
    it { expect(chef_run).to install_package('openssh-ldap') }
  end

  context %Q(node['platform'] = 'amazon' AND node['platform_version'] = '2014.09') do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'amazon', version: '2014.09').converge(described_recipe) }
    it { expect(chef_run).to install_package('openssh-ldap') }
  end
end
