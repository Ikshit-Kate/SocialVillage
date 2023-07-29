class Broadcast < ApplicationRecord
  validates :heading, presence: true
  validates :body, presence: true

  scope :secretary, -> { where(role: 'secretary') }
end
