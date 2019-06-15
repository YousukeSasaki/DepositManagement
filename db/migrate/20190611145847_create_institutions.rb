class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.text :image
      t.integer :phone_number_one
      t.integer :phone_number_two
      t.integer :postal_code
      t.references :prefecture, foreign_key: true, optional: true
      t.string :city
      t.text :address
      t.text :building
      t.references :institution_type, foreign_key: true, optional: true
      t.timestamps
    end
    add_index :institutions, :name
    add_index :institutions, :kana
  end
end
