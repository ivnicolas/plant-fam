class PlantList<ActiveRecord::Base
    belongs_to :plant
    belongs_to :user

    validates :list_name, presence: true
    # validates :list_name, uniqueness: true
end  