class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  scope :public_rooms, -> { where(is_private: false) }
  after_create_commit { broadcast_if_public }
  before_validation :set_defaults

  has_many :participants, dependent: :destroy
  has_many :messages, dependent: :destroy

  def broadcast_if_public
    broadcast_append_to 'rooms' unless self.is_private
  end

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user: user, room_id: single_room.id)
    end
    single_room
  end

  def participant?(room, user)
    room.participants.where(user: user).exists?
    Participant.where(user_id: user.id, room_id: room.id).exists?
  end

  private  
  def set_defaults
    self.is_private = false if is_private.blank?
  end
end
