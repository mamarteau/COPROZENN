class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :date
      t.string :link
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.references :coproperty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
