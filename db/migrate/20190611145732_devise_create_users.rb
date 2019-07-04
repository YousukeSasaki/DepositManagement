# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name,                    null: false
      t.string  :kana,                    null: false
      t.string  :email,                   null: false, default: ""
      t.string  :encrypted_password,      null: false, default: ""
      t.string   :reset_password_token,   null: false
      t.datetime :reset_password_sent_at, null: false
      t.datetime :remember_created_at,    null: false
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
