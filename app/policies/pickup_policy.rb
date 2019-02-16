# frozen_string_literal: true

# picup plicy
class PickupPolicy < ApplicationPolicy
  def show_nav?
    user.passenger?
  end
end
