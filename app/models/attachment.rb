class Attachment < ApplicationRecord
  belongs_to :session

  validates :attachment_type, presence: true
  validates :name, presence: true

  enum attachment_type: {
    video: 0,
    reading: 1,
    quiz: 2
  }
end
