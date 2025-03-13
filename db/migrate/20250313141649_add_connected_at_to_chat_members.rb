class AddConnectedAtToChatMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :chat_members, :connected_at, :datetime, default: Time.now
  end
end
