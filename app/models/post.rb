class Post
  include DataMapper::Resource

  before :save, :set_permalink

  property :id,	Serial 
  property :title,	String, :nullable => false
  property :permalink, String
  property :body,	Text


  has n, :comments
 
  def set_permalink 
    self.permalink = title.gsub(/\s+/, "-")
  end 

end
