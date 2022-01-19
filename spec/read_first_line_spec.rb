require_relative '../libs/log_parser.rb'

describe LogParser do
  describe '#read_first_line' do
    it 'should return first line from file' do
      expect(LogParser.new.read_first_line('./spec/fixtures/game_test.log')).to eq("  0:00 ------------------------------------------------------------\n")
    end

    it 'should return an error if file does not exists' do
    expect{LogParser.new.read_first_line('nonExistingFile.log')}.to raise_error("input file not found or does not exists")
    end
  end
end

