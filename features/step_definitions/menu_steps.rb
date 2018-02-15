Given("the following products exist:") do |table|
  table.hashes.each do |product|
    @menu = Menu.find_or_create_by(name: product[:Menu])
    Product.create(catagory: product[:Catagory], name: product[:Name], menu: @menu)
  end
end

When("the user visits the menu page") do
  visit "/menu"
end

Then("the user should see {string}") do |text|
  expect(page).to have_content text
end

Then("show me the page") do
  save_and_open_page
end
