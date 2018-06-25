require "spec_helper"

RSpec.describe SimpleWarehouse do
  it "initialize the application with a new grid" do
    grid = SimpleWarehouse.init
    expect(grid.empty?).to eq(true)
  end

  context "action on existing crates" do
    before(:each) do
      @x, @y, @w, @h, @p = [0, 0, 1, 2, "A"]
      SimpleWarehouse.init
    end
    it "store a new crate at the good position size and id" do
      params = [{x: @x, y: @y, w: @w, h: @h, id: @p}]
      crate = SimpleWarehouse.store(@x, @y, @w, @h, @p)
      expect(crate).to eq(params)
    end

    it "remove a crate at the good position" do
      SimpleWarehouse.store(@x, @y, @w, @h, @p)
      grid = SimpleWarehouse.remove(@x, @y)
      expect(grid.empty?).to eq(true)
    end

    it "locate a crate at the good position" do
      SimpleWarehouse.store(@x, @y, @w, @h, @p)
      SimpleWarehouse.store(@x, 2, @w, @h, @p)
      SimpleWarehouse.store(1, 0, @w, @h, "B")
      located = SimpleWarehouse.locate(@p)
      expect(located.include?({x: @x, y: @y, w: @w, h: @h, id: @p})).to eq(true)
      expect(located.include?({x: @x, y: 2, w: @w, h: @h, id: @p})).to eq(true)
      expect(located.count).to eq(2)
    end
  end
end
