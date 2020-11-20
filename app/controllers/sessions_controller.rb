class SessionsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :show]

  # def index
  #   @study_groups = policy_scope(StudyGroup).order(created_at: :desc)
  # end

  # def show
  #   authorize(@study_group)
  # end

  def new
    @study_group = StudyGroup.find(params[:study_group_id])
    @session = Session.new
    authorize(@session)
  end

  def create
    @session = Session.new(session_params)
    authorize(@session)
    @session.study_group = StudyGroup.find(params[:study_group_id])
    if @session.save
      redirect_to session_path(@session)
    else
      redirect_to root_path
    end
  end


  private

  # def set_study_group
  #   @study_group = StudyGroup.find(params[:id])
  #   authorize(@study_group)
  # end

  def session_params
    params.require(:session).permit(:date, :name, :content, :video_call, :privacy)
  end
end
