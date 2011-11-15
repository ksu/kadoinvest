Given /^I have no newsfeeds$/ do
  Newsfeed.delete_all
end

Given /^I (only )?have newsfeeds titled "?([^\"]*)"?$/ do |only, titles|
  Newsfeed.delete_all if only
  titles.split(', ').each do |title|
    Newsfeed.create(:title => title)
  end
end

Then /^I should have ([0-9]+) newsfeeds?$/ do |count|
  Newsfeed.count.should == count.to_i
end
