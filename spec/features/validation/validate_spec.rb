require 'spec_helper'
describe 'validates' do

  def sign_in
    visit 'users/sign_in'
    fill_in 'Username:' , :with => 'admin'
    fill_in 'Password:' , :with => '12345678'
    click_button 'Sign in'
  end

  it 'should validate alien name presence' do
    sign_in
    visit 'aliens'
    click_link 'New Alien'
    click_button 'Create Alien'
    expect(page).to have_content("Alien name can't be blank")
  end

  it 'alien name can\'t be less than 3 characters' do
    sign_in
    visit 'aliens'
    click_link 'New Alien'
    fill_in 'Alien name', :with => 'ab'
    click_button 'Create Alien'
    expect(page).to have_content('Alien name is too short (minimum is 3 characters) ')
  end

  it 'validates log revenue month is\'t negative number' do
    sign_in
    visit 'logs'
    click_link 'New Log'
    fill_in 'Revenue month', :with => '-1'
    click_button 'Create Log'
    expect(page).to have_content('Revenue month must be greater than or equal to 0.0')
  end


end
