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
require "monk/glue"

class Main < Monk::Glue
  set :app_file, __FILE__
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

Post.auto_migrate!

end 

Main.run! if Main.run?
