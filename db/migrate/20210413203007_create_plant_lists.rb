class CreatePlantLists < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_lists do |l|
      l.string :list_name
      l.string :plant_id 
      l.string :user_id
      l.string :plant_nickname
      l.string :size
      l.string :notes_on_tending

    end 
  end
end


