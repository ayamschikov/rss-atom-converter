#! /usr/bin/env ruby

require_relative './command_parser.rb'
require_relative './converter.rb'

cParser = CommandParser.new
file, options = cParser.parse
converter = Converter.new(file, options)
rss = converter.convert

STDOUT.puts(rss)
