class SimpleWarehouse
require "byebug"
  def self.init
    @grid = []
  end

  def self.store(x, y, w, h, p)
    if x.is_a?(Integer) && y.is_a?(Integer) && x >= 0 && y >= 0
      if fit(@grid, x, y, w, h)
        @grid << {x: x, y: y, w: w, h: h, id: p}
      else
        "I doesn t fit"
      end
    else
      "Wrong position"
    end
  end

  def self.remove(x, y)
    if @grid.select{|crate| crate[:x] == x && crate[:y] == y}.empty?
      "Crate doesn t exist"
    else
      @grid.delete_if{|crate| crate[:x] == x && crate[:y] == y}
    end
  end

  def self.locate(p)
    @grid.select{|crate| crate[:id] == p}
  end

  def self.grid
    @grid
  end

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      command = gets.chomp
      case command
        when 'help'
          show_help_message
        when 'exit'
          exit
        else
          show_unrecognized_message
      end
    end
  end

  private

  def show_help_message
    puts 'help             Shows this help message
init W H         (Re)Initialises the application as a W x H warehouse, with all spaces empty.
store X Y W H P  Stores a crate of product code P and of size W x H at position (X,Y).
locate P         Show a list of positions where product code P can be found.
remove X Y       Remove the crate at position (X,Y).
view             Output a representation of the current state of the shelves.
exit             Exits the application.'
  end

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def exit
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end

  def self.fit(grid, x, y, w, h)
    grid.map do |hash|
      !((hash[:x] + hash[:w]) > x && (hash[:y] + hash[:h]) > y && hash[:x] <= x && hash[:y] <= y  || (x + w) > hash[:x] && (y + h) > hash[:y] && x  <= hash[:x] && y <= hash[:y])
    end.all?
  end

end
