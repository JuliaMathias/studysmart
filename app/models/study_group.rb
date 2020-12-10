class StudyGroup < ApplicationRecord
  # attr_accessor :email

  has_many :sessions, dependent: :destroy

  has_many :user_study_groups, dependent: :destroy
  has_many :users, through: :user_study_groups

  validates :creator_id, presence: false
  validates :name, presence: true
  validates :create_sessions,  inclusion: { in: [true, false] }
  validates :edit_session,  inclusion: { in: [true, false] }
end
