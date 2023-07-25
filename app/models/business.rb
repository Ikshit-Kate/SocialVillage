class Business < ApplicationRecord
  belongs_to :user
  validates :contact_number, length: { is: 10 }
  has_many_attached :images
end
