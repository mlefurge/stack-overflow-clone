class Answer < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :content, :user_id, :question_id, presence: true
end
