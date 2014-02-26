require 'spec_helper'

describe "Languages" do
  before(:each) { Language.create name: 'Ruby', description: 'puts "Hello World"' }

  describe "Index Page" do
    it 'lists all langauges' do
      visit '/languages'
      expect(page).to have_content 'Languages on Agora'
      expect(page).to have_content 'Ruby'
    end
  end

  describe "Show Page" do
    it "displays the language's name" do
      visit '/languages/Ruby'
      expect(page).to have_content 'Ruby Snippets'
    end
  end
end
