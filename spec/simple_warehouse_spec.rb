require "spec_helper"

RSpec.describe SimpleWarehouse do
  it "initialize the application with a new grid" do
    grid = SimpleWarehouse.init
    expect(grid.empty?).to eq(true)
  end

  it "store a new crate at the good position size and id" do
    x, y, w, h, p = [0, 0, 1, 2, "A"]
    params = [{x: x, y: y, w: w, h: h, id: p}]
    SimpleWarehouse.init
    crate = SimpleWarehouse.store(x, y, w, h, p)
    expect(crate).to eq(params)
  end
end
