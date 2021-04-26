class CreateUserPlants < ActiveRecord::Migration[5.2]
  def change
    create_table :user_plants do |l|
      l.string :associated_list
      l.integer :plant_id 
      l.integer :user_id
      l.string :plant_nickname
      l.string :size
      l.string :notes_on_tending
      l.boolean :has_been_watered

    end 
  end
end


