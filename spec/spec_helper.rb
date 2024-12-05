ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rspec/xsd'
require 'nokogiri'
require 'pry'

RSpec.configure do |config|
  config.order = :random
  config.include RSpec::XSD
  RSPEC_ROOT = File.dirname __FILE__
end
