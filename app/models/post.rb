class Post < ApplicationRecord
  has_one_attached :image

   def self.search(search)
    if search != ""
     @post = Post.where(['location LIKE(?) OR description LIKE(?)', "%#{search}%", "%#{search}%"])
    else

    end
   end

end
