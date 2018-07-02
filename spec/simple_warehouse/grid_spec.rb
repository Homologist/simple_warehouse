require "spec_helper"

RSpec.describe Grid do
  it "initialize the application with a new grid" do
    Grid.init(3, 4)
    grid = Grid.grid
    size = Grid.size
    expect(grid.empty?).to eq(true)
    expect(size).to eq({w: 3, h: 4})
  end

  context "action on existing crates" do
    before(:each) do
      @x, @y, @w, @h, @p = [0, 0, 1, 2, "A"]
      Grid.init(4, 4)
    end

    it "store a new crate at the good position size and id" do
      params = Crate.new(@x, @y, @w, @h, @p)
      crate = Grid.store(@x, @y, @w, @h, @p)
      expect(crate).to eq(params)
    end

    it "remove a crate at the good position" do
      Grid.store(@x, @y, @w, @h, @p)
      Grid.remove(@x, @y)
      expect(Grid.grid.empty?).to eq(true)
    end

    it "locate a crate at the good position" do
      Grid.store(@x, @y, @w, @h, @p)
      Grid.store(@x, 2, @w, @h, @p)
      Grid.store(1, 0, @w, @h, "B")
      located = Grid.locate(@p)
      expect(located.include?(Crate.new(@x, @y, @w, @h, @p))).to eq(true)
      expect(located.include?(Crate.new(@x, 2, @w, @h, @p))).to eq(true)
      expect(located.count).to eq(2)
    end
  end
end
