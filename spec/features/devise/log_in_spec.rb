require 'spec_helper'

describe "devise logging" do
	def sign_in 
		visit 'users/sign_in'
		fill_in 'Username:' , :with => 'admin'
		fill_in 'Password:' , :with => '12345678'
		click_button 'Sign in'
	end

	it "sign in successful" do
		sign_in
		expect(page).to have_content('Signed in successfully')
	end

	it "logs out successful" do
		sign_in
		click_link 'Logout'
		expect(page).to have_content('You need to sign in or sign up before continuing.')
	end
end
	
