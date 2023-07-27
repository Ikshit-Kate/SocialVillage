class Business < ApplicationRecord
  belongs_to :user
  validates :contact_number, length: { is: 10 }
  has_many_attached :images
  has_many :business_products
  has_many :orders
  has_many :reviews, dependent: :destroy
end
