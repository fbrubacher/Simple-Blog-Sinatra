class Main
  helpers do
    def post_path(post)
      "/post/#{post.permalink}"
    end
    def post_title 
      if @post and !@post.new_record?
        "Awesome Blog | #{@post.title}"
      else
        "Awesome Blog"
      end
    end
  end
end
