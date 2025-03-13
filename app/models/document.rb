class Document < ApplicationRecord
  belongs_to :user
  belongs_to :coproperty
  belongs_to :documentable, polymorphic: true, optional: true
  has_one_attached :file


  def title
    return coproperty.name unless documentable.present?

    if documentable.is_a?(Meeting)
      return documentable.title
    else
      return documentable.description
    end
  end
end
