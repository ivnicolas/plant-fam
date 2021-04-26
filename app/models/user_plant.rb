class UserPlant<ActiveRecord::Base
    belongs_to :plant
    belongs_to :user

    validates :associated_list, presence: true

end  