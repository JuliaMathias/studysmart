class Attachment < ApplicationRecord
  belongs_to :session

  validates :type, presence: true
  validates :name, presence: true

   enum type: {
    video: 0,
    reading: 1,
    quiz: 2
  }
end
