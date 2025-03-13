class Document < ApplicationRecord
  belongs_to :user
  belongs_to :coproperty
  belongs_to :documentable, polymorphic: true, optional: true
  has_one_attached :file

  
end
