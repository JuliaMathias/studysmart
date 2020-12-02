class Session < ApplicationRecord
  belongs_to :study_group

  has_many :attachments

  has_many_attached :photos

  validates :date, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :privacy,  inclusion: { in: [true, false] }

  has_rich_text :content
end
