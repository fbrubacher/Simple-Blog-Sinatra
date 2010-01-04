ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"

begin
  require "bundler"
rescue LoadError
end

require "vendor/gems/environment.rb"
require "dm-core"
require "haml"
require "sass"
require "sinatra_more"
require "monk/glue"
require "sinatra_warden"
require 'rack-flash'

class Main < Monk::Glue
  set :app_file, __FILE__
  register SinatraMore::MarkupPlugin
  register SinatraMore::WardenPlugin
  register SinatraMore::RenderPlugin
  use Rack::Flash
  
  
  use Rack::Session::Cookie

  DataMapper.setup(:default, "sqlite3:inicio.sqlite3")
  DataObjects::Sqlite3.logger = DataObjects::Logger.new('./log/dm.log', :debug) 

  # Load all application files.
  Dir[root_path("app/**/*.rb")].each do |file|
    require file
  end

  if defined? Encoding
    Encoding.default_external = Encoding::UTF_8
  end

  #Post.auto_migrate!
  SinatraMore::WardenPlugin::PasswordStrategy.user_class = Main::User
end 

Main.run! if Main.run?
