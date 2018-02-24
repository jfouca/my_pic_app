class AddUrlToMyPics < ActiveRecord::Migration[5.1]
  def change
    add_column :my_pics, :url, :string
  end
end
