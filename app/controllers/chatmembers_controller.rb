class ChatmembersController < ApplicationController
  def create
    @chatroom = Chatroom.find(chatroom_params[:chatroom_id])
    @chat_member = ChatMember.new(chat_member_params)
    @chatroom.chatmembers << @chat_member

    if @chat_member.save
      redirect_to chatroom_path(@chatroom)
    else
      render
    end
  end

  private

  def chatroom_params
    params.require(:chat_member).permit(:chatroom_id)
  end

  def chat_member_params
    params.require(:chat_member).permit(:user)
  end
end
