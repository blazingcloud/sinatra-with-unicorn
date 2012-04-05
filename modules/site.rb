# encoding: UTF-8
require 'sinatra/base'
class Site < Sinatra::Base
  set :root, Proc.new { File.join(File.dirname(__FILE__),'site' )}
  before '*' do
    @title = "Site"
  end
  get '/' do
    erb(:main)
  end
end


