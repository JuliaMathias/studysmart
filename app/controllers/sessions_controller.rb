class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  BASE_URL = 'http://studysmart.cc'

  def show
    authorize(@session)
    @session = Session.find(params[:id])
    @attachment = Attachment.new
    @videos = Attachment.where(session_id: @session.id, attachment_type: :video)
    @readings = Attachment.where(session_id: @session.id, attachment_type: :reading)
    @quizzes = Attachment.where(session_id: @session.id, attachment_type: :quiz)
    @url = BASE_URL + session_path(@session).to_s
    authorize(@attachment)
  end

  def new
    @study_group = StudyGroup.find(params[:study_group_id])
    @session = Session.new
    authorize(@session)
  end

  def create
    @session = Session.new(session_params)
    authorize(@session)
    @study_group = StudyGroup.find(params[:study_group_id])
    @session.study_group = StudyGroup.find(params[:study_group_id])
    @session.save ? (redirect_to session_path(@session)) : (render 'new')
  end

  def edit
    authorize(@session)
  end

  def update
    authorize(@session)
    @session.update(session_params)
    redirect_to session_path(@session)
  end

  def destroy
    authorize(@session)
    @study_group = @session.study_group
    @session.destroy
    redirect_to study_group_path(@study_group)
  end

  private

  def set_session
    @session = Session.find(params[:id])
    authorize(@session)
  end

  def session_params
    params.require(:session).permit(:date, :name, :content, :video_call, :privacy, photos: [], pdf: [])
  end
end
