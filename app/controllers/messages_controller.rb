class MessagesController < ApplicationController
  def create
    @booking = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatromm
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
