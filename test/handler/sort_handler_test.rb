require 'require_all'
require './test/test_helper.rb'
require 'rss'
require_rel '../../lib'

class SortHandlerTest < Minitest::Test
  def test_sort_by_date
    source = ParseHelper.parse(File.read('test/fixtures/hexlet.rss'))
    sorted_file = ParseHelper.parse(File.read('test/fixtures/sort_date_hexlet.rss'))

    sort_handler = SortHandler.new(['published'])
    accepted = source.dup
    accepted[:items] = sort_handler.process(source[:items])

    assert sorted_file == accepted
  end

  def test_sort_by_link
    source = ParseHelper.parse(File.read('test/fixtures/hexlet.rss'))
    sorted_file = ParseHelper.parse(File.read('test/fixtures/sort_link_hexlet.rss'))

    sort_handler = SortHandler.new(['link'])
    accepted = source.dup
    accepted[:items] = sort_handler.process(source[:items])
    
    assert sorted_file == accepted
  end
end

