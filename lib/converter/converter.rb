class Converter
  def initialize(options = {})
    @output_format = options[:output_format]
  end
  
  def to_xml(hash)
    @output_format == 'rss' ? RssConverter.to_xml(hash) : AtomConverter.to_xml(hash)
  end
end
