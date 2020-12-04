class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
    # record.study_group.create_sessions
  end

  def show?
    true
  end

  def update?
    record.study_group.edit_session
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end
end
