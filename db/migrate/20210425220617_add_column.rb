class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :user_plants, :has_been_watered, :boolean
  end
end
