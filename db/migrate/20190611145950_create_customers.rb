class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.integer :sex, null: false
      t.date :birthday
      t.text :image
      t.string :phone_number
      t.string :cell_phone_number
      t.string :emergency_phone_number
      t.string :postal_code
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
