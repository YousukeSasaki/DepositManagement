class CreateBalances < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_balances do |t|
      t.references :customer, foreign_key: true
      t.integer :balance, null: false
      t.timestamps
    end
  end
end

