require 'open-uri'
require 'rss'

class Converter
  attr_reader :result
  attr_accessor :rss
  def initialize(file, options)
    @file = file
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

  # TODO: add atom support
  def reverse
    if @options['reverse']

      @rss.channel.items.reverse!
    end
  end

  def sort
    if @options['sort']
      @rss.channel.items.sort! {|a, b| a.pubDate <=> b.pubDate}
    end
  end

  def convert
    self.read
    self.reverse
    self.sort
    # TODO: implement rss-atom conversion
    if !@options['output']
      @options['output'] = 'RSS20'
    end
    return @rss
    #result = RSS::Maker.make(options[:output]) { |maker| rss}
  end
end
