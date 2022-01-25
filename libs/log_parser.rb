require 'json'

class LogParser

  def initialize (path)
    @file_name = path
    @players = []
  end

  def read_first_line
    begin
      file = File.open(@file_name)
      first_line = file.readline
      file.close
      first_line
    rescue Errno::ENOENT
      raise "input file not found or does not exists"
    end
  end

  def parse_file
    count_lines
    player_filter
    obj = {
      "#{@file_name.split("/").last}": {
        lines: @lines,
        players: @players
      }
    }
    obj_json = JSON.pretty_generate(obj)
  end

  def player_filter
    File.readlines(@file_name).each do |line|
      if line.include? "ClientUserinfoChanged"
        player = get_player(line)
        @players.push(player) unless @players.include?(player) 
      end
    end
    @players
  end

  private
  
  def get_player(line)
    line.split(" n\\").last.split("\\t").first
  end

  def count_lines
    @lines = File.foreach(@file_name).count
  end

end

