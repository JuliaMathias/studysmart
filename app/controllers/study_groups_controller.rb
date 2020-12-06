class StudyGroupsController < ApplicationController
  before_action :set_study_group, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @study_groups = policy_scope(StudyGroup).order(created_at: :desc)
  end

  def show
    @sessions = Session.where(study_group_id: @study_group.id)
    authorize(@study_group)
  end

  def new
    @study_group = StudyGroup.new
    authorize(@study_group)
  end

  def create
    @study_group = StudyGroup.create(study_group_params)
    @study_group.creator_id = current_user.id
    authorize @study_group
    @user_study_group = UserStudyGroup.create(user_id: current_user.id, study_group_id: @study_group.id)
    @study_group.save && @user_study_group.save ? (redirect_to study_group_path(@study_group)) : (render 'new')
  end

  def edit
    authorize(@study_group)
  end

  def update
    authorize(@study_group)
    @study_group.update(study_group_params)
    redirect_to study_group_path(@study_group)
  end

  def destroy
    authorize @study_group
    @study_group.destroy
    redirect_to root_path
  end

  private

  def set_study_group
    @study_group = StudyGroup.find(params[:id])
    authorize(@study_group)
  end

  def study_group_params
    params.require(:study_group).permit(:name, :description, :create_sessions, :edit_session)
  end
end
