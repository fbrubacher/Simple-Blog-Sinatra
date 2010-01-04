class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :nullable => false
  property :password, String, :nullable => false 

  class << self 

    def authenticate(username, password)
      user = User.first(:email => username)
      user.has_password?(password) ? user : false
    end

    def find(key)
      User.first(:id => key)
    end

  end

  def has_password?(password)
    return true if self.password.eql? password
    false
  end

end
