# frozen_string_literal: true

# == Schema Information
#
# Table name: pickups
#
#  id                    :bigint(8)        not null, primary key
#  departure_time        :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  passenger_id          :bigint(8)
#  pickup_destination_id :bigint(8)
#  pickup_source_id      :bigint(8)
#
# Indexes
#
#  index_pickups_on_passenger_id           (passenger_id)
#  index_pickups_on_pickup_destination_id  (pickup_destination_id)
#  index_pickups_on_pickup_source_id       (pickup_source_id)
#
# Foreign Keys
#
#  fk_rails_...  (passenger_id => users.id)
#  fk_rails_...  (pickup_destination_id => places.id)
#  fk_rails_...  (pickup_source_id => places.id)
#

class Pickup < ApplicationRecord
  belongs_to :passenger, class_name: 'User'
  belongs_to :source, class_name: 'Place', foreign_key: 'pickup_source_id'
  belongs_to :destination, class_name: 'Place', foreign_key: 'pickup_destination_id'
  # validations
  validates :departure_time, :passenger_id, :pickup_destination_id, :pickup_source_id, presence: true
end
