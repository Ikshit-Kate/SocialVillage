# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :business

  validates :business_name, :customer_order, presence: true
end
