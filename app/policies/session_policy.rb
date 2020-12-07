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
  end

  def show?
    true
  end

  def update?
    record.study_group.creator_id
  end

  def edit?
    update?
  end

  def destroy?
    record.study_group.creator_id
  end
end
