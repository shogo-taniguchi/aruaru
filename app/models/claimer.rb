class Claimer < ApplicationRecord
    belongs_to :user
    has_many :c_likes, dependent: :destroy
    has_many :c_liked_users, through: :c_likes, source: :user
    has_many :c_comments, dependent: :destroy
end
