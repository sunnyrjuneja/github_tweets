class Issue < ActiveRecord::Base
  validates :title,     presence: true
  validates :html_url,  presence: true
end
