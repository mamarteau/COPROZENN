class Coproperty < ApplicationRecord
has_many :chatrooms
has_many :documents
has_many :users
has_many :meetings
end
