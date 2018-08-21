class Reader
  def initialize(options = {})
    @readers = [FileReader]
    @readers += options[:readers] if options[:readers]
  end

  def get_class(source)
    @readers.each do |reader|
      return reader if reader.can_work?(source)
    end
    puts 'unsopperted source'
    exit
  end
end
