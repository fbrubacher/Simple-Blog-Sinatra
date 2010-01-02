class Main
  helpers do
    def post_path(post)
      "/#{post.permalink}"
    end
  end
end
