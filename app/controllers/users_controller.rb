class UsersController < ApplicationController

    get '/homepage' do 
        if logged_in?
            @user=User.find_by_id(session[:user_id])
            # binding.pry
            # # session[:user_plant_list] = Plant_List.select{ |list| list.user_id == @user.id}
            # # u.plants.collect{|plant| plant.name}
            # @user_plant_list=@user.plant_list
            #@user_plant_list.collect{|list| list.list_name}.uniq
            erb :"users/homepage"
        else 
            redirect "/"
        end 
    end 

    post "/homepage" do 
        list = current_user.plant_lists.build(params)
        if list.save 
            redirect "/homepage"
        else 
            redirect "/plantlist/new"
        end
    end 

    get "/user" do 
        if logged_in?
            @session_user=User.find_by_id(session[:user_id])
            @user=User.find_by_id(session[:user_id])
            erb :"users/show"
        else
            redirect "/"
        end 
    end 

    get "/users/:id" do 
        if logged_in?
            # binding.pry
            @session_user=User.find_by_id(session[:user_id])
            @user=User.find_by_id(params[:id])
            # binding.pry
            erb :"users/show"
        else
            redirect "/"
        end 
    end 

    get "/user/edit" do 
        if logged_in?
        @user=User.find_by_id(session[:user_id])
        erb :"users/edit"
        else 
            redirect "/"
        end 
    end 

    patch "/user/edit" do 
        if logged_in?    
            @user = User.find_by_id(session[:user_id])
            params.delete("_method")
            @user.update(params)
            if @user.update(params) #Did We Make a Change?
                redirect "/user"
            else
                redirect "/user/edit"
            end
        else 
            redirect "/"
        end 
    end 
end 