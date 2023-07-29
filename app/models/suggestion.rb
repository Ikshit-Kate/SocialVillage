class Suggestion < ApplicationRecord
  belongs_to :user
  validates :suggestion_body, presence: true, length: { minimum: 5 }
  scope :secretary, -> { where(role: 'secretary') }
end
