class BookingPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def approve?
    record.console.user == user
  end

  def deny?
    record.console.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
