
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /^the director of "(.*)" should be "([^"]*)"$/ do |movie_name, value|
  expect(page).to have_content(movie_name)
  expect(page.body).to match(/Director:\s#{value}/)
end

Given /I delete the movie (.*)/ do |movie_name|
    Movie.delete movie
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1)).to be < page.body.index(e2)
end