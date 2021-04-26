class PlantsController < ApplicationController

    get "/:associated_list/plants/:plantname" do 
        if logged_in?
            @plant=Plant.find_by(name: params[:plantname])
          erb :"plant/show"
        else 
          redirect "/"
        end 
    
    end 

end 