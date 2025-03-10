class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :coproperty
  has_many :documents
  has_many :decisions
end
