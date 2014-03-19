require 'spec_helper'

describe Snippet do
  before(:each) do
    @language = Language.create name: 'Ruby'
    @snippet = Snippet.new name: 'Just a Pretty Function',
                           description: 'This.',
                           content: 'puts "Hello"',
                           language_id: @language.id
  end

  it 'should be valid with valid attributes' do
    expect(@snippet).to be_valid
  end

  it 'should be public by default' do
    expect(@snippet.public).to_not be_nil
    expect(@snippet.public).to be_true
  end

  it 'generates a unique permalink' do
    @snippet.dup.save
    @snippet.permalink = Snippet.first.permalink
    expect(@snippet).to_not eq Snippet.first.permalink
    expect(@snippet.permalink).to_not be_nil
  end

  it 'should be itentified by its name in requests' do
    @snippet.save
    expect(@snippet.to_param).to eq @snippet.permalink
  end

  it 'should generate a name for itself if one is not provided' do
    @snippet.name = nil
    expect(@snippet.save).to be_true
    expect(@snippet.name).to_not be_nil
  end

  it 'should know how to syntax color its content' do
    Pygmentize.stub(:process) { 'correct' }
    expect(Pygmentize).to receive(:process).with(@snippet.content, @snippet.language.to_pygments)
    expect(@snippet.pretty_content).to eq 'correct'
  end
end
