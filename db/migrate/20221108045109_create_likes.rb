class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.references :customer, type: :bigint, foreign_key: true, null: false
      t.references :post, type: :bigint, foreign_key: true, null: false

      t.timestamps
    end
  end
end
