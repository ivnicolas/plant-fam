require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "thisisoursessionsecret"
  end

  get "/" do
    erb :welcome
  end

  post "/" do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect to '/homepage'
    else 
        erb :welcome
    end
  end

  helpers do

    def logged_in?
      session[:user_id]
    end


    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end
    
  end

end

