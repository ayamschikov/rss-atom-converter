require 'rubygems'
require 'factory_bot'
require 'bundler/setup'

require 'coveralls'
require 'minitest/autorun'

Coveralls.wear!
FactoryBot.reload

class Minitest::Test
  include FactoryBot::Syntax::Methods
end
