class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers

  validates :title, :content, :user_id, presence: true
end
