class AddHightPicHeightPicWidthToPic < ActiveRecord::Migration
  def change
    add_column :pics, :height, :integer
    add_column :pics, :img_height, :integer
    add_column :pics, :img_width, :integer
  end
end
