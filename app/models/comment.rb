class Comment 
  include DataMapper::Resource

  property :id,	Serial
  property :post_id, Integer, :nullable => false
  property :author, String, :nullable => false 
  property :body,	Text,	:nullable => false
  belongs_to :post
end
