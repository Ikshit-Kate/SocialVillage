# frozen_string_literal: true

class BusinessProduct < ApplicationRecord
  belongs_to :business

  validates :name, :brand, :price, :business_name, presence: true
end
