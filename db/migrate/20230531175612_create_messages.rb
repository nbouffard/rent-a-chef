class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :chef, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
