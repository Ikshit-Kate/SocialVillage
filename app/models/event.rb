class Event < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy

  validates :event_name, :caption, :images, presence: true
end
