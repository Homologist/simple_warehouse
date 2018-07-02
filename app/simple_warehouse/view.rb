class View

  def self.populate
    @view ||= []
    (1..Grid.size[:w]).each do |x|
      row = []
      (1..Grid.size[:h]).each do |y|
        row << '.'
      end
      @view << row
    end
  end

  def self.remove_crate(crate)
    ((crate.x)..(crate.max_right + 1)).each do |x|
      ((crate.y)..(crate.max_top + 1)).each do |y|
        @view[y][x] = '.'
      end
    end
  end

  def self.add_crate(crate)
    ((crate.x)..(crate.max_right + 1)).each do |x|
      ((crate.y)..(crate.max_top + 1)).each do |y|
        if first_corner(crate, x, y)
          if crate.w == 1 || crate.h == 1
            @view[y - 1 ][x - 1] = crate.id.to_s
          else
            @view[y][x] = crate.id.to_s
          end
        elsif occupied?(crate, x, y)
          @view[y][x] = ' '
        else
          '.'
        end
      end
    end
  end

  def self.render
    @view
  end

  private_class_method

  def self.occupied?(crate, x, y)
    crate.x < x + 1 && crate.max_right > x + 1 && crate.y < y + 1 && crate.max_top > y + 1
  end

  def self.first_corner(crate, x, y)
    (crate.w == 1 || crate.h == 1) && crate.x == x && crate.y == y || crate.middle_right == x + 1 && crate.middle_top == y + 1 || crate.w == 2 && crate.x == x  && crate.y == y || crate.h == 2 && crate.x == x  && crate.y == y
  end

end
