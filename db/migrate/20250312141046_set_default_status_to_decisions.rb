class SetDefaultStatusToDecisions < ActiveRecord::Migration[7.1]
  def change
    change_column_default :decisions, :status, from: nil, to: 0
    add_column :decisions, :accepted, :boolean, default: false
  end
end
