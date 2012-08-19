class Pic < ActiveRecord::Base
  attr_accessible :accessories, :age, :clothes, :emotion, :eye_color, :face_bottom, :face_left, :face_right, :face_top, :full_bottom, :full_left, :full_right, :full_top, :gender, :hair_color, :hair_length, :hair_style, :makeup, :physique, :race, :skin_color, :tags, :url, :weight
end
