class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes, through: :questions
  has_many :votes, through: :answers
  has_many :votes, through: :comments

  validates :provider, :uid, presence: true, uniqueness: true
end
