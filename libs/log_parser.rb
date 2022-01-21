require 'json'

class LogParser

  def initialize (path)
    @file_name = path
    @players = []
    @kill_count = 0
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

  def count_lines
    @lines = File.foreach(@file_name).count
  end

  def parse_file
    count_lines
    player_filter
    kill_counter
    obj = {
      "#{@file_name.split("/").last}": {
        lines: @lines,
        players: @players,
        total_kills: @kill_count
      }
    }
    obj_json = JSON.pretty_generate(obj)
  end

  def player_filter
    File.readlines(@file_name).each do |line|
      if line.include? "killed"
        player = line.split("killed ").last.split(" by").first
        @players.push(player) unless @players.include?(player)
      elsif line.include? "ClientUserinfoChanged"
        player = line.split(" n\\").last.split("\\t").first
        @players.push(player) unless @players.include?(player) 
      end
    end
    @players
  end

  def kill_counter
    File.readlines(@file_name).each do |line|
      if line.include? "killed"
        @kill_count += 1
      end
    end
    @kill_count
  end


end

