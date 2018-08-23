require 'require_all'
require './test/test_helper.rb'
require 'rss'
require_rel '../../lib'

class RssParserTest < Minitest::Test
  def test_parse
    source = ParseHelper.parse(File.read('test/fixtures/hexlet.rss'))
    rss_parsed_file = File.read('test/fixtures/rss_parsed_hexlet')

    assert rss_parsed_file == source.to_s
  end
end
