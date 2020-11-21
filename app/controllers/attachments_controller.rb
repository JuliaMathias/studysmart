class AttachmentsController < ApplicationController
  # before_action :set_session, only: [:show]
 skip_before_action :authenticate_user!, only: [:index, :show]

  # def index
  #   @study_groups = policy_scope(StudyGroup).order(created_at: :desc)
  # end

  def show
     authorize(@attachment)
   end

  def create
    @attachment = Attachment.new(attachment_params)
    # attach
    authorize(@attachment)
    @attachment.session = Session.find(params[:session_id])
    if @attachment.save
      redirect_to session_path(@attachment.session)
    else
      redirect_to root_path
    end
  end




  private

  # def set_session
  #   @session = Session.find(params[:id])
  #   authorize(@session)
  # end

  # 1. checar se o usúario incluiu attachments ou não

  def attachment_params
    params.require(:attachment).permit(:attachment_type, :name, :url)
  end
end
