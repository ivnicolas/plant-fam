class UserPlantsController < ApplicationController
  
  get "/user_plants/new" do 
    if logged_in?
      @plants=Plant.all
      erb :"user_plants/new"
    else 
      redirect "/"
    end 

  end 
  
  get '/user_plants/:associated_list' do 
      if logged_in?
          @associated_list=params[:associated_list]
          user=User.find_by_id(session[:user_id])
          #find user_plants whose .associated_list attribute matches associated_list
          @plants=user.user_plants.select{|plant| plant.associated_list == @associated_list}
          # binding.pry
          erb :"user_plants/show"
      else 
          redirect "/"
      end 
    end 

   get  "/user_plants/:associated_list/edit" do 
      if logged_in?
        # binding.pry
          @associated_lists= UserPlant.where('associated_list = ?', params[:associated_list])  
          @associated_list= params[:associated_list]
          erb :"user_plants/edit"
      else 
        # binding.pry
        redirect "/"
      end 
   end 

   get "/user_plants/:associated_list/delete" do 
      if logged_in?
        @associated_list=params[:associated_list]
        erb :"user_plants/delete"
      else 
        redirect "/"
      end 
   end 

   
   patch "/user_plants/:associated_list" do 
      if UserPlant.find_by(associated_list: params[:new_associated_list]) || params[:new_associated_list].presence == nil
        redirect "/user_plants/#{params[:associated_list]}/edit"
      elsif UserPlant.where(:associated_list => params[:associated_list]).update(:associated_list => params[:new_associated_list])
          redirect "/user_plants/#{params[:new_associated_list]}"
      else 
        redirect "/user_plants/#{params[:associated_list]}/edit"
      end 
   end 


   delete "/user_plants/:associated_list" do
        UserPlant.where(associated_list: params[:associated_list], user_id: session[:user_id]).destroy_all
        redirect "/homepage"
   end 

  
end 