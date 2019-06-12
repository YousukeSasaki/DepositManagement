class CreateCustomerInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_institutions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.timestamps
    end
    
  end
end
