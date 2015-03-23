source 'https://rubygems.org'

group :development, :test do
  gem 'puppetlabs_spec_helper', '0.9.1', :require => false
  gem 'ruby-augeas', :require => false
  gem 'rspec', ">=2.0.0", :require => false
  gem 'rspec-puppet-augeas', :require => false
  gem 'rspec-puppet-utils', :require => false

  gem 'rspec-puppet',
     :git => 'https://github.com/joshcooper/rspec-puppet.git',
     #TODO: Revert to proper rspec-puppet branch after the following PR gets merged.
     #https://github.com/rodjek/rspec-puppet/pull/237
     :branch => 'dont-set-libdir',
     :require => false

  gem 'ci_reporter', :require => false
  gem 'ci_reporter_rspec', '1.0.0', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
