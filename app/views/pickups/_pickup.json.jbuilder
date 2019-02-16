# frozen_string_literal: true

json.extract! pickup, :id, :passenger_id, :pickup_source_id, :pickup_destination_id, :departure_time, :created_at, :updated_at
json.url pickup_url(pickup, format: :json)
