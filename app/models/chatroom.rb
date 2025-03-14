class Chatroom < ApplicationRecord
  belongs_to :coproperty
  has_many :chat_members
  has_many :messages
  has_many :users, through: :chat_members

  def number_unread_message_for(user)
    chat_member = user.chat_members.find_by(chatroom: self)
    messages = self.messages.where("created_at > ?", chat_member.connected_at)
    messages.count
  end
end
