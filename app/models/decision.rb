class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many :documents
  has_many :votes 
end
