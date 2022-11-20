class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|

      t.references :customer, type: :bigint, foreign_key: true, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
