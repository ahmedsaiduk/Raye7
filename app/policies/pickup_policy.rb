# frozen_string_literal: true

# picup plicy
class PickupPolicy < ApplicationPolicy
  def general?
    user.passenger?
  end
end
