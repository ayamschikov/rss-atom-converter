#! /usr/bin/env ruby

require 'open-uri'
require 'rss'
require 'optparse'

options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: converter.rb [options] FILE"

  parser.on("-h", "--help", "Show this help message") do ||
    puts parser
    exit
  end

  parser.on("-o", "--out TYPE", "Output type [rss | atom]") do |v|
    if v == 'atom'
      options[:output] = v
    else
      options[:output] = 'rss'
    end
  end

  parser.on("-r", "--reverse", "Reverse items") do ||
    options[:reverse] = true
  end

  parser.on("-s", "--sort", "Sort by publishing date") do ||
    options[:sort] = true
  end

end.parse!

file = ARGV[0]

# TODO: check if link or file is available
# send error if not
if file =~ /http/
  rss = RSS::Parser.parse(open(file))
else
  rss = RSS::Parser.parse(File.read(file))
end

# TODO: add atom support
if options[:reverse]
  rss.channel.items.reverse!
end

if options[:sort]
  rss.channel.items.sort! {|a, b| a.pubDate <=> b.pubDate}
end

# TODO: implement rss-atom conversion
if !options[:output]
  options[:output] = 'RSS20'
end
#result = RSS::Maker.make(options[:output]) { |maker| rss}

STDOUT.puts(rss)
