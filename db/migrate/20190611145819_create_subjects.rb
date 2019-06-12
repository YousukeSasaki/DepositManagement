class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.integer :status, null: false
      t.string :ancestry
      t.timestamps
    end
    add_index :subjects, :ancestry
  end
end
