require "ruby-debug"
class Main
  get "/new" do 
    @post = Post.new
    haml :new
  end 

  get "/" do
    @posts = Post.all
    haml :index
  end

  get "/:permalink" do 
    permalink = params[:permalink]
    @post = Post.first(:permalink => permalink)
    haml :show
  end
  
  post "/" do
    @post = Post.new(params[:post])
    debugger
    @post.set_permalink
    if @post.save 
      redirect post_path(@post)
    else
      haml :new 
    end
  end
end

