class Converter
  attr_reader :result
  attr_accessor :rss
  def initialize(file, options)
    @options = options
  end

  # TODO: check if link or file is available
  # send error if not
  def read
    if @file =~ /http/
      @rss = RSS::Parser.parse(open(@file))
    else
      @rss = RSS::Parser.parse(File.read(@file))
    end
  end

end
