class App
  def initialize(file, options)
    @file = file
    @options = options
  end

  def run
    reader = Reader.new
    data = reader.read(@file)

    parser = Parser.new(@options['output'])
    hash = parser.parse_to_hash(data)

    converter = Converter.new(@options)
    result = converter.convert(hash)

    xml = parser.hash_to_xml(result)

    STDOUT.puts(xml)
  end
end
