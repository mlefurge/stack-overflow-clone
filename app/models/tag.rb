class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  validates :category, presence: true

  def self.search(tag)
    search_tag = tag.downcase
    where("category LIKE ?", "#{search_tag}")
  end

  def self.sort_tags(list)
    list.sort_by { |tag| -1 * tag.questions.count }
  end

end
