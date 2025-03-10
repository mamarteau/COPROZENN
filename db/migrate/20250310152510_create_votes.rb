class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :decision, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :value

      t.timestamps
    end
  end
end
