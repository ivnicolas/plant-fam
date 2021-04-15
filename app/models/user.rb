class User < ActiveRecord::Base
    has_secure_password 
    has_many :plants, through: :plant_lists
    has_many :plant_lists 

    # validates :name, :email, presence: true
    # validates :email, uniqueness: true
end 