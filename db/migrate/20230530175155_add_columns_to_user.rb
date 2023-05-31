class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_chef, :boolean, default: false
    add_column :users, :price, :float
    add_column :users, :description, :text
    add_column :users, :address, :string
  end
end
