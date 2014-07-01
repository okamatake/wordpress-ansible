require 'spec_helper'

describe file('/etc/redhat-release') do
  it { should contain 'CentOS' }
end

describe yumrepo('epel') do
  it { should exist }
end

describe selinux do
  it { should be_permissive }
end

describe service('iptables') do
  it { should be_enabled }
end

describe iptables do
  it { should have_rule('-m state --state RELATED,ESTABLISHED -j ACCEPT') }
  it { should have_rule('-p icmp -j ACCEPT') }
  it { should have_rule('-i lo -j ACCEPT') }
  it { should have_rule('-j REJECT --reject-with icmp-host-prohibited').with_chain('INPUT') }
  it { should have_rule('-j REJECT --reject-with icmp-host-prohibited').with_chain('FORWARD') }
end
