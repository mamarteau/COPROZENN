class CreateCoproperties < ActiveRecord::Migration[7.1]
  def change
    create_table :coproperties do |t|
      t.string :name
      t.integer :total_surface

      t.timestamps
    end
  end
end
