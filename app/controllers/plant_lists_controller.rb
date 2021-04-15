class PlantListsController < ApplicationController
    get '/:listname' do 
        # binding.pry
        @listname=params[:listname]
        # @plant_lists = session[:user_plant_list]
        # @list_items= @plant_lists.collect{|list| list.plant_id} #this gives an array of of the plant ids
        # @list_items.collect {|plant| Plant.all.find_by_id(plant)}
        @user=User.find_by_id(session[:user_id])
        @plant_directory=Plant.all
        # binding.pry
        erb :"plant_list/plantlists"
    end 
end 