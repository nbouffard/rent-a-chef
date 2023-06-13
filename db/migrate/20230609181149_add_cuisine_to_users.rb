class AddCuisineToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cuisine, :string
  end
end
