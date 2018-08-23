#! /usr/bin/env ruby

require 'require_all'
require 'optparse'
require_rel '../lib'

options = {}
OptionParser.new do |parser|
  parser.banner = 'Usage: converter.rb [options] FILE'
  options['sort'] = []

  parser.on('-h', '--help', 'Show this help message') do
    puts parser
    exit
  end

  parser.on('-o', '--out TYPE', 'Output type [rss | atom]') do |format|
    options['output_format'] = format
  end

  parser.on('-r', '--reverse', 'Reverse items') do
    options['reverse'] = true
  end

  parser.on('-n', '--sort', 'Sort by name') do
    options['sort'] << 'title'
  end

  parser.on('-s', '--sort', 'Sort by publishing date') do
    options['sort'] << 'published'
  end
end.parse!

source = ARGV[0]
options['readers'] = [Readers::UrlReader]

app = App.new(options)
app.run(source)
