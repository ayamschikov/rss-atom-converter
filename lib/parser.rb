require 'nokogiri'

class Parser
  def initialize(data, options)
    @data = data
    @options = options
    self.parse_to_hash
  end
  
  def parse_to_hash
    Nokogiri::XML(@data)
  end
end
