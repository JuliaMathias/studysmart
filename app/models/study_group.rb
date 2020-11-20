class StudyGroup < ApplicationRecord
  has_many :sessions
  has_many :user_study_groups

  validates :creator_id, presence: true
  validates :name, presence: true
  validates :create_sessions, presence: true
  validates :edit_session, presence: true
end
