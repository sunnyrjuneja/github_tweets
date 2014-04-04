class Repository < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  has_one :webhook, dependent: :destroy

  validates :user, presence: true
  validates :gh_id, presence: true
  validates :name, presence: true
  validates :fork, inclusion: [true, false]
end
