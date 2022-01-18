require_relative "./libs/log_parser.rb"

parser = LogParser.new.read_first_line("games.log")

