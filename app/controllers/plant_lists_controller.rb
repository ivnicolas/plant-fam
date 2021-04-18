class PlantListsController < ApplicationController
  
  get "/plantlist/new" do 
    if logged_in?
      erb :"plant_list/new"
    else 
      redirect "/"
    end 

  end 
  
  get '/plantlist/:listname' do 
      if logged_in?
          @listname=params[:listname]
          # @plant_lists = session[:user_plant_list]
          # @list_items= @plant_lists.collect{|list| list.plant_id} #this gives an array of of the plant ids
          # @list_items.collect {|plant| Plant.all.find_by_id(plant)}
          @user=User.find_by_id(session[:user_id])
          @plant_directory=Plant.all
          # Collects the contents of a particular list 
          @listcontents=[]
          
          erb :"plant_list/index"
      else 
          redirect "/"
      end 
    end 

   get  "/plantlist/:listname/edit" do 
      if logged_in?
        # binding.pry
          @lists= PlantList.where('list_name = ?', params[:listname])  
          @listname= params[:listname]
          erb :"plant_list/edit"
      else 
        # binding.pry
        redirect "/"
      end 
   end 

   get "/plantlist/:listname/delete" do 
      if logged_in?
        @listname=params[:listname]
        erb :"plant_list/delete"
      else 
        redirect "/"
      end 
   end 

   
   patch "/plantlist/:listname" do 
      if PlantList.find_by(list_name: params[:new_list_name]) || params[:new_list_name].presence == nil
        redirect "/plantlist/#{params[:listname]}/edit"
      elsif PlantList.where(:list_name => params[:listname]).update(:list_name => params[:new_list_name])
          redirect "/plantlist/#{params[:new_list_name]}"
      else 
        redirect "/plantlist/#{params[:listname]}/edit"
      end 
   end 


   delete "/plantlist/:listname" do
        PlantList.where(list_name: params[:listname], user_id: session[:user_id]).destroy_all
        redirect "/homepage"
   end 

  
end 