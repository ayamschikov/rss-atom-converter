class App
  def initialize(file, options)
    @file = file
    @options = options
  end

  def run
    data = Reader.new(@file)
    hash = Parser.new(data, @options)
    result = Converter.new(hash, @options)

    STDOUT.puts(result)
  end
end
