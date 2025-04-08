class AddTitleToGossip < ActiveRecord::Migration[8.0]
  def change
    add_column :gossips, :title, :string
  end
end
