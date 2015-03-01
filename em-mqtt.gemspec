#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "em/mqtt/version"

Gem::Specification.new do |gem|
  gem.name        = 'em-mqtt'
  gem.version     = EventMachine::MQTT::VERSION
  gem.author      = 'Nicholas J Humfrey'
  gem.email       = 'njh@aelius.com'
  gem.homepage    = 'http://github.com/njh/ruby-em-mqtt'
  gem.summary     = 'MQTT for EventMachine'
  gem.description = 'This gem adds MQTT (Message Queue Telemetry Transport) protocol support to EventMachine.'
  gem.license     = 'MIT' if gem.respond_to?(:license=)

  gem.files         = %w(README.md LICENSE.md NEWS.md) + Dir.glob('lib/**/*.rb')
  gem.test_files    = Dir.glob('spec/*_spec.rb')
  gem.executables   = %w(em-mqtt)
  gem.require_paths = %w(lib)

  gem.add_runtime_dependency     'eventmachine'
  gem.add_runtime_dependency     'mqtt',        '>= 0.3.0'

  if Gem.ruby_version > Gem::Version.new('1.9')
    gem.add_development_dependency 'bundler',  '>= 1.5.0'
    gem.add_development_dependency 'rake',     '>= 0.10.0'
    gem.add_development_dependency 'yard',     '>= 0.8.0'
    gem.add_development_dependency 'rspec',    '~> 3.0.0'
    gem.add_development_dependency 'simplecov'
  elsif Gem.ruby_version > Gem::Version.new('1.8')
    gem.add_development_dependency 'bundler',  '>= 1.1.0'
    gem.add_development_dependency 'rake',     '~> 0.9.0'
    gem.add_development_dependency 'yard',     '~> 0.8.0'
    gem.add_development_dependency 'rspec',    '~> 3.0.0'
  else
    raise "#{Gem.ruby_version} is an unsupported version of ruby"
  end

end
