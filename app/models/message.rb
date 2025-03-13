class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :chat_member
  has_one :user, through: :chat_member
  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "chatroom_#{chatroom.id}_messages",
                        partial: "messages/message",
                        target: "messages",
                        locals: { message: self, user: user  }
  end
end
