class Document < ApplicationRecord
  belongs_to :user
  belongs_to :coproperty
  belongs_to :documentable, polymorphic: true
end
