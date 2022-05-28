require 'rails_helper'
RSpec.feature 'Signup', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit user_registration_path
    expect(page).to have_content 'Sign up'
  end

  it 'click the login error' do
    visit 'users/sign_up'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end