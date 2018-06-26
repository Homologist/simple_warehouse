Crate = Struct.new(:x, :y, :w, :h, :id) do

  def max_right
    x + w - 1
  end

  def max_top
    y + h - 1
  end

  def middle_right
    x + (w - 1) / 2
  end

  def middle_top
    y + (h - 1) / 2
  end
end
