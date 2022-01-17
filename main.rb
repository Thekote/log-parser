class Main
  def read_first_line(file_name)
    file = File.open(file_name)
    first_line = file.readline
    puts first_line
    file.close
  end
end
Main.new.read_first_line("games.log")
