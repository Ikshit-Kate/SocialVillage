class Business < ApplicationRecord
  belongs_to :user

  has_many_attached :images
  has_many :business_products
  has_many :orders
  has_many :reviews, dependent: :destroy

  validates :name, :email, :contact_number, :address, :owner_username, presence: true
  validates :name, :email, :contact_number, :address, uniqueness: true
  validates :contact_number, length: { is: 10 }

  scope :secretary, -> { where(role: 'secretary') }
end
