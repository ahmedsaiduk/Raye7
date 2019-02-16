# frozen_string_literal: true

# apicup plicy
class TripPolicy < ApplicationPolicy
  def general?
    user.driver?
  end
end
