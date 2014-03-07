require 'spec_helper'

describe Snippet do
  before(:each) do
    @snippet = Snippet.new name: 'Just a Pretty Function',
                           description: 'This.',
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
