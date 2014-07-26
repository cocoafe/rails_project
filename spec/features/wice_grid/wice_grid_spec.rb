require 'spec_helper'

describe "Wice grid functionality", :js => true  do

	def sign_in 
		visit '/users/sign_in'
		fill_in 'Username:' , :with => 'admin'
		fill_in 'Password:' , :with => '12345678'
		click_button 'Sign in'
	end


	it "search in logs" do
		sign_in
		visit '/logs'
        fill_in('grid_f_aliens_alien_name', :with => 'Becker, Zulauf and Fadel')
		find(:css, '#grid_submit_grid_icon').click       
        
        within '.pagination_status' do
        page.should have_content('1-20 / 38')
        end
	end

	it "should filter by aliens" do
		sign_in
		visit '/logs'
		within 'div.wice-grid-container table.wice-grid thead' do
        click_on 'Alien'
        end

        expect(page).to have_content('Abbott, Reichert and Christiansen')
	end

	it "should filter by products" do
		sign_in
		visit '/logs'
		within 'div.wice-grid-container table.wice-grid thead' do
        click_on 'Product'
        end
        expect(page).to have_content('Awesome Cotton Gloves')
		
	end

	
end