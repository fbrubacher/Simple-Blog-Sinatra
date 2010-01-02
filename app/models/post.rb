class Post
  include DataMapper::Resource

  property :id,	Serial 
  property :title,	String, :nullable => false
  property :permalink, String
  property :body,	Text


  has n, :comments
 
  def set_permalink 
    self.permalink = title.gsub(/\s+/, "-")
  end 

end
