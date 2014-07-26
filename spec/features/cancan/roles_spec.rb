require 'spec_helper'

describe "cancan abilities " do
	def sign_in(user)
		visit 'users/sign_in'
		fill_in 'Username:' , :with => user
		fill_in 'Password:' , :with => '12345678'
		click_button 'Sign in'
	end

	it "lets admin manage logs" do
		sign_in("admin")
		visit 'logs'
		expect(page).to have_content('Listing Logs')
	end

	it "deny access to logs for reporter" do
		sign_in("reporter")
		visit 'logs'
		expect(page).to have_content('Access Denied!')

	end

end