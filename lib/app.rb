require_rel 'reader'
class App
  READERS_ARRAY = [Readers::FileReader].freeze

  def initialize(options)
    @options = options
    @readers = READERS_ARRAY + (options['readers'] || [])
  end

  def run(source)
    reader_class = reader_factory(source)
    data = reader_class.read(source)

    parsed_data = ParseHelper.parse(data)

    handler = HandlerHelper.new({sort: @options['sort'], reverse: @options['reverse']}.compact)
    processed_data = handler.process(parsed_data)

    converter = converter_factory(@options['output_format'], processed_data).new(id: '333333', link: 'new_link')
    xml = converter.convert(processed_data)

    STDOUT.puts(xml)
  end

  def reader_factory(source)
    @readers.find {|reader| reader.can_work?(source)}
  end

  def converter_factory(output_format, source)
    Object.const_get("Converter::#{output_format.capitalize}Converter")
  end
end
