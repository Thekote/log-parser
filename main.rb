# frozen_string_literal: true

require_relative './libs/log_parser'

parser = LogParser.new('games.log')

print parser.parse_file
