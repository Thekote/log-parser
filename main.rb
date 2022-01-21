require_relative "./libs/log_parser.rb"

parser = LogParser.new("games.log")
p parser.read_first_line
print parser.parse_file

