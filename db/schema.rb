# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_214_043_509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'pickups', force: :cascade do |t|
    t.bigint 'passenger_id'
    t.bigint 'pickup_source_id'
    t.bigint 'pickup_destination_id'
    t.datetime 'departure_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['passenger_id'], name: 'index_pickups_on_passenger_id'
    t.index ['pickup_destination_id'], name: 'index_pickups_on_pickup_destination_id'
    t.index ['pickup_source_id'], name: 'index_pickups_on_pickup_source_id'
  end

  create_table 'places', force: :cascade do |t|
    t.string 'name', null: false
    t.decimal 'longitude', null: false
    t.decimal 'latitude', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[longitude latitude], name: 'index_places_on_longitude_and_latitude', unique: true
  end

  create_table 'trips', force: :cascade do |t|
    t.bigint 'driver_id', null: false
    t.bigint 'trip_source_id', null: false
    t.bigint 'trip_destination_id', null: false
    t.datetime 'departure_time', null: false
    t.integer 'number_of_seats', default: 3, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['driver_id'], name: 'index_trips_on_driver_id'
    t.index ['trip_destination_id'], name: 'index_trips_on_trip_destination_id'
    t.index ['trip_source_id'], name: 'index_trips_on_trip_source_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name', null: false
    t.bigint 'phone', null: false
    t.integer 'role', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'pickups', 'places', column: 'pickup_destination_id'
  add_foreign_key 'pickups', 'places', column: 'pickup_source_id'
  add_foreign_key 'pickups', 'users', column: 'passenger_id'
  add_foreign_key 'trips', 'places', column: 'trip_destination_id'
  add_foreign_key 'trips', 'places', column: 'trip_source_id'
  add_foreign_key 'trips', 'users', column: 'driver_id'
end
