#! /usr/bin/env ruby

require 'require_all'
require_all 'lib'

cParser = CommandParser.new
file, options = cParser.parse
converter = Converter.new(file, options)
rss = converter.convert

STDOUT.puts(rss)
