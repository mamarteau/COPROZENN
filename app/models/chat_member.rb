class ChatMember < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :messages

  validates :user, uniqueness: { scope: :chatroom }
end
