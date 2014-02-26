require 'spec_helper'

describe "Users" do
  describe "Sign Up Page" do
    it "signs me up" do
      visit '/sign-up'
      expect(page).to have_content('Sign Up')
      within('form#new_user') do
        fill_in 'Username', with: 'myusername'
        fill_in 'Email',    with: 'my@email.com'
        fill_in 'Password', with: 'mypassword'
        fill_in 'Password confirmation', with: 'mypassword'
      end
      click_button 'Create Account'
      expect(page).to have_content 'Welcome to Agora.'
    end
  end
end
