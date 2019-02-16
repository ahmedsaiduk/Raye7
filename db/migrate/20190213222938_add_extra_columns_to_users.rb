# frozen_string_literal: true

class AddExtraColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone, :integer, limit: 8, null: false
    add_column :users, :role, :integer, null: false
  end
end
