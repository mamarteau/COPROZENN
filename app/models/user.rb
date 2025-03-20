class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents, dependent: :destroy
  has_many :votes
  has_many :decisions
  has_many :meetings
  belongs_to :coproperty
  has_many :chat_members
  has_many :chatrooms, through: :chat_members
  has_one_attached :photo

  USER_APPARTMENTS = {
    "app_1" => "irina@gmail.com",
    "app_2" => "glenda@gmail.com",
    "app_3" => "brinu@gmail.com",
    "app_4" => "claire@gmail.com",
    "app_5" => "jean@gmail.com",
    "app_6" => "antoine@gmail.com",
    "app_7" => "flore@gmail.com",
    "app_8" => "laura@gmail.com",
    "app_9" => "gil@gmail.com",
    "app_10" => "juliette@gmail.com"
  }

  def chatroom_with(other_user)
    other_user.chatrooms.find { |chatroom| chatroom.in?(self.chatrooms) && chatroom.users.count == 2 }
  end
end
