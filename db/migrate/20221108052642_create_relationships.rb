class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      t.integer :follower_id  # フォローした
      t.integer :followed_id  # フォローされた

      t.timestamps
    end
  end
end
