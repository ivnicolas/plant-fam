class Plant < ActiveRecord::Base
    has_many :plant_lists
    has_many :users, through: :plant_lists
   

    validates :name, uniqueness: true
end 