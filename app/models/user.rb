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
    "app_7" => "irina@gmail.com",
    "app_8" => "glenda@gmail.com",
    "app_9" => "brinu@gmail.com",
    "app_10" => "claire@gmail.com"
  }
end
