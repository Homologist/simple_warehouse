Given("a grid") do
  SimpleWarehouse.init
end

Given("a square crate of size {int} product code {int} at position {int} {int}") do |int, int2, int3, int4|
  SimpleWarehouse.store(int3, int4, int, int, int2)
end

When("I move the crate to position {int} {int}") do |int, int2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I can see the crate at position {int} {int}") do |int, int2|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I locate crate of product code {int}") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I can see all crate of product code {int}") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end