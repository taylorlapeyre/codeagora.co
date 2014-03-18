require 'spec_helper'

describe "Snippets" do
  before(:each) do
    @language = Language.create name: 'Ruby'
    @snippet = Snippet.create name: 'Just a Pretty Function',
                              description: 'This.',
                              content: 'puts "Hello"',
                              language_id: @language.id
  end

  describe "Index Page" do
    it 'lists all snippets' do
      visit '/snippets'
      expect(page).to have_content 'Snippets'
      expect(page).to have_content 'Just a Pretty Function'
    end
  end

  # describe "Show Page" do
  #   it "displays the snippet's name" do
  #     visit "/snippets/#{@snippet.permalink}"
  #     expect(page).to have_content 'Just a Pretty Function'
  #   end
  # end
end
