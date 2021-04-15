class UsersController < ApplicationController

    get '/homepage' do 
        @user=User.find_by_id(session[:user_id])
        @user_plant_list = Plant_List.select{ |list| list.user_id == @user.id}
        #@user_plant_list.collect{|list| list.list_name}.uniq
        erb :"users/homepage"
    end 
end 