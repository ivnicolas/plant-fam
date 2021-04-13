class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.string :name 
      u.string :email
      u.string :phone_number
      u.string :address
      u.string :city
      u.string :state
      u.string :zipcode
      u.string :password_digest
    end
  end
end
