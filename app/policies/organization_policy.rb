class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    user.admin?
  end

  def create_event?
    user.admin? || (user.director? && user.organizations.include?(record))
  end

  def edit?
    user.admin? || user.director?
  end

  def update?
    # Vérifiez si l'utilisateur est un directeur de cette organisation
    user.directors.exists?(organization: record)
  end

  def index?
    true
  end

  def show?
    true
  end
end
