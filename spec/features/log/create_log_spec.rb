require 'spec_helper'

describe "Create log" do 

it "create log successfuly" do
 
 visit '/logs'
 click_link "New Log"
 fill_in 'Alien', :with => "Spork"
 fill_in 'Product', :with => "Rustic steel gloves"
 fill_in 'Destination', :with => "Earth"
 check 'Closed'
 fill_in 'Setup charge', :with => "124.3"
 fill_in 'Revenue month', :with => "5.1"
 

end
	
end