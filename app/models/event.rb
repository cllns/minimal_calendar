class Event < ActiveRecord::Base
  validates :title, :url, :location, :start, presence: true
end
