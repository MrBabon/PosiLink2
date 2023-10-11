class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user.admin? || user.director?
  end

  def edit
    user.admin? || user.director?
  end

  def update?
    user.admin? || user.director?
  end

  def destroy?
    user.admin? || user.director?
  end
  
  def show?
    true
  end
end
