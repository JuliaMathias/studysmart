class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :stash ]

  def home
    # if params[:query].present?
    #   @study_groups = policy_scope(StudyGroup).search(params[:query])
    # else
    #   @study_groups = []
    # end
  end

  def profile
    @study_groups = current_user.study_groups
    @sessions = current_user.sessions.order(date: :asc)
    @upcoming_sessions = @sessions.select { |session| session.date > Date.today }
    @next_session = current_user.sessions.order(date: :desc).last
  end

  def stash

  end
end
