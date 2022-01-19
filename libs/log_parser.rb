class LogParser
  
  def read_first_line(file_name)
    begin
      file = File.open(file_name)
      first_line = file.readline
      file.close
      first_line
    rescue Errno::ENOENT
      raise "input file not found or does not exists"
    end
  end
end
