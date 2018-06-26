require_relative "simple_warehouse/grid"
require_relative "simple_warehouse/crate"

class SimpleWarehouse

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      command = gets.chomp.split(" ")
      x = command[1].to_i
      y = command[2].to_i
      w = command[3].to_i
      h = command[4].to_i
      p = command[5]
      case command.first
        when 'help'
          show_help_message
        when 'init'
          puts Grid.init(x, y)
        when 'store'
          puts Grid.store(x, y, w, h, p)
        when 'locate'
          puts locate(p)
        when 'remove'
          puts Grid.locate(x, y)
        when 'view'
          print_grid Grid.view
        when 'exit'
          exit
        else
          show_unrecognized_message
      end
    end
  end

  def self.init(w, h)
    Grid.init(w, h)
    "grid initialized"
  end

  def self.locate(p)
    response = Grid.locate(p)
    "crate list for #{p}: #{response}"
  end

  def self.remove(x, y)
    if Grid.remove(x,y).nil?
      "Crate doesn t exist"
    else
      "crate #{x} #{y} deleted"
    end
  end

  def self.store(x, y, w, h, p)
    case Grid.store(x, y, w, h, p)
      when :fit
        "I doesn t fit"
      when :position
        "Wrong position"
      else
        "new crate added"
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

  def print_grid(grid)
    grid.reverse.each do |array|
      print array.join(" ")
      print "\n"
    end
  end

end
