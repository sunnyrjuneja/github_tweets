class User < ActiveRecord::Base
  has_many :accounts, dependent: :destroy
  has_many :repositories, dependent: :destroy

  validates :provider, presence: true
  validates :uid, presence: true
  validates :nickname, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :token, presence: true

  before_create :create_remember_token

  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end

    def hash(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    def create_with_omniauth(auth)
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.nickname = auth['info']['nickname']
        user.name = auth['info']['name']
        user.email = auth['info']['email']
        user.token = auth['credentials']['token']
      end
    end
  end

  private
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
