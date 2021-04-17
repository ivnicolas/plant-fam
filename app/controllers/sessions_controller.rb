class SessionsController < ApplicationController

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

    get '/signout' do
        session.clear
        # binding.pry
        redirect "/"
    end

end 