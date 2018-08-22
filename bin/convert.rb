#! /usr/bin/env ruby

require 'require_all'
require 'optparse'
require_rel '../lib'

options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: converter.rb [options] FILE"

  parser.on("-h", "--help", "Show this help message") do ||
    puts parser
    exit
  end

  parser.on("-o", "--out TYPE", "Output type [rss | atom]") do |format|
    if format == 'atom' || format == 'rss'
      options['output_format'] = format
    else
      puts "No such format: #{format}"
      exit
    end
  end

  parser.on("-r", "--reverse", "Reverse items") do ||
    options['reverse'] = true
  end

  parser.on("-s", "--sort", "Sort by publishing date") do ||
    options['sort'] = true
  end

end.parse!

source = ARGV[0]
options['readers'] = [Readers::UrlReader] 
 
app = App.new(options)
app.run(source)
