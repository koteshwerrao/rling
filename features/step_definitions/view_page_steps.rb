Then /^I should see "([^"]*)" on the view_index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that view page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Given /^I have a view in view_index page$/ do
  @view = View.create(:title=>"Developer", :body=>"This is Developer view", :perma_link=>"/developer", :home_page=>"0", :page_view_type=>"1", :type=>"View", :view_type=>"table", :view_for=>"4", :creator_id=>"1", :updater_id=>"1")
end

Then /^I should see "([^"]*)" on that view_index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for "([^"]*)" on the view_index page$/ do |arg1, arg2|
  if arg1 == "Show" && arg2 == @view
    visit page_path(arg2)
  elsif arg1 == "Edit" && arg2 == @view
    visit edit_page_path(arg2)
  end
end

Then /^I should not see "([^"]*)" on the view_index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

When /^I click "([^"]*)" for "([^"]*)" on the view_index page$/ do |arg1, arg2|
  if arg1 == "View Components" 
    visit view_view_components_path(@view)
  end
end

Then /^I should see "([^"]*)" on the view_components index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on the view_component index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on that view page$/ do |arg1|
  page.find('li',:text=>arg1)
end
