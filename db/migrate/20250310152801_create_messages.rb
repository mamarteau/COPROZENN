class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.text :content
      t.references :chat_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
