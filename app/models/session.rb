class Session < ApplicationRecord
  belongs_to :study_group

  has_many :attachments

  validates :date, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :privacy, presence: true
end
