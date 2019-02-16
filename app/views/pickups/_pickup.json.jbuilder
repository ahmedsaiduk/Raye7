# frozen_string_literal: true

json.extract! pickup, :id, :driver_id, :source_id, :destination_id, :departure_time, :created_at, :updated_at
json.url pickup_url(pickup, format: :json)
