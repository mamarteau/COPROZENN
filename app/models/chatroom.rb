class Chatroom < ApplicationRecord
  belongs_to :coproperty
  has_many :chat_members
  has_many :messages
  has_many :users, through: :chat_members
end
