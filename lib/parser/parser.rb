module ParseHelper
  require 'rss'

  def self.parse(data)
    xml = RSS::Parser.parse(data)
    parser_object = Object.const_get("Parser::#{xml.feed_type.downcase.capitalize}Parser")
    parser_object.parse(xml)
  end
end
