class Account < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :nickname, presence: true
  validates :token, presence: true
  validates :secret, presence: true
end
