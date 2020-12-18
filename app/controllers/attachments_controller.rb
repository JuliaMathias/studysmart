class AttachmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  YOUTUBE_BASE_URL = "https://www.youtube.com/embed/"

  def show
    authorize(@attachment)
  end

  def create
    if params[:attachment][:attachment_type] == "video"
      params[:attachment][:url] = YOUTUBE_BASE_URL + split_url(params[:attachment][:url])
    end
    @attachment = Attachment.new(attachment_params)
    authorize(@attachment)
    @attachment.session = Session.find(params[:session_id])
    @attachment.save ? (redirect_to session_path(@attachment.session)) : (redirect_to root_path)
  end

  private

  # 1. checar se o usúario incluiu attachments ou não
  def split_url(url)
    url.split(//).last(11).join
  end

  def attachment_params
    params.require(:attachment).permit(:attachment_type, :name, :url)
  end
end
