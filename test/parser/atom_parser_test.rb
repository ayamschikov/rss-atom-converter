require 'require_all'
require './test/test_helper.rb'
require 'rss'
require_rel '../../lib'

class AtomParserTest < Minitest::Test
  def test_parse
    source = ParseHelper.parse(File.read('test/fixtures/atom.xml'))
    atom_parsed_file = File.read('test/fixtures/atom_parsed')

    assert atom_parsed_file == source.to_s
  end
end
