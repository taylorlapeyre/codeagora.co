require 'spec_helper'

describe Snippets do
  before(:each) do
    @snippet = Snippet.new name: 'Just a Pretty Function',
    						description: 'This is a very pretty function to do things well.',
    						public: true,
    						permalink: 'sdfnsdkfj2323'
  end
  pending "add some examples to (or delete) #{__FILE__}"
end