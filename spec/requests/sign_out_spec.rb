require 'spec_helper'

describe "Sign out links" do
  before(:each) do
    User.create username: 'testuser',
                email: 'test@example.com',
                password: 'password',
                password_confirmation: 'password'
  end

  it "sign me out" do
    visit '/signin'
    expect(page).to have_content('Sign In')
    within('form') do
      fill_in 'Username', with: 'testuser'
      fill_in 'Password', with: 'password'
    end
    click_button 'Sign In'

    click_link 'Sign Out'
    expect(page).to_not have_content "You're signed in as testuser"
  end
end
