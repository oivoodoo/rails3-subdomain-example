Given /^the following accounts:$/ do |accounts|
  Account.create!(accounts.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) account$/ do |pos|
  visit accounts_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following accounts:$/ do |expected_accounts_table|
  expected_accounts_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I have "([^"]*)" account$/ do |count|
  count.to_i.times { Account.make }
end

Then /^I should see "([^"]*)" account$/ do |count|
  find("#accounts .account").size.should == count.to_i
end
