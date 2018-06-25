require "spec_helper"

RSpec.describe SimpleWarehouse do
  it "initialize the application with a new grid" do
    grid = SimpleWarehouse.init
    expect(grid.empty?).to eq(true)
  end
end
