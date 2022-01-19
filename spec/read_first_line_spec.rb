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
end

