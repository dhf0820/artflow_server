class UserPolicy < ApplicationPolicy

  def administrate?
    user && user.has_role?(:super_admin)
  end

  def index?
    user.has_role?(:super_admin)
  end
  def edit?
    user.has_role?(:super_admin) ||
    record == user ||
    user.employees.include?(record)
  end

  def update?
    user.has_role?(:super_admin) || record == user || user.employees.include?(record)
  end

  def new?
    user.has_role?(:super_admin)
  end

  def create?
    user.has_role?(:super_admin)
  end

  def show?
    user.has_role?(:super_admin)
  end

  def destroy?
    user.has_role?(:super_admin)
  end
end
