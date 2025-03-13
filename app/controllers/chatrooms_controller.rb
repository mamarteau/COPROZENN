class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show]

  def index
    @chatrooms = current_user.chatrooms
  end

  def show
    @chat_member = ChatMember.find_by(user: current_user, chatroom: @chatroom)
    @chat_member.update(connected_at: Time.now)
    @message = Message.new
    @other_user = @chatroom.users.where.not(id: current_user.id).first

  end

  def new
    @chatroom = Chatroom.new
    @chat_member = ChatMember.new
  end

  def create
  @chatroom = Chatroom.new
  @chatroom.coproperty = current_user.coproperty
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
