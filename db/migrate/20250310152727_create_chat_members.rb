class CreateChatMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_members do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
