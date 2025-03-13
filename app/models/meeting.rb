class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :coproperty
  has_many :documents, as: :documentable
  has_many :decisions

  attr_accessor :document_name, :document_tag
 
end
