class Post < ApplicationRecord
    belongs_to :user
    has_many :post_likes, dependent: :destroy
    has_many :post_liked_users, through: :post_likes, source: :user
    has_many :p_comments, dependent: :destroy
end
