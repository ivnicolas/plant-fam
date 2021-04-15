class UsersController < ApplicationController

    get '/homepage' do 
        @user=User.find_by_id(session[:user_id])
        # binding.pry
        # # session[:user_plant_list] = Plant_List.select{ |list| list.user_id == @user.id}
        # # u.plants.collect{|plant| plant.name}
        # @user_plant_list=@user.plant_list
        #@user_plant_list.collect{|list| list.list_name}.uniq
        erb :"users/homepage"
    end 
end 