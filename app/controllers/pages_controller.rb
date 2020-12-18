class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :stash ]

  def home; end

  def profile
    @study_groups = current_user.study_groups
    @sessions = current_user.sessions.order(date: :asc)
    @upcoming_sessions = @sessions.select { |session| session.date > Date.today }
    @next_session = @upcoming_sessions.first
  end

  def stash; end
end
