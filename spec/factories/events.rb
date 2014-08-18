FactoryGirl.define do
  factory :event do
    title "This is the TITLE for an event"
    url "http://example.com"
    location "This is a LOCATION for an event"
    start DateTime.now
  end
end

