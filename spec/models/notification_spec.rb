require 'spec_helper'

describe Notification do
  before(:each) do
    @commenter = User.create username: 'commenter',
                     email: 'test@commenter.com',
                     password: 'password',
                     password_confirmation: 'password'
    @owner     = User.create username: 'owner',
                     email: 'test@ownder.com',
                     password: 'password',
                     password_confirmation: 'password'
    @snippet   = @owner.snippets.new content: 'puts "My Code"'
  end

  it 'is not valid without content' do
    notification = @owner.notifications.new(content: '')
    expect(notification).to_not be_valid
  end

  it 'gets created every time a user comments on a snippet' do
    @snippet.save
    @commenter.comments.create content: 'Awesome', snippet: @snippet
    expect(@owner.notifications.count).to eq 1
  end
end
