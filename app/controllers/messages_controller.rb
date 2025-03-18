class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @chat_member = @chatroom.chat_members.find_by(user: current_user)
    @message.chat_member = @chat_member

    if @message.save
      # respond_to do |format|
      #   format.turbo_stream do
      #     render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
      #       target: "messages",
      #       locals: { message: @message, user: current_user })
      #   end
      #   format.html { redirect_to chatroom_path(@chatroom) }
      # end
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
