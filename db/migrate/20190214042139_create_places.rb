# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.decimal :longitude, null: false
      t.decimal :latitude, null: false

      t.timestamps
    end
    add_index :places, %i[longitude latitude], unique: true
  end
end
