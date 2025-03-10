class CreateDecisions < ActiveRecord::Migration[7.1]
  def change
    create_table :decisions do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :meeting, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
