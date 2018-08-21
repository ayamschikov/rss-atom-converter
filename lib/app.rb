class App
  def initialize(options)
    @options = options
  end

  def run(source)
    reader = Reader.new(readers: [UrlReader])
    reader_class = reader.get_class(source)
    data = reader_class.read(source)

    parsed_data = Parser.to_hash(data)

    handler = Handler.new(sort: @options['sort'], reverse: @options['reverse'])
    processed_data = handler.process(parsed_data)

    converter = Converter.new(output_format: @options['output_format'])
    xml = converter.to_xml(processed_data)

    STDOUT.puts(xml)
  end
end
