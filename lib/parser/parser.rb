require 'rss'

class Parser
  def self.to_hash(data)
    xml = RSS::Parser.parse(data)
    xml.feed_type == 'rss' ? RssParser.to_hash(xml) : AtomParser.to_hash(xml)
  end

end
