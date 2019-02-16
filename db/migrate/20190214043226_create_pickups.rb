# frozen_string_literal: true

class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.references :passenger
      t.references :pickup_source
      t.references :pickup_destination
      t.datetime :departure_time

      t.timestamps
    end
    add_foreign_key :pickups, :users, column: :passenger_id, primary_key: :id
    add_foreign_key :pickups, :places, column: :pickup_source_id, primary_key: :id
    add_foreign_key :pickups, :places, column: :pickup_destination_id, primary_key: :id
  end
end
