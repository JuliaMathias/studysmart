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
    authorize(@study_group)
    @user_study_group = UserStudyGroup.create(user_id: current_user.id, study_group_id: @study_group.id)

    if @study_group.save && @user_study_group.save
      @email = params[:email]
      mail = StudyGroupMailer.with(study_group: @study_group, email: @email).invite
      mail.deliver_now
      redirect_to study_group_path(@study_group)
    else
      (render 'new')
    end
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
    authorize(@study_group)
    @study_group.destroy
    redirect_to root_path
  end

  private

  def set_study_group
    @study_group = StudyGroup.find(params[:id])
    authorize(@study_group)
  end

  def study_group_params
    params.require(:study_group).permit(:name, :create_sessions, :edit_session, :email)
  end
end
