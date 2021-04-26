class ChangeColumneNameUserPlants < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_plants, :list_name, :list
  end
end
