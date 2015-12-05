class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes, through: :questions
  has_many :votes, through: :answers
  has_many :votes, through: :comments

  validates :provider, :uid, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    u = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    u.name = auth.info.name
    u.oauth_token = auth.credentials.token
    u.oauth_expires_at = Time.at(auth.credentials.expires_at)
    u.save!
    u
  end

  private

  def provider_params
    auth_params = auth.require(:provider)
  end

end
