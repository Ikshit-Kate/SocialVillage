class LocalAuthority < ApplicationRecord
  validates :contact_number, length: { is: 10 }
end
