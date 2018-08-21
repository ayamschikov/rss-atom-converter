require 'rss'

class Parser
  def initialize(options = {})
    @output_format = options[:output_format]
  end
  
  def to_hash(data)
    xml = RSS::Parser.parse(data)
    xml.feed_type == 'rss' ? RssParser.to_hash(xml) : AtomParser.to_hash(xml)
  end

  def to_xml(hash)
    @output_format == 'rss' ? RssConverter.to_xml(hash) : AtomConverter.to_xml(hash)
  end
end
