# frozen_string_literal: true

# == Schema Information
#
# Table name: trips
#
#  id                  :bigint(8)        not null, primary key
#  departure_time      :datetime         not null
#  number_of_seats     :integer          default(3), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  driver_id           :bigint(8)        not null
#  trip_destination_id :bigint(8)        not null
#  trip_source_id      :bigint(8)        not null
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
  # relations
  belongs_to :driver, class_name: 'User'
  belongs_to :source, class_name: 'Place', foreign_key: 'trip_source_id'
  belongs_to :destination, class_name: 'Place', foreign_key: 'trip_destination_id'
  # validations
  validates :trip_destination_id, :departure_time, :trip_source_id, :driver_id, presence: true
  validates :number_of_seats, numericality: { greater_than_or_equal_to: 3 }
  validate :departure_time_cannot_be_in_the_past
  def departure_time_cannot_be_in_the_past
    errors.add(:departure_time, "can't be in the past") if
    departure_time < Time.zone.now
  end
end
