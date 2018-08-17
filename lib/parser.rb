require 'nokogiri'

class Parser
  attr_reader :hash
  def initialize(data, options)
    @data = data
    @options = options
    @hash = self.parse_to_hash
  end
  
  def parse_to_hash
    Nokogiri::XML(@data)
  end
end
