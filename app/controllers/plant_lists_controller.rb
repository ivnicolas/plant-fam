class PlantListsController < ApplicationController
    get '/plantlists' do 
        @plant_lists = Plant_List.select{ |list| list.user_id == session[:user_id]} 
        erb :"plant_list/plantlists"
    end 
end 