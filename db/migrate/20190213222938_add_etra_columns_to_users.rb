# frozen_string_literal: true

class AddEtraColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer, limit: 8
    add_column :users, :role, :integer
  end
end
