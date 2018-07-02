require_relative "simple_warehouse/grid"
require_relative "simple_warehouse/crate"
require_relative "simple_warehouse/view"

class SimpleWarehouse

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      command = gets.chomp.split(" ")
      x = command[1]
      p = command[5]
      case command.first
      when 'help'
        show_help_message
      when 'init'
        puts init(*command[1..2].map(&:to_i))
      when 'store'
        puts store(*command[1..4].map(&:to_i), p)
      when 'locate'
        puts locate(x.to_s)
      when 'remove'
        puts remove(*command[1..2].map(&:to_i))
      when 'view'
        print_grid Grid.view
      when 'exit'
        exit
      else
        show_unrecognized_message
      end
    end
  end

  def init(w, h)
    Grid.init(w, h)
    View.populate
    'grid initialized'
  end

  def locate(p)
    response = Grid.locate(p)
    "crate list for " + p.to_s + ": " + response.to_s
  end

  def remove(x, y)
    if crate = Grid.remove(x, y)
       View.remove_crate(crate)
      "crate " + x.to_s + " " + y.to_s + " deleted"
    else
      'Crate doesn t exist'
    end
  end

  def store(x, y, w, h, p)
    case crate = Grid.store(x, y, w, h, p)
    when :fit
      'I doesn t fit'
    when :position
      'Wrong position'
    else
       View.add_crate(crate)
      'new crate added'
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
    grid.reverse_each do |array|
      print array.join(' ')
      print "\n"
    end
  end

end
