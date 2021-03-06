class Session < ApplicationRecord
  belongs_to :study_group

  has_many :attachments, dependent: :destroy
  has_many_attached :photos
  has_many_attached :pdf

  validates :date, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :privacy, inclusion: { in: [true, false] }

  has_rich_text :content
end
