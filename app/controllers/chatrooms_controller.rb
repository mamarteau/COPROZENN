class ChatroomsController < ApplicationController
  # :index, :show, :new, :create
  # before_action :set_coproperty, only: [:index, :show, :edit, :update]
  before_action :set_chatroom, only: [:show]

  def index
    @chatrooms = current_user.chatrooms
  end

  def show
    @chat_member = ChatMember.new
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

  # def set_coproperty
  #   @coproperty = Coproperty.where(params[:id])
  # end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
