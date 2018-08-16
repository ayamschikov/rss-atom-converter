#! /usr/bin/env ruby

require 'open-uri'
require 'rss'
require 'optparse'

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

class CommandParser
  def initialize
    @options = {}
  end

  def parse
    OptionParser.new do |parser|
      parser.banner = "Usage: converter.rb [@options] FILE"

      parser.on("-h", "--help", "Show this help message") do ||
        puts parser
        exit
      end

      parser.on("-o", "--out TYPE", "Output type [rss | atom]") do |v|
        if v == 'atom'
          @options['output'] = v
        else
          @options['output'] = 'rss'
        end
      end

      parser.on("-r", "--reverse", "Reverse items") do ||
        @options['reverse'] = true
      end

      parser.on("-s", "--sort", "Sort by publishing date") do ||
        @options['sort'] = true
      end

    end.parse!

    file = ARGV[0]
    return file, @options
  end
end

cParser = CommandParser.new
file, options = cParser.parse
converter = Converter.new(file, options)
rss = converter.convert

STDOUT.puts(rss)
