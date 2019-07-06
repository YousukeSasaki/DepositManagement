class ChangeDataPostalCodeToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :postal_code, :string
  end
end
