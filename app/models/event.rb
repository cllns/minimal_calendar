class Event < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :start, default: -> { Time.zone.now } # default sets timezone

  validates :title, :url, :location, :start, presence: true
end
