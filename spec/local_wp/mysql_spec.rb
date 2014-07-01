require 'spec_helper'

describe package('mysql-server') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(3306) do
  it { should be_listening }
end

describe command('getsebool mysql_connect_any') do
  it { should return_stdout 'mysql_connect_any --> on' }
end

describe file('/etc/my.cnf') do
  it { should be_file }
  its(:content) { should match /character-set-server\s*=\s*utf8/ }
end
