class CLike < ApplicationRecord
  belongs_to :claimer
  belongs_to :user
  validates_uniqueness_of :claimer_id, scope: :user_id
end
