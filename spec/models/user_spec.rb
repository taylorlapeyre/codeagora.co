require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new username: 'testuser',
                     email: 'test@example.com',
                     password: 'password',
                     password_confirmation: 'password'
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is invalid with invalid attributes' do
    [:username, :email].each do |attribute|
      @user[attribute] = nil
      expect(@user).to_not be_valid
    end
  end

  it 'should have a unique username' do
    new_user = @user.dup
    new_user.email = "unique@email.com"
    new_user.save
    expect(@user).to_not be_valid
  end

  it 'should have a unique email' do
    new_user = @user.dup
    new_user.username = 'uniqueusername'
    new_user.save
    expect(@user).to_not be_valid
  end
end
