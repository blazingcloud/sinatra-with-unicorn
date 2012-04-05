require './module_loader'

map '/' do
  run Assets.new
end

# the above '/' works for Assets
# when i declare another '/'
# map '/' do
#  run Redirect.new
# end
# it doesn't remember any following '/' declaration
map '/' do
  run Site.new
end


