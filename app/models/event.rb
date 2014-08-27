class Event < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :start

  validates :title, :url, :location, :start, presence: true
end
