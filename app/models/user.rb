# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_defaults

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  enum role: { society_member: 0, secretary: 1 }

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }

  has_many :messages, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :businesses
  has_many :events
  has_many :orders

  private

  def set_defaults
    self.role = "society_member" if role.blank?
  end
end
