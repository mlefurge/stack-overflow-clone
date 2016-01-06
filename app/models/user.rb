class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes, through: :questions
  has_many :votes, through: :answers
  has_many :votes, through: :comments

  validates :provider, :uid, presence: true

  def self.from_omniauth(auth)
    u = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    u.name = auth.info.name
    u.oauth_token = auth.credentials.token
    u.oauth_expires_at = Time.at(auth.credentials.expires_at)
    u.save!
    u
  end

  def questions_answered
    answers = self.answers
    @questions_answered = []
    answers.each do |answer|
      @questions_answered << answer.question
    end
    @questions_answered
  end

  def self.recently_asked
    questions = Question.order(updated_at: :desc)
    @recently_asked = []
    questions.each do |question|
      @recently_asked << question.user
    end
    @recently_asked.uniq![0..14]
  end

  private

  def provider_params
    auth_params = auth.require(:provider)
  end

end
