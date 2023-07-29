class LocalAuthority < ApplicationRecord
  validates :department, :name, :contact_number, :address, :email, presence: true
  validates :contact_number, :address, :email, uniqueness: true
  validates :contact_number, length: { is: 10 }
  
  scope :secretary, -> { where(role: 'secretary') }

end
