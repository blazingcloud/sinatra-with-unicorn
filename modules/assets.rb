require 'sinatra/base'
class Assets < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "public") }
end
