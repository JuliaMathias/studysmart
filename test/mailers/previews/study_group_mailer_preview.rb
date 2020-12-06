# Preview all emails at http://localhost:3000/rails/mailers/study_group_mailer
class StudyGroupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/study_group_mailer/invite
  def invite
    StudyGroupMailer.invite
  end

end
