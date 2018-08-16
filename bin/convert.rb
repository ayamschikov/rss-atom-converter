#! /usr/bin/env ruby

require 'require_all'
require_all 'lib'

cParser = CommandParser.new
file, options = cParser.parse
data = Reader.new(file)
hash = Parser.new(data, options)
result = Converter.new(hash, options)

STDOUT.puts(result)
