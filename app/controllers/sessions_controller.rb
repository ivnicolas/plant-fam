class SessionsController < ApplicationController

    post "/" do
        @user = User.find_by(email: params[:email])
        # @user=User.find_by(username: params[:username], password: params[:password])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to '/homepage'
        else 
           
            erb :welcome
        end
    end

    get "/signup" do
        erb :"sessions/signup"
    end 
    
    post "/signup" do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/homepage"
        else
            erb :"sessions/signup"
        end
    end 

end 