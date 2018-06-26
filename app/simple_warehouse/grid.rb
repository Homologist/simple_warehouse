class Grid

  def self.init(w, h)
    @size = { w: w, h: h }
    @grid = []
  end

  def self.store(x, y, w, h, p)
    if x.is_a?(Integer) && y.is_a?(Integer) && x >= 0 && y >= 0
      if fit(@grid, x, y, w, h)
        @grid << Crate.new(x, y, w, h, p)
      else
        :fit
      end
    else
      :position
    end
  end

  def self.remove(x, y)
    if @grid.select{|crate| crate.x == x && crate.y == y}.empty?
      nil
    else
      @grid.delete_if{|crate| crate.x == x && crate.y == y}
    end
  end

  def self.locate(p)
    response = @grid.select{|crate| crate[:id] == p}
  end

  def self.view
    populate_grid(grid, size)
  end

  def self.grid
    @grid
  end

  def self.size
    @size
  end

  private_class_method

  def self.fit(grid, x, y, w, h)
    grid.map do |hash|
      !((hash.max_right) > x && (hash.max_top) > y && hash.x <= x && hash.y <= y || (x + w) > hash.x && (y + h) > hash.y && x <= hash.x && y <= hash.y)
    end.all?
  end

  def self.populate_grid(temp_grid, sizes)
    full_grid = populate_grid_without_data(sizes)
    final = []
    full_grid.each_with_index do |array, y|
      final << array.map.with_index do |hash, x|
        finded = temp_grid.select{ |crate| crate.x < x + 1 && crate.max_right > x + 1 && crate.y < y + 1 && crate.max_top > y + 1 }.first
        crate_start = temp_grid.select{ |crate| crate.middle_right == x + 1 && crate.middle_top == y + 1 }.first
        if crate_start
          crate_start.id.to_s
        elsif finded
          ' '
        else
          '.'
        end
      end
    end
    final
  end

  def self.populate_grid_without_data(sizes)
    temp_grid = []
    (1..sizes[:w]).each do |x|
      row = []
      (1..sizes[:h]).each do |y|
        row << { x: x, y: y, kind: :dot }
      end
      temp_grid << row
    end
    temp_grid
  end
end
