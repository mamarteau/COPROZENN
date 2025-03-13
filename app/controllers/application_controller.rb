class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :compute_unread_messages_counter

  private

  def compute_unread_messages_counter
    @unread_messages_counter = 0
    return unless user_signed_in?

    current_user.chat_members.each do |cm|
      chatroom = cm.chatroom
      messages = chatroom.messages.where("created_at > ?", cm.connected_at)
      @unread_messages_counter += messages.count
    end
  end
end
