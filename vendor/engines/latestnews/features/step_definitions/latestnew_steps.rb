Given /^I have no latestnews$/ do
  Latestnew.delete_all
end

Given /^I (only )?have latestnews titled "?([^\"]*)"?$/ do |only, titles|
  Latestnew.delete_all if only
  titles.split(', ').each do |title|
    Latestnew.create(:title => title)
  end
end

Then /^I should have ([0-9]+) latestnews?$/ do |count|
  Latestnew.count.should == count.to_i
end
