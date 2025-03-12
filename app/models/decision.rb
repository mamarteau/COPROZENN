class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many :documents, as: :documentable
  has_many :votes
  
  attr_accessor :document_name, :document_tag
end
