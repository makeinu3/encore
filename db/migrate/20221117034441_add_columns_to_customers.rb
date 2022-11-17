class AddColumnsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :official, :boolean, default: false, null: false  # 公式アカウント
    add_column :customers, :cancel, :string                                  # 退会理由
  end
end
