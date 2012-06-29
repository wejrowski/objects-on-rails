class Post
  attr_accessor :blog, title, body
  
  


  # One of the central elements of object-oriented design is capturing the language of the domain in our models. 
  # Think for a minute about the language of blogging. No one says "I saved a blog post the other day". 
  # They say "I published a blog post" or maybe "I posted a blog entry". By calling the method #publish, 
  # we are continuing to build a system which echoes our mental model of the domain.
  
  def publish
  # I don't understand why you don't do a has_one blog.. or just make blog a column..?
  # what is blog.add_entry going to do?...
    blog.add_entry(self)
  end
  
end