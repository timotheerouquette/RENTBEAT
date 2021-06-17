class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def display?
    return true
  end

  def create?
    return true
  end

  def cancel?
    return true
  end

  def confirm?
    return true
  end
end
