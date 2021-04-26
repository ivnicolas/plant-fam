class UserPlant<ActiveRecord::Base
    belongs_to :plant
    belongs_to :user

    validates :list, presence: true

end  