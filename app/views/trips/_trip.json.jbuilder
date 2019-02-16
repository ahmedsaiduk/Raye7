# frozen_string_literal: true

json.extract! trip, :id, :driver_id, :trip_source_id, :trip_destination_id, :departure_time, :number_of_seats, :created_at, :updated_at
json.url trip_url(trip, format: :json)
