class App
  def initialize(options)
    @options = options
  end

  def run(source)
    reader = Reader.new
    data = reader.read(source)

    parser = Parser.new(output_format: @options['output_format'])
    parsed_data = parser.to_hash(data)

    converter = Handler.new(sort: @options['sort'], reverse: @options['reverse'])
    result = converter.process(parsed_data)

    xml = parser.to_xml(result)

    STDOUT.puts(xml)
  end
end
