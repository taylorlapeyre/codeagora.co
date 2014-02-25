require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new username: 'testuser', email: 'test@example.com', password: 'password'
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'must have a username' do
    @user.username = ''
    expect(@user).to_not be_valid
  end

  it 'must have an email' do
    @user.email = ''
    expect(@user).to_not be_valid
  end

  it 'must have a password' do
    @user.password = ''
    expect(@user).to_not be_valid
  end

  it 'has a unique username' do
    new_user = @user.dup
    new_user.save
    expect(@user).to_not be_valid
  end

  it 'has a unique username' do
    new_user = @user.dup
    new_user.username = 'uniqueusername'
    new_user.save
    expect(@user).to_not be_valid
  end
end
