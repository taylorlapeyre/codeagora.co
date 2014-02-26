require 'spec_helper'

describe Language do
  before(:each) do
    @language = Language.new name: 'Ruby'
  end

  it 'is valid with valid attributes' do
    expect(@language).to be_valid
  end

  it 'is invalid without a name' do
    @language.name = nil
    expect(@language).to_not be_valid
  end

  it 'should have a unique name' do
    Language.create name: @language.name
    expect(@language).to_not be_valid
  end

  it 'should be identified by its name in requests' do
    expect(@language.to_param).to eq @language.name
  end

  it 'should know how to syntax color its description' do
    Pygmentize.stub(:process) { 'correct' }
    expect(@language.syntax_colored_description).to eq 'correct'
  end
end
