require_relative './config/init.rb'
require 'date'
set :run, true

# get '/' do
#   @name = "Bob Smith"
#   erb :"home"
# end

# get '/' do
#   @datetime = DateTime.now
#   erb :"time"
# end

get '/' do
  erb :"signup"
end

post '/signup' do
  user = User.new(params[:user])
  user.save
  if user.save
    erb :"thank_you"
  else
    erb :"signup"
  end
end  