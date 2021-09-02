#!/usr/bin/env ruby
require_relative 'lib/parser'

Parser.load
Parser.run(ARGV)
