class User < ActiveRecord::Base
    has_secure_password 
    #has_many :plants, through: :plant_lists
    #has_many :plant_lists 
end 