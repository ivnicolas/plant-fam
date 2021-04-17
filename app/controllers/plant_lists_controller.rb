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
        # binding.pry
        
        erb :"plant_list/index"
     else 
        redirect "/"
     end 
    end 

    # get "/plantlist/new" do 
    #   binding.pry
    #   if logged_in?
    #     erb :"plant_list/new"
    #   else 
    #     redirect "/"
    #   end 

    # end 

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

   #come back to this !
   patch "/plantlist/:listname" do 
    # binding.pry
    # newlistname=params[:new_list_name]
    if PlantList.find_by(list_name: params[:new_list_name]) || params[:new_list_name].presence == nil
    
      redirect "/plantlist/#{params[:listname]}/edit"
    elsif PlantList.where(:list_name => params[:listname]).update(:list_name => params[:new_list_name])
        redirect "/plantlist/#{params[:new_list_name]}"
    else 

      redirect "/plantlist/#{params[:listname]}/edit"
    end 
     #how can I check to see *if* it updated? And do I needs the 'params.delete(:_method)' line'

   end 


   delete "/plantlist/:listname" do
     # @list=PlantList.find_by(list_name:params[:listname])
     # PlantList.where('list_name = ?', params[:listname])
     #    @list=PlantList.all.select{|list| list.list_name == params[:listname]}
        PlantList.where('list_name = ?', params[:listname]).destroy_all
        redirect "/homepage"
   end 

   


end 