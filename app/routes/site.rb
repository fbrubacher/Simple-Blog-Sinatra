require "ruby-debug"
class Main
  get "/new" do 
    @post = Post.new
    haml :new
  end 

  get "/dashboard" do 
    @current_user = current_user
    haml :dashboard
  end

  get "/" do
    @posts = Post.all
    haml :index
  end

  get "/post/:permalink" do 
    permalink = params[:permalink]
    @comment = Comment.new
    @post = Post.first(:permalink => permalink)
    haml :show
  end

  get '/login' do
    haml_template 'session/login'
  end

  post '/login' do
    authenticate_user!
    redirect "/dashboard"
  end

  post '/unauthenticated/?' do
    flash[:notice] = "That username and password are not correct!"
    status 401
    haml_template 'session/login'
  end

  get '/logout' do
    logout_user!
    redirect '/'
  end
  
  post "/post/:permalink/comments" do |permalink| 
    @post = Post.first(:permalink => permalink) 
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      redirect post_path(@post)
    else
      haml :show 
    end
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

