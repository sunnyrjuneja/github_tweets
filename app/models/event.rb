class Event < ActiveRecord::Base
  belongs_to :repository

  validates :name, presence: true
  validates :action, presence: true
  validates :title, presence: true
  validates :number, presence: true
  validates :html_url, presence: true
  validates :login, presence: true
  validates :repository, presence: true
end
