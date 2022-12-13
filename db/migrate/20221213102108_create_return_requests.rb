class CreateReturnRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :return_requests do |t|
      t.integer :customer_id
      t.boolean :approved

      t.timestamps
    end
  end
end
