require_rel 'reader'
class App
  READERS_ARRAY = [Readers::FileReader] 

  def initialize(options)
    @options = options
    @readers = READERS_ARRAY + (options['readers'] || [])
  end

  def run(source)
    reader_class = reader_factory(source)
    data = reader_class.read(source)

    parsed_data = Parser.to_hash(data)

    handler = Handler.new(sort: @options['sort'], reverse: @options['reverse'])
    processed_data = handler.process(parsed_data)

    converter = Converter.new(output_format: @options['output_format'])
    xml = converter.to_xml(processed_data)

    STDOUT.puts(xml)
  end

  def reader_factory(source)
    @readers.find {|reader| reader.can_work?(source)}
  end
end
