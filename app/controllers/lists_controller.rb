class ListsController < ApplicationController
  
  get "/list/new" do 
    if logged_in?
      @plants=Plant.all
      erb :"list/new"
    else 
      redirect "/"
    end 

  end 
  
  get '/list/:listname' do 
      if logged_in?
          @listname=params[:listname]
          user=User.find_by_id(session[:user_id])
          #find user_plants whose .list attribute matches listname
          @plants=user.user_plants.select{|plant| plant.list == @listname}
          # binding.pry
          erb :"list/show"
      else 
          redirect "/"
      end 
    end 

   get  "/list/:listname/edit" do 
      if logged_in?
        # binding.pry
          @lists= UserPlant.where('list = ?', params[:listname])  
          @listname= params[:listname]
          erb :"list/edit"
      else 
        # binding.pry
        redirect "/"
      end 
   end 

   get "/list/:listname/delete" do 
      if logged_in?
        @listname=params[:listname]
        erb :"list/delete"
      else 
        redirect "/"
      end 
   end 

   
   patch "/list/:listname" do 
      if UserPlant.find_by(list: params[:new_list_name]) || params[:new_list_name].presence == nil
        redirect "/list/#{params[:listname]}/edit"
      elsif UserPlant.where(:list => params[:listname]).update(:list => params[:new_list_name])
          redirect "/list/#{params[:new_list_name]}"
      else 
        redirect "/list/#{params[:listname]}/edit"
      end 
   end 


   delete "/list/:listname" do
        UserPlant.where(list: params[:listname], user_id: session[:user_id]).destroy_all
        redirect "/homepage"
   end 

  
end 