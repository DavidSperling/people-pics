class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :url
      t.integer :full_top
      t.integer :full_bottom
      t.integer :full_left
      t.integer :full_right
      t.integer :face_top
      t.integer :face_bottom
      t.integer :face_left
      t.integer :face_right
      t.string :gender
      t.integer :age
      t.decimal :weight
      t.decimal :physique
      t.string :skin_color
      t.string :race
      t.string :hair_color
      t.string :hair_length
      t.string :hair_style
      t.string :eye_color
      t.string :clothes
      t.string :makeup
      t.string :accessories
      t.string :emotion
      t.string :tags

      t.timestamps
    end
  end
end
