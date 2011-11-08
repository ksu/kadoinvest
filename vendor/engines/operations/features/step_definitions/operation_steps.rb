Given /^I have no operations$/ do
  Operation.delete_all
end

Given /^I (only )?have operations titled "?([^\"]*)"?$/ do |only, titles|
  Operation.delete_all if only
  titles.split(', ').each do |title|
    Operation.create(:title => title)
  end
end

Then /^I should have ([0-9]+) operations?$/ do |count|
  Operation.count.should == count.to_i
end
