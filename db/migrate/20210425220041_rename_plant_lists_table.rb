class RenamePlantListsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :plant_lists, :user_plants
  end
end
