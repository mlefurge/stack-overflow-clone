class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers

  validates :title, :content, :user_id, presence: true

  scope :newest, -> { order(created_at: :desc) }

  def associate_to_tags!(tag_list)
    self.tags.clear unless self.tags.empty?
    tag_list.each do |tag_name|
      new_tag = Tag.find_or_create_by(category: tag_name.strip)
      unless self.tags.include?(new_tag)
        self.tags << new_tag
      end
    end
  end

  def display_answers
    if self.answers.length > 1
      " #{self.answers.length} Answers"
    elsif self.answers.length == 1
      "1 Answer"
    else
      "No answers have been submitted."
    end
  end

  def answer_count
    if self.answers.length != 1
      "Answers"
    else
      "Answer"
    end
  end

end
