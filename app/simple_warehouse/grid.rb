class Grid

  def self.init(w, h)
    @size = { w: w, h: h }
    @grid = []
  end

  def self.store(x, y, w, h, p)
    if x.is_a?(Integer) && y.is_a?(Integer) && x >= 0 && y >= 0
      if fit(x, y, w, h)
        @grid << crate = Crate.new(x, y, w, h, p)
        crate
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
      @grid.each do |crate|
        if crate.x == x && crate.y == y
          @grid.delete(crate)
        end
        return crate
      end
    end
  end

  def self.locate(p)
    response = @grid.select{|crate| crate[:id] == p}
  end

  def self.view
    View.render
  end

  def self.grid
    @grid
  end

  def self.size
    @size
  end

  def self.fit(x, y, w, h)
    @grid.map do |hash|
      !((hash.max_right) > x && (hash.max_top) > y && hash.x <= x && hash.y <= y || (x + w) > hash.x && (y + h) > hash.y && x <= hash.x && y <= hash.y)
    end.all?
  end

end
