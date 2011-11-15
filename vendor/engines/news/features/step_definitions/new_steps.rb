Given /^I have no news$/ do
  New.delete_all
end

Given /^I (only )?have news titled "?([^\"]*)"?$/ do |only, titles|
  New.delete_all if only
  titles.split(', ').each do |title|
    New.create(:title => title)
  end
end

Then /^I should have ([0-9]+) news?$/ do |count|
  New.count.should == count.to_i
end
