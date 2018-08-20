require 'nokogiri'

class Parser
  def initialize(output)
    @output = output
  end
  
  # TODO: parse to hash
  def parse_to_hash(data)
    Nokogiri::XML(data)
  end

  # TODO: add method to make rss/atom from hash
  def hash_to_xml(hash)
    if @output == 'rss'
    else
    end
  end
end
