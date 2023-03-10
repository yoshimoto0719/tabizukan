class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :description, presence: true, length: { maximum: 1000 }   # 空をバリデーション、文字数制限

  def self.search(search)
    if search
      @post = Post.where('location LIKE(?) OR description LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end

  def self.tag_search(tag_id)
    post_tags = PostTag.where(tag_id: tag_id).pluck(:post_id)
    Post.where(id: post_tags)
  end

  def favorited?(end_user)
   favorites.where(end_user_id: end_user.id).exists?
  end

end
