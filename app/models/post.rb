class Post
  include DataMapper::Resource

  property :id,	Serial 
  property :title,	String, :nullable => false
  property :permalink, String
  property :body,	Text


  has n, :comments
 
  private

  def set_permalink 
    self.permalink = title.gsub(/\s+/, "-")
  end 

end

class Comment 
  include DataMapper::Resource

  property :id,	Serial
  property :post_id, Integer, :nullable => false
  property :author, String, :nullable => false 
  property :body,	Text,	:nullable => false
  belongs_to :post
end

