# frozen_string_literal: true

require 'json'

# Class to parse log file from Quake games
class LogParser
  def initialize(path)
    @file_name = path
    @players = []
    @kill_count = 0
  end

  def read_first_line
    file = File.open(@file_name)
    first_line = file.readline
    file.close
    first_line
  rescue Errno::ENOENT
    raise 'input file not found or does not exists'
  end

  def parse_file
    count_lines
    player_filter
    kill_counter
    obj = {
      "#{@file_name.split('/').last}": {
        lines: @lines,
        players: @players,
        total_kills: @kill_count
      }
    }
    JSON.pretty_generate(obj)
  end

  def player_filter
    File.readlines(@file_name).each do |line|
      if line.include? 'ClientUserinfoChanged'
        player = get_player(line)
        @players.push(player) unless @players.include?(player)
      end
    end
    @players
  end

  private

  def get_player(line)
    line.split(' n\\').last.split('\\t').first
  end

  def count_lines
    @lines = File.foreach(@file_name).count
  end
end
