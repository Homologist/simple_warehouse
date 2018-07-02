require "spec_helper"

RSpec.describe View do
  context "action on existing views" do
    it "add a new crate to a view" do
      Grid.init(5, 5)
      list = [1, 1, 3, 3, "A"]
      @crate = Crate.new(*list)
      View.populate
      View.add_crate(@crate)

      expect(View.render).to eq([[".", ".", ".", ".", "."], [".", "A", ".", ".", "."], [".", ".", ".", ".", "."], [".", ".", ".", ".", "."], [".", ".", ".", ".", "."]])

      View.remove_crate(@crate)
      expect(View.render).to eq([[".", ".", ".", ".", "."], [".", ".", ".", ".", "."], [".", ".", ".", ".", "."], [".", ".", ".", ".", "."], [".", ".", ".", ".", "."]])
    end
  end
end
