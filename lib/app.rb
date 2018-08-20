class App
  def initialize(options)
    @options = options
  end

  def run(source)
    reader = Reader.new
    data = reader.read(source)

    parser = Parser.new(output_format: @options['output_format'])
    # TODO: rename hash to more meaningful name
    hash = parser.to_hash(data)

    converter = Converter.new(sort: @options['sort'], reverse: @options['reverse'])
    result = converter.convert(hash)

    xml = parser.to_xml(result)

    STDOUT.puts(xml)
  end
end
