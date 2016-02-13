ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rspec/xsd'
require 'nokogiri'

RSpec.configure do |config|
  config.order = :random
  config.include RSpec::XSD
end
