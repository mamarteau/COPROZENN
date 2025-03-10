class Chatroom < ApplicationRecord
  belongs_to :coproperty
  has_many :chatmembers
  has_many :messages 
end
