require_relative "./libs/log_parser.rb"

parser = LogParser.new("games.log")

print parser.parse_file
