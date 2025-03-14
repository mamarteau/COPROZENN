class AddTitleToDecisions < ActiveRecord::Migration[7.1]
  def change
    add_column :decisions, :title, :string
  end
end
