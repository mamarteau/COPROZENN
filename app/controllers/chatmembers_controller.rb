class ChatmembersController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chat_member = ChatMember.new()
    # @vote.user = current_user
    @chatroom.chatmembers << @chat_member

    if @chat_member.save
      redirect_to chatroom_path(@chatroom)
    else
      render 
    end
  end
end
