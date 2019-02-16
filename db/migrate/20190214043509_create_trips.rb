# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :driver
      t.references :trip_source
      t.references :trip_destination
      t.datetime :departure_time
      t.integer :number_of_seats

      t.timestamps
    end
    add_foreign_key :trips, :users, column: :driver_id, primary_key: :id
    add_foreign_key :trips, :places, column: :trip_source_id, primary_key: :id
    add_foreign_key :trips, :places, column: :trip_destination_id, primary_key: :id
  end
end
