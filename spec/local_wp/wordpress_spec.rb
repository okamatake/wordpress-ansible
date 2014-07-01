require 'spec_helper'

describe file('/srv/wordpress') do
  it { should be_directory }
  it { should be_owned_by 'wordpress' }
  it { should be_grouped_into 'wordpress' }
end

describe group('wordpress') do
  it { should exist }
end

describe user('wordpress') do
  it { should exist }
  it { should belong_to_group 'wordpress' }
  it { should have_home_directory '/srv/wordpress' }
end
