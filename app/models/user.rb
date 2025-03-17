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
end
