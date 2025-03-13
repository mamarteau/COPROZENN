class ChatroomsController < ApplicationController
  # :index, :show, :new, :create
  # before_action :set_coproperty, only: [:index, :show, :edit, :update]
  before_action :set_chatroom, only: [:show]

  def index
    @chatrooms = current_user.chatrooms
  end

  def show
  end

  private

  # def set_coproperty
  #   @coproperty = Coproperty.where(params[:id])
  # end
  #
  def set_chatroom
    @chatroom = Chatroom.where(params[:id])
  end
end
