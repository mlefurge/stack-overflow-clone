class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :votable_type, presence: true
  validates :votable_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true
end
