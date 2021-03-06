# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      add_sign_in_tracking(t)

      t.timestamps null: false
    end
    add_indexes
  end

  private

  def add_sign_in_tracking(table)
    table.integer  :sign_in_count, default: 0, null: false
    table.datetime :current_sign_in_at
    table.datetime :last_sign_in_at
    table.inet     :current_sign_in_ip
    table.inet     :last_sign_in_ip
  end

  def add_indexes
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
