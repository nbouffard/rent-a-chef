class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.string :comment
      t.date :date
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :chef, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
