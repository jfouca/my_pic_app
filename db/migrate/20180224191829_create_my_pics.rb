class CreateMyPics < ActiveRecord::Migration[5.1]
  def change
    create_table :my_pics do |t|
      t.string :text
      t.string :format
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
