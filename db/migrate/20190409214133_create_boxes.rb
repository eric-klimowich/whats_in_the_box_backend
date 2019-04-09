class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.string :label
      t.integer :length
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
