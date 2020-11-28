class SessionsController < ApplicationController
  before_action :set_session, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # def index
  #   @study_groups = policy_scope(StudyGroup).order(created_at: :desc)
  # end

  def show
    authorize(@session)
    @session = Session.find(params[:id])
    @attachment = Attachment.new
    @videos = Attachment.where(session_id: @session.id, attachment_type: :video)
    @readings = Attachment.where(session_id: @session.id, attachment_type: :reading)
    @quizzes = Attachment.where(session_id: @session.id, attachment_type: :quiz)
    authorize(@attachment)
  end

  def new
    @study_group = StudyGroup.find(params[:study_group_id])
    @session = Session.new
    authorize(@session)
  end

  def create
    @session = Session.new(session_params)
    # attach
    authorize(@session)
    @session.study_group = StudyGroup.find(params[:study_group_id])
    @session.save ? (redirect_to session_path(@session)) : (render 'new')
  end

  private

  def set_session
    @session = Session.find(params[:id])
    authorize(@session)
  end

  # 1. checar se o usúario incluiu attachments ou não - Oi Júlia =D

  def session_params
    params.require(:session).permit(:date, :name, :content, :video_call, :privacy, photos: [])
  end
end
