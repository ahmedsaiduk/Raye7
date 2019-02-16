# frozen_string_literal: true

class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.references :passenger, null: false
      t.references :pickup_source, null: false
      t.references :pickup_destination, null: false
      t.datetime :departure_time, null: false

      t.timestamps
    end
    add_foreign_key :pickups, :users, column: :passenger_id, primary_key: :id
    add_foreign_key :pickups, :places, column: :pickup_source_id, primary_key: :id
    add_foreign_key :pickups, :places, column: :pickup_destination_id, primary_key: :id
  end
end
