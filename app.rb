require_relative './config/init.rb'
require 'date'
set :run, true
enable :sessions
after{ActiveRecord::Base.connection.close}

get '/' do
  @name = ""
  erb :"home"
end

# get '/' do
#   @datetime = DateTime.now
#   erb :"time"
# end

# Sign Up Form
get '/signup' do
  erb :"signup"
end

# End of Sign Up Form

# Log In Form
get '/login' do
  erb :"login"
end
# End of Log In Form

# Profile Page
get '/profile' do
  @message = session[:message]
  erb :"users/profile"
end

get '/users/:id' do
  # user = User.find_by(id: session[:id]) only can look at current_user's page.
  @user = User.find_by(id: params[:id])
    # some code here to find the user with the id given and render the profile page containing the user's infomation
  @message = session[:message]
  session[:message] = nil
  erb :"users/profile"
end

# End of Profile Page

post '/signup' do
  user = User.new(params[:user])
  user.save
  if user.save
    erb :"thank_you"
    
  else
    redirect '/signup'
  end
end

post '/login' do
  check = User.find_by(email: params[:user][:email])
  # byebug
    if check && check.authenticate(params[:user][:password])
      session[:user_id] = check.id
      # current_user
      @name = User.find_by_id(session[:user_id]).full_name
      session[:message] = "You have successfully logged in #{@name}."
      redirect "/users/#{check.id}" # => "/users/emikaijuin"
      byebug
      # puts Login
    else
      redirect '/login'
  end



  # user = User.new(params[:user])
  # if user.save
  #   erb :"thank_you"
  # else
  #   redirect '/login'

  #   find user from the db
  #   x = User.find_by(email: params[:user][:email])
  #   authenticate the password given is coorect
      
  #   login and redirect the user
  # end
end  

get '/logout' do
  session[:user_id] = 0
  redirect '/'
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  
end


# post '/login' do
#   # 1. find the user if it exist 
#   x = User.find_by(email: params[:email])
#   params[:password] # => 123456
# byebug 

#   if x.password == params[:password]
#     p "success"
#   else
#     p "wrong password"
#   end
  


# end

