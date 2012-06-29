# You may have noticed that we're not using any kind of Rails integration for setting up and running the tests. 
# We're not even relying on Rails constant autoloading. This is intentional. 
# By writing "plain old tests" which don't rely on any special Rails helpers, 
# we keep the tests isolated and force ourselves to be deliberate about creating any dependencies between our objects. 
# We anticipate that this will have a salutary effect on the object design which emerges from our TDD process.


require 'minitest/autorun'
require_relative '../../app/models/blog'

require 'ostruct'

describe Blog do
  before do
    @it = Blog.new
  end
  it "has no entries" do
    @it.entries.must_be_empty
  end
    
  describe "#new_post" do
    before do
      @new_post = OpenStruct.new
      @it.post_source = ->{ @new_post }
    end
    it "returns a new post" do
      @it.new_post.must_equal @new_post
    end
    it "sets the post's blog reference to itself" do
      @it.new_post.blog.must_equal(@it)
    end
  end
  
  describe "#add_entry" do
    it "adds the entry to the blog" do
      entry = Object.new
      @it.add_entry(entry)
      @it.entries.must_include(entry)
    end
    
    it "accepts an attribute hash on behalf of the post maker" do
      post_source = MiniTest::Mock.new
      post_source.expect(:call, @new_post, [{x: 42, y: 'z'}])
      @it.post_source = post_source
      @it.new_post(x: 42, y: 'z')
      post_source.verify
    end
  end
  
end
