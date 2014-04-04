class Webhook < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository

  validates :user, presence: true
  validates :repository, presence: true
  validates :gh_id, presence: true
end
