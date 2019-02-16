# frozen_string_literal: true
# == Schema Information
#
# Table name: trips
#
#  id                  :bigint(8)        not null, primary key
#  departure_time      :datetime
#  number_of_seats     :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  driver_id           :bigint(8)
#  trip_destination_id :bigint(8)
#  trip_source_id      :bigint(8)
#
# Indexes
#
#  index_trips_on_driver_id            (driver_id)
#  index_trips_on_trip_destination_id  (trip_destination_id)
#  index_trips_on_trip_source_id       (trip_source_id)
#
# Foreign Keys
#
#  fk_rails_...  (driver_id => users.id)
#  fk_rails_...  (trip_destination_id => places.id)
#  fk_rails_...  (trip_source_id => places.id)
#

# trip model
class Trip < ApplicationRecord
  belongs_to :driver, class_name: 'User'
  belongs_to :source, class_name: 'Place', foreign_key: 'trip_source_id'
  belongs_to :destination, class_name: 'Place', foreign_key: 'trip_destination_id'
end
