# frozen_string_literal: true

require 'json'
require_relative '../libs/log_parser'

describe LogParser do
  describe '#read_first_line' do
    it 'should return first line from file' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      expect(parser.read_first_line).to eq("  0:00 ------------------------------------------------------------\n")
    end

    it 'should return an error if file does not exists' do
      parser = LogParser.new('nonExistingFile.log')
      expect { parser.read_first_line }.to raise_error('input file not found or does not exists')
    end
  end

  describe '#parse_file' do
    it 'should return a json when called' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      obj = { "game_test.log": { "lines": 12, "players": ['Isgalamido'], "kills": {"Zeh": 1}, "total_kills": 1 } }
      expect(parser.parse_file).to eq(JSON.pretty_generate(obj))
    end
  end

  describe '#player_filter' do
    it 'should return list of players on the file' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      expect(parser.player_filter).to eq(['Isgalamido'])
    end
  end

  describe '#player_kill_counter' do
    it 'should return a list of players and their number of kills' do
      parser = LogParser.new('./spec/fixtures/game_test.log')
      expect(parser.player_kill_counter).to eq({"Zeh"=>1})
    end
  end

end
