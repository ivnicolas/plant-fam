class PlantListsController < ApplicationController
    get '/:listname' do 
     
        @listname=params[:listname]
        # @plant_lists = session[:user_plant_list]
        # @list_items= @plant_lists.collect{|list| list.plant_id} #this gives an array of of the plant ids
        # @list_items.collect {|plant| Plant.all.find_by_id(plant)}
        @user=User.find_by_id(session[:user_id])
        @plant_directory=Plant.all
        binding.pry
        erb :"plant_list/index"
    end 

    get "/plantlist/new" do 
        erb :"plant_list/new"
       end 

   get  "/:listname/edit" do 
        @lists= PlantList.where('list_name = ?', params[:listname])  
        @listname= params[:listname]
        erb :"plant_list/edit"
   end 

   get "/:listname/delete" do 
        @listname=params[:listname]
        erb :"plant_list/delete"
   end

   patch "/:listname" do 
   
     PlantList.where(:list_name => params[:listname]).update(:list_name => params[:new_list_name])
     # binding.pry
     redirect "/homepage"
     #how can I check to see *if* it updated? And do I needs the 'params.delete("_method")' line'

   end 


   delete "/:listname" do
     # @list=PlantList.find_by(list_name:params[:listname])
     # PlantList.where('list_name = ?', params[:listname])
     #    @list=PlantList.all.select{|list| list.list_name == params[:listname]}
        PlantList.where('list_name = ?', params[:listname]).destroy_all
        redirect "/homepage"
   end 

   


end 