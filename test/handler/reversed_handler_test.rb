require 'require_all'
require './test/test_helper.rb'
require 'rss'
require_rel '../../lib'

class ReverseHandlerTest < Minitest::Test
  def test_reverse

    source = ParseHelper.parse(File.read('test/fixtures/hexlet.rss'))
    reversed_file = ParseHelper.parse(File.read('test/fixtures/reversed_hexlet.rss'))

    reverse_handler = ReverseHandler.new
    accepted = source.dup
    accepted[:items] = reverse_handler.process(source[:items])

    assert reversed_file == accepted
  end
end

