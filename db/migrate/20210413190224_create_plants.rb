class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      
      t.string :name
      t.string :species
      t.string :sunlight_needs
      t.string :watering_needs
      t.string :best_environment

    end
  end
end
