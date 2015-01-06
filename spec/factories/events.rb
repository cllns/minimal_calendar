FactoryGirl.define do
  factory :event do
    title "This is the TITLE for an event"
    url "http://example.com"
    location "This is a LOCATION for an event"
    start_date (Time.zone.now + 10.days).strftime("%F")
    start_time Time.zone.now.strftime("%H:%M %Z")
  end
end
