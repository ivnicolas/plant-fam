class PlantsController < ApplicationController

    get "/:listname/plants/:plantname" do 
        if logged_in?
            @plant=Plant.find_by(name: params[:plantname])
          erb :"plant/show"
        else 
          redirect "/"
        end 
    
    end 

end 