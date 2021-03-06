class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 }
  has_many :p_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :post_liked_posts, through: :post_likes, source: :post
  def already_post_liked?(post)
    self.post_likes.exists?(post_id: post.id)
  end

  has_many :claimers, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  has_many :c_comments, dependent: :destroy
  has_many :c_likes, dependent: :destroy
  has_many :c_liked_claimers, through: :c_likes, source: :claimer
  def already_c_liked?(claimer)
    self.c_likes.exists?(claimer_id: claimer.id)
  end
end
