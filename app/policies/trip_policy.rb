# frozen_string_literal: true

# apicup plicy
class TripPolicy < ApplicationPolicy
  def show_nav?
    user.driver?
  end
end
