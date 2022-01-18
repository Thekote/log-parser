class Main
  def read_first_line(file_name)
    file = File.open(file_name)
    first_line = file.readline
    file.close
    p first_line
  end
end
Main.new.read_first_line("games.log")

