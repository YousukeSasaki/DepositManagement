class ChangeDataPostalCodeToInstitutions < ActiveRecord::Migration[5.2]
  def change
    change_column :institutions, :postal_code, :string
  end
end
