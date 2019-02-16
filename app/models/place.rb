# frozen_string_literal: true

# == Schema Information
#
# Table name: places
#
#  id         :bigint(8)        not null, primary key
#  latitude   :decimal(, )      not null
#  longitude  :decimal(, )      not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_places_on_longitude_and_latitude  (longitude,latitude) UNIQUE
#

class Place < ApplicationRecord
  has_many :trip_sources, class_name: 'Trip', foreign_key: 'trip_source_id'
  has_many :trip_destinations, class_name: 'Trip', foreign_key: 'trip_destination_id'
  has_many :pickup_sources, class_name: 'Pickup', foreign_key: 'pickup_source_id'
  has_many :pickup_destinations, class_name: 'Pickup', foreign_key: 'pickup_destination_id'

  # validations
  validates :name, :latitude, :longitude, presence: true
  validates :latitude, uniqueness: { scope: :longitude }
end
