class AddStatusToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :status, :integer, default: 0, null: false
  end
end
