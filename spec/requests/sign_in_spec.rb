require 'spec_helper'

describe "Sign In Page" do
  before(:each) do
    User.create username: 'testuser',
                email: 'test@example.com',
                password: 'password',
                password_confirmation: 'password'
  end

  it "signs me in" do
    visit '/signin'
    expect(page).to have_content('Sign In')
    within('form') do
      fill_in 'Username', with: 'testuser'
      fill_in 'Password', with: 'password'
    end
    click_button 'Sign In'
  expect(page).to have_content 'Welcome back.'
  expect(page).to have_content "You're signed in as testuser"
  end
end
