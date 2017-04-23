enable :sessions
require 'byebug'

get '/signup' do
  erb :"static/signup"
end


post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    flash[:img] = "<h1>user has been created.</h2>"
    redirect "/"
    else
    flash[:img] = "<h2> There is an error </h2>"
    @err_email = "Email: " + user.errors[:email].join(",")
    flash[:img] = @err_email
    @err_pass = "Password: " + user.errors[:password].join(",")
    flash[:img] = @err_pass
    erb :"/"
  end
end  

get '/login' do
  erb :"static/index"
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
 
  @user = User.find_by_email(params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session["user"] = @user.id
      # "<h2> Logged In </h2>"
      redirect '/'
    else
      flash[:img] = "<h2> Wrong password </h2>"
      erb :'static/login' #YOU STOP HERE
    end
end

get '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session["user"] = nil
  redirect '/'
end

get '/users/:id' do
  # some code here
  @user = User.find_by_id(params[:id])
  erb :'static/profile'
end


# post '/user/:id/edit' do
# 	user = User.find(params[:id])
# 	user.name = params[:user][:username]
# 	user.password = params[:user][:password]
# 	user.email = params[:user][:email]
# 	user.save
# 	# redirect '/user/'+params[:id]
# 	logged_in_redirect('/user/'+params[:id], '/')
#   end


