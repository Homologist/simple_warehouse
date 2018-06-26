Given("a grid") do
  SimpleWarehouse.init
end

Given("a square crate of size {int} product code {int} at position {int} {int}") do |int, int2, int3, int4|
  SimpleWarehouse.store(int3, int4, int, int, int2)
end

When("I remove the crate at position {int} {int}") do |int, int2|
  SimpleWarehouse.remove(int, int2)
end

Then("I can't see the crate at position {int} {int}") do |int, int2|
  expect(SimpleWarehouse.grid.empty?).to eq(true)
end

When("I locate crate of product code {int}") do |int|
  @located = SimpleWarehouse.locate(int)
end

Then("I can see all crate of product code {int}") do |int|
  expect(@located.uniq.count).to eq(2)
  expect(@located[0][:id]).to eq(42)
  expect(@located[1][:id]).to eq(42)
end

Then("I get the message {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
