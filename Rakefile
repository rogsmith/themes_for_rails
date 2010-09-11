# require File.join(File.dirname(__FILE__), 'lib', 'themes_for_rails')
require File.dirname(__FILE__) + "/lib/themes_for_rails/version.rb"

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run tests for all ORMs.'
task :default => :test

desc 'Run unit tests.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "themes_for_rails"
    gemspec.summary = "One line summary of your gem"
    gemspec.description = "A different and possibly longer explanation of"
    gemspec.email = "lucasefe@gmail.com"
    gemspec.homepage = "http://github.com/lucasefe/themes_for_rails"
    gemspec.authors = ["Lucas Florio"]
    gemspec.version = ThemesForRails::VERSION
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
