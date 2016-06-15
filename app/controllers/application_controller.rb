class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  enable :sessions
end

#     get '/' do
#       "Hello World from AppController!"
#       # erb :index
#     end
#
#     get '/landmarks' do
#       "You-fr App to landmarks!"
#     end
#
#     get '/root' do
#       "Root here!"
#     end
# end
