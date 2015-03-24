require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'ci/reporter/rake/rspec'

PuppetLint.configuration.fail_on_warnings
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

if RUBY_VERSION >= "1.9"
  task :spec   => 'ci:setup:rspec'
end

desc 'Validate ERB template and puppet syntax, and template interpolation'
task :precommit_check do
  Rake::Task[:spec_prep].invoke
  Rake::Task["syntax:templates"].invoke
  Rake::Task[:templates_standalone].invoke
  Rake::Task[:spec_standalone].invoke
  Rake::Task[:spec_clean].invoke
end

desc "Run template acceptance tests on existing fixtures directory"
RSpec::Core::RakeTask.new(:templates_standalone) do |t|
  t.rspec_opts = ['--color']
  t.pattern = 'spec/templates/**/*_spec.rb'
end

desc "Run template acceptance tests"
task :templates do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:templates_standalone].invoke
  Rake::Task[:spec_clean].invoke
end
