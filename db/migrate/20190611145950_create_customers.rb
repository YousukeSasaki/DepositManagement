class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.integer :sex, null: false
      t.date :birthday
      t.text :image
      t.integer :phone_number
      t.integer :sell_phone_number
      t.integer :emergency_phone_number
      t.integer :postal_code
      t.references :prefecture, foreign_key: true
      t.string :city
      t.text :address
      t.text :building
      t.date :start_date
      t.timestamps
    end
    add_index :customers, :name
    add_index :customers, :kana
  end
end
