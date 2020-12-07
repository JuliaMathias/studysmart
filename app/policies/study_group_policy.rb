class StudyGroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record.creator_id
  end

  def destroy?
    record.creator_id
  end
end
