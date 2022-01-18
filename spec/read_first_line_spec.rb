require_relative '../main'

describe Main do
  it 'should return first line from file' do
    expect(Main.new.read_first_line('games.log')).to eq("  0:00 ------------------------------------------------------------\n")
  end
end

