class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.references :customer, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :place, null: false      # 公演会場
      t.string :show_name, null: false  # 公演名
      t.date :show_date, null: false    # 公演日

      t.timestamps
    end
  end
end
