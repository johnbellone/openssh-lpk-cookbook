Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.cache.scope = :box

  config.vm.box = ENV.fetch('VAGRANT_BOX', 'opscode-ubuntu-14.04')

  config.vm.define :ldap, primary: true do |guest|
    guest.vm.network :private_network, ip: '172.16.44.2'
    guest.vm.provision :chef_solo do |chef|
      chef.data_bags_path = File.join(File.expand_path('..', __FILE__), 'spec/fixtures/data_bags')
      chef.run_list = %w(openssh-lpk)
    end
  end
end
