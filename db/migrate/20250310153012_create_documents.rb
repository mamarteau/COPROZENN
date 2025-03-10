class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :like
      t.string :name
      t.string :tag
      t.references :user, null: false, foreign_key: true
      t.references :coproperty, null: false, foreign_key: true
      t.references :documentable, polymorphic: true

      t.timestamps
    end
  end
end
