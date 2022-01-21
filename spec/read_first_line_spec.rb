require 'json'
require_relative '../libs/log_parser.rb'

describe LogParser do
  describe '#read_first_line' do
    it 'should return first line from file' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      expect(parser.read_first_line).to eq("  0:00 ------------------------------------------------------------\n")
    end

    it 'should return an error if file does not exists' do
      parser = LogParser.new('nonExistingFile.log')
      expect{parser.read_first_line}.to raise_error("input file not found or does not exists")
    end
  end

  describe '#parse_file' do
    it 'should return a json when called' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      obj = {"game_test.log": {"lines": 11, "players": ["Isgalamido"]}}
      expect(parser.parse_file).to eq(JSON.pretty_generate(obj))
    end
  end

  describe '#count_lines' do
    it 'should not fail if the number of lines is correct' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      expect(parser.count_lines).to match(11)
    end
  end

  describe '#player_filter' do
    it 'should return list of players on the file' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      expect(parser.player_filter).to eq(["Isgalamido"])
    end
  end
end

