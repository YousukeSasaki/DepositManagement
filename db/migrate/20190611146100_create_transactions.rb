class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :ts_number, null: false
      t.date :date, null: false
      t.references :customer, foreign_key: true
      t.references :subject, foreign_key: true
      t.integer :amount, null: false
      t.references :institution, foreign_key: true
      t.text :summary, limit: 100
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
