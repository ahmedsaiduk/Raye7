# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :driver, null: false
      t.references :trip_source, null: false
      t.references :trip_destination, null: false
      t.datetime :departure_time, null: false
      t.integer :number_of_seats, null: false, default: 3

      t.timestamps
    end
    add_foreign_key :trips, :users, column: :driver_id, primary_key: :id
    add_foreign_key :trips, :places, column: :trip_source_id, primary_key: :id
    add_foreign_key :trips, :places, column: :trip_destination_id, primary_key: :id
  end
end
