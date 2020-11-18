class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # if params[:query].present?
    #   @study_groups = policy_scope(StudyGroup).search(params[:query])
    # else
    #   @study_groups = []
    # end
  end
end
