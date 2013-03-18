$:.unshift(File.join(File.dirname(__FILE__),'..','lib'))

require 'rubygems'
require 'bundler'
require 'em/mqtt'

Bundler.require(:default, :development)

# This is needed by rcov
require 'rspec/autorun'
