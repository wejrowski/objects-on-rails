class Blog
  attr_reader :entries
  attr_writer :post_source
  
  def initialize
    @entries = []
  end
  
  def title
    "Da Bomb Blog"
  end
  def subtitle
    "The coolest blog ever."
  end
  
  def new_post
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  def add_entry(entry)
    enries << entry
  end
 
  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end

end