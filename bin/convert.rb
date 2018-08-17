#! /usr/bin/env ruby

require 'require_all'
require 'optparse'
require_rel'../lib'

OptionParser.new do |parser|
  parser.banner = "Usage: converter.rb [options] FILE"

  parser.on("-h", "--help", "Show this help message") do ||
    puts parser
    exit
  end

  parser.on("-o", "--out TYPE", "Output type [rss | atom]") do |v|
    if v == 'atom'
      options['output'] = v
    else
      options['output'] = 'rss'
    end
  end

  parser.on("-r", "--reverse", "Reverse items") do ||
    options['reverse'] = true
  end

  parser.on("-s", "--sort", "Sort by publishing date") do ||
    options['sort'] = true
  end

end.parse!

file = ARGV[0]
 
app = App.new(file, options)
app.run
