Then /^I should see "([^"]*)" on the account page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the edit user information page$/ do |arg1, arg2|
  page.find('h1',:text=>arg1)
end

Given /^I have a user information in user information page$/ do
  Factory.build(:user)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the user information show page$/ do |arg1, arg2|
  page.find('div',:text=>arg1)
  page.find('div',:text=>arg2)
end
