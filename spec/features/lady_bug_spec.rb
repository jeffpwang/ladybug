require 'feature_helper'

feature 'User creates an account' do
  scenario 'they see the user login form on the page' do
    visit new_user_path

    fill_in 'Name', with: 'Tommy'
    click_button 'Create User'

    expect(page).to have_css '.user-name'
end
end